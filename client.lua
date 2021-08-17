RegisterCommand("helicopter", function()
	RequestModel("PolMav")
	RequestModel("S_M_Y_Pilot_01")
	
	while not HasModelLoaded("PolMav") do
		Citizen.Wait(10)
	end
	
	while not HasModelLoaded("S_M_Y_Pilot_01") do
		Citizen.Wait(10)
	end
	
	local Helicopter = CreateVehicle("PolMav", GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 20.0, 100.0), GetEntityHeading(PlayerPedId()), false, false)
	local Pilot = CreatePed(0, "S_M_Y_Pilot_01", GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 18.0, 0.0), GetEntityHeading(PlayerPedId()), false, false)
	
	SetVehicleLivery(Helicopter, 0)
	SetVehicleLightsMode(Helicopter, 1)
	SetVehicleLights(Helicopter, 1)
	
	SetPedIntoVehicle(Pilot, Helicopter, -1)
	
	TaskHeliChase(Pilot, PlayerPedId(), -50.0, 0.0, 75.0)
	
	Citizen.Wait(600000)
	
	ClearPedTasks(Pilot)
	SetVehicleAsNoLongerNeeded(Helicopter)
	SetPedAsNoLongerNeeded(Pilot)
end)