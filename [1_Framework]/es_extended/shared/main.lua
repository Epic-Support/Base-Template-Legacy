ESX = {}

exports("getSharedObject", function()
    return ESX
end)

AddEventHandler("esx:getSharedObject", function(cb)
    if ESX.IsFunctionReference(cb) then
        cb(ESX)
    end
    local invokingResource = GetInvokingResource()
end)

-- backwards compatibility (DO NOT TOUCH !)
Config.OxInventory = Config.CustomInventory == "ox"
