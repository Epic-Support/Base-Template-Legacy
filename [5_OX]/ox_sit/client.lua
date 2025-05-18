
local sitting
local currentScenario
local disableControls = false
local currentObj
local currentChairCoords = nil

RegisterCommand('StandUp', function()
	StandUp()
end, false)

RegisterKeyMapping('StandUp', 'Wake up', 'keyboard', Config.Keyboard)

-- CreateThread: This function creates a new thread to run the specified function
-- The function initializes the Sitables table and iterates through the Config.Interactables to get the model hash key
-- It then adds the model hash keys to the Sitables table and waits for 100 milliseconds
-- Finally, it calls the addModel function from the ox_target module with the Sitables table and a table containing icon, label, event, and Distance properties
-- @param {function} func - The function to be executed in the new thread
CreateThread(function()
	local Sitables = {} -- Initialize a table to store model hash keys
	for _,v in pairs(Config.Interactables) do
		local model = GetHashKey(v) -- Get the model hash key for each item in Config.Interactables
		table.insert(Sitables, model) -- Add the model hash key to the Sitables table
	end
	Wait(100) -- Wait for 100 milliseconds
	exports.ox_target:addModel(Sitables, { -- Call the addModel function from the ox_target module
		{
			icon = Config.Visual.icon, -- The icon property from the Config.Visual table
			label = Config.Visual.label, -- The label property from the Config.Visual table
			event = "ox_sit:sit", -- The event property with value "ox_sit:sit"
			Distance = Config.MaxDistance -- The Distance property from the Config table
		},
	})
end)





-- Function to find the nearest interactable sitable object.
--@return object, distance - The nearest sitable object and its distance
function GetNearChair()
    local object, distance
    local coords = GetEntityCoords(PlayerPedId())

    -- Loop through each interactable object in the configuration
    for i=1, #Config.Interactables do
        -- Get the closest object of the specified type
        object = GetClosestObjectOfType(coords.x, coords.y, coords.z, 3.0, GetHashKey(Config.Interactables[i]), false, false, false)
        distance = #(coords - GetEntityCoords(object))
        -- Check if the object is within the maximum distance
        if distance < Config.MaxDistance then
            return object, distance
        end
    end
    -- Return nil if no suitable object is found
    return 0, nil
end

function SitDown(object, modelName, data)
    if not HasEntityClearLosToEntity(PlayerPedId(), object, 17) then
        return
    end

    disableControls = true
    currentObj = object
    FreezeEntityPosition(object, true)
    PlaceObjectOnGroundProperly(object)

    local pos = GetEntityCoords(object)
    local playerPos = GetEntityCoords(PlayerPedId())
    local objectCoords = vec3(pos.x, pos.y, pos.z)

	-- Check if the player is already sitting on this chair
    if currentChairCoords == objectCoords then
        lib.notify({
            title = Config.Visual.error,
            type = 'error'
        })
        return
    end

    lib.callback('ox_sit:getPlace', objectCoords, function(occupied)
        if occupied then
            lib.notify({
                title = Config.Visual.notification,
                type = 'info'
            })
        else
			currentChairCoords = objectCoords
            TriggerServerEvent('ox_sit:takePlace', objectCoords)
            currentScenario = data.scenario
            TaskStartScenarioAtPosition(PlayerPedId(), currentScenario, pos.x, pos.y, pos.z + (playerPos.z - pos.z)/2, GetEntityHeading(object) + 180.0, 0, true, false)
            Citizen.Wait(2500)
            if GetEntitySpeed(PlayerPedId()) > 0 then
                ClearPedTasks(PlayerPedId())
                TaskStartScenarioAtPosition(PlayerPedId(), currentScenario, pos.x, pos.y, pos.z + (playerPos.z - pos.z)/2, GetEntityHeading(object) + 180.0, 0, true, true)
            end
            sitting = true
        end
    end, objectCoords)
end


--- Stand up from the current scenario
function StandUp()
    -- Start the scenario at a specified position
    TaskStartScenarioAtPosition(PlayerPedId(), currentScenario, 0.0, 0.0, 0.0, 180.0, 2, true, false)
    -- Wait until the scenario is no longer in use
    while IsPedUsingScenario(PlayerPedId(), currentScenario) do
        Wait(100)
    end
    -- Clear the tasks of the player
    ClearPedTasks(PlayerPedId())
    -- Unfreeze the position of the player
    FreezeEntityPosition(PlayerPedId(), false)
    -- Unfreeze the position of the current object
    FreezeEntityPosition(currentObj, false)
    -- Trigger the server event to leave the place
    TriggerServerEvent('ox_sit:leavePlace', currentChairCoords)
    -- Reset the current scenario
    currentScenario = nil
    -- Set sitting status to false
    sitting = false
    -- Enable controls
    disableControls = false
    -- Reset the current chair coordinates
    currentChairCoords = nil
end


-- Add an event handler for the 'ox_sit:sit' event
RegisterNetEvent("ox_sit:sit")
AddEventHandler("ox_sit:sit", function()
	-- Check if the player is already sitting and not in the current scenario, then make the player stand up
	if sitting and not IsPedUsingScenario(PlayerPedId(), currentScenario) then
		StandUp()
	end
	-- If controls are disabled, then disable the control action for input 37 (E key)
	if disableControls then
		DisableControlAction(1, 37, true)
	end
	-- Get the nearest chair and its distance
	local object, distance = GetNearChair()
	-- If a chair is found within the maximum distance specified in the Config, then attempt to sit down on it
	if distance and distance < Config.MaxDistance then
		-- Get the model hash of the chair object
		local hash = GetEntityModel(object)
		-- Iterate through the Sitable objects in the Config and find a matching hash for the chair
		for k,v in pairs(Config.Sitable) do
			-- If a matching hash is found, sit down on the chair and break the loop
			if GetHashKey(k) == hash then
				SitDown(object, k, v)
				break
			end
		end
	end
end)