local BANK = {
    Data = {}
}

local atmModels = {
    `prop_atm_01`, 
    `prop_atm_02`, 
    `prop_atm_03`, 
    `prop_fleeca_atm`
}

local activeBlips, bankPoints, atmPoints, markerPoints = {}, {}, {}, {}
local playerLoaded, uiActive, inMenu = false, false, false

--Functions
    -- General data collecting thread
    function BANK:Thread()
        self:CreateBlips()
        local data = self.Data
        data.ped = PlayerPedId()
        data.coord = GetEntityCoords(data.Ped)
        playerLoaded = true

        CreateThread(function ()
            while playerLoaded do
                data.coord = GetEntityCoords(data.ped)
                data.ped = PlayerPedId()
                bankPoints, atmPoints, markerPoints = {}, {}, {}

                if (IsPedOnFoot(data.ped) and not ESX.PlayerData.dead) and not inMenu then
                    for i = 1, #Config.AtmModels do
                        local atm = GetClosestObjectOfType(data.coord.x, data.coord.y, data.coord.z, 0.7, Config.AtmModels[i], false, false, false)
                        if atm ~= 0 then
                            atmPoints[#atmPoints+1] = GetEntityCoords(atm)
                        end
                    end

                    for i = 1, #Config.Banks do
                        local bankDistance = #(data.coord - Config.Banks[i].Position.xyz)
                        if bankDistance <= 0.7 then
                            bankPoints[#bankPoints+1] = Config.Banks[i].Position.xyz
                        end
                        if Config.ShowMarker and bankDistance <= (Config.DrawMarker or 10) then
                            markerPoints[#markerPoints+1] = Config.Banks[i].Position.xyz
                        end
                    end
                end

                if next(bankPoints) and not uiActive then
                    self:TextUi(true)
                end

                if next(atmPoints) and not uiActive then
                    self:TextUi(false, false)
                end

                if not next(bankPoints) and not next(atmPoints) and uiActive then
                    self:TextUi(false)
                end

                Wait(1000)
            end
        end)

        if not Config.ShowMarker then return end

        CreateThread(function()
            local wait = 1000
            while playerLoaded do
                if next(markerPoints) then
                    for i = 1, #markerPoints do
                        DrawMarker(20, markerPoints[i].x, markerPoints[i].y, markerPoints[i].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.2, 187, 255, 0, 255, false, true, 2, false, nil, nil, false)
                    end
                    wait = 0
                end
                Wait(wait)
            end
        end)
    end

    -- Handle text ui / Keypress
    function BANK:TextUi(state, atm)
        uiActive = state
        if not state then
            return ESX.HideUI()
        end
        ESX.TextUI(TranslateCap('press_e_banking'))
        CreateThread(function()
            while uiActive do
                if IsControlJustReleased(0, 38) then
                    self:HandleUi(true, atm)
                    self:TextUi(false)
                end
                Wait(0)
            end
        end)
    end

    -- Create Blips
    function BANK:CreateBlips()
        local tmpActiveBlips = {}
        for i = 1, #Config.Banks do
            if type(Config.Banks[i].Blip) == 'table' and Config.Banks[i].Blip.Enabled then
                local position = Config.Banks[i].Position
                local bInfo = Config.Banks[i].Blip
                local blip = AddBlipForCoord(position.x, position.y, position.z)
                SetBlipSprite(blip, bInfo.Sprite)
                SetBlipScale(blip, bInfo.Scale)
                SetBlipColour(blip, bInfo.Color)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName('STRING')
                AddTextComponentSubstringPlayerName(bInfo.Label)
                EndTextCommandSetBlipName(blip)
                tmpActiveBlips[#tmpActiveBlips + 1] = blip
            end
        end

        activeBlips = tmpActiveBlips
    end

    -- Remove blips
    function BANK:RemoveBlips()
        for i = 1, #activeBlips do
            if DoesBlipExist(activeBlips[i]) then
                RemoveBlip(activeBlips[i])
            end
        end
        activeBlips = {}
    end

    -- Open / Close ui
    function BANK:HandleUi(state, atm)
        atm = atm or false  -- S'assurer que c'est un ATM ou une banque
        SetNuiFocus(state, state)  -- Activer ou désactiver le focus de l'interface
        inMenu = state
        ClearPedTasks(PlayerPedId())  -- Annuler toutes les tâches du joueur
    
        if not state then
            SendNUIMessage({
                showMenu = false  -- Fermer le menu si l'état est false
            })
            return
        end
    
        -- Demander les données du joueur au serveur
        ESX.TriggerServerCallback('esx_banking:getPlayerData', function(data)
            SendNUIMessage({
                showMenu = true,
                openATM = atm,  -- Si c'est un ATM, le menu aura des données spécifiques
                datas = {
                    your_money_panel = {
                        accountsData = {
                            {name = "cash", amount = data.money},  -- Montant en liquide
                            {name = "bank", amount = data.bankMoney}  -- Montant en banque
                        }
                    },
                    bankCardData = {
                        bankName = "Banque Exemple",  -- Nom fictif de la banque
                        cardNumber = "2232 2222 2222 2222",  -- Numéro fictif de la carte
                        createdDate = "08/08",  -- Date de création fictive
                        name = data.playerName  -- Nom du joueur
                    },
                    transactionsData = data.transactionHistory  -- Historique des transactions
                }
            })
        end)
    end

    function BANK:LoadNpc(index, netID)
        CreateThread(function()
            while not NetworkDoesEntityExistWithNetworkId(netID) do
                Wait(200)
            end
            local npc = NetworkGetEntityFromNetworkId(netID)
            TaskStartScenarioInPlace(npc, Config.Peds[index].Scenario, 0, true)
            SetEntityProofs(npc, true, true, true, true, true, true, true, true)
            SetBlockingOfNonTemporaryEvents(npc, true)
            FreezeEntityPosition(npc, true)
            SetPedCanRagdollFromPlayerImpact(npc, false)
            SetPedCanRagdoll(npc, false)
            SetEntityAsMissionEntity(npc, true, true)
            SetEntityDynamic(npc, false)
        end)
    end

-- Events
RegisterNetEvent('esx_banking:closebanking', function()
    BANK:HandleUi(false)
end)

RegisterNetEvent('esx_banking:pedHandler', function(netIdTable)
    for i = 1, #netIdTable do
        BANK:LoadNpc(i, netIdTable[i])
    end
end)

RegisterNetEvent('esx_banking:updateMoneyInUI', function(doingType, bankMoney, money)
    SendNUIMessage({
        updateData = true,
        data = {
            type = doingType,
            bankMoney = bankMoney,
            money = money
        }
    })
end)

-- Handlers
    -- Resource starting
    AddEventHandler('onResourceStart', function(resource)
        if resource ~= GetCurrentResourceName() then return end
        BANK:Thread()
    end)

    -- Enable the script on player loaded 
    RegisterNetEvent('esx:playerLoaded', function()
        BANK:Thread()
    end)

    -- Disable the script on player logout
    RegisterNetEvent('esx:onPlayerLogout', function()
        playerLoaded = false
    end)

    -- Resource stopping
    AddEventHandler('onResourceStop', function(resource)
        if resource ~= GetCurrentResourceName() then return end
        BANK:RemoveBlips()
        if uiActive then BANK:TextUi(false) end
    end)

    RegisterNetEvent('esx:onPlayerDeath', function() BANK:TextUi(false) end)

-- Nui Callbacks
RegisterNUICallback('close', function(data, cb)
    BANK:HandleUi(false)
    cb('ok')
end)

RegisterNUICallback('clickButton', function(data, cb)
    if not data or not inMenu then
        return cb('ok')
    end

    TriggerServerEvent("esx_banking:doingType", data)
    cb('ok')
end)

RegisterNUICallback('checkPincode', function(data, cb)
    if not data or not inMenu then
        return cb('ok')
    end

    ESX.TriggerServerCallback("esx_banking:checkPincode", function(pincode)
        if pincode then
            cb({
                success = true
            })
            ESX.ShowNotification(TranslateCap('pincode_found'), "success")

        else
            cb({
                error = true
            })
            ESX.ShowNotification(TranslateCap('pincode_not_found'), "error")
        end
    end, data)
end)


--------------- OX TARGET ----------------

exports.ox_target:addModel(atmModels, {
    {
        name = 'atm_menu',  -- Le nom de l'interaction
        label = 'Utiliser l\'ATM',  -- Le label de l'option dans l'interaction
        icon = 'fa-solid fa-credit-card',  -- Icône de l'ATM
        onSelect = function(data)
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)

            -- Appeler la fonction pour afficher le menu bancaire
            BANK:HandleUi(true, true)  -- `true` pour indiquer qu'on utilise un ATM
        end
    }
}, {
    distance = 1.5 -- La distance d'interaction avec l'ATM
})



