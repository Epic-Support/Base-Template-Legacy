local seatsTaken = {}

RegisterNetEvent('ox_sit:takePlace')
AddEventHandler('ox_sit:takePlace', function(objectCoords)
	seatsTaken[objectCoords] = true
end)

RegisterNetEvent('ox_sit:leavePlace')
AddEventHandler('ox_sit:leavePlace', function(objectCoords)
	if seatsTaken[objectCoords] then
		seatsTaken[objectCoords] = nil
	end
end)

lib.callback.register('ox_sit:getPlace',function(source, objectCoords)
    return seatsTaken[objectCoords]
end)
