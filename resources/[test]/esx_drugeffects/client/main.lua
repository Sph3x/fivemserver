ESX                  = nil
local IsAlreadyDrug = false
local DrugLevel     = -1

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

AddEventHandler('esx_status:loaded', function(status)

  TriggerEvent('esx_status:registerStatus', 'drug', 0, '#9ec617', 
    function(status)
      if status.val > 0 then
        return true
      else
        return false
      end
    end,
    function(status)
      status.remove(1500)
    end
  )

	Citizen.CreateThread(function()

		while true do

			Wait(1000)

			TriggerEvent('esx_status:getStatus', 'drug', function(status)
				
				if status.val > 0 then
					
          local start = true

          if IsAlreadyDrug then
            start = false
          end

          local level = 0

          if status.val <= 999999 then
            level = 0
          else
            overdose()
          end

          if level ~= DrugLevel then
          end

          IsAlreadyDrug = true
          DrugLevel     = level
				end

				if status.val == 0 then
          
          if IsAlreadyDrug then
            Normal()
          end

          IsAlreadyDrug = false
          DrugLevel     = -1

				end

			end)

		end

	end)

end)

--When effects ends go back to normal
function Normal()

  Citizen.CreateThread(function()
    
    local playerPed = GetPlayerPed(-1)
			
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(playerPed, 0)
    SetPedIsDrug(playerPed, false)
    SetPedMotionBlur(playerPed, false)
  end)

end

--In case too much drugs dies of overdose set everything back
function overdose()

  Citizen.CreateThread(function()

    local playerPed = GetPlayerPed(-1)
	
    SetEntityHealth(playerPed, 0)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(playerPed, 0)
    SetPedIsDrug(playerPed, false)
    SetPedMotionBlur(playerPed, false)

  end)

end

--Drugs Effects

--Weed
RegisterNetEvent('esx_drugeffects:onWeed')
AddEventHandler('esx_drugeffects:onWeed', function()
  
  local playerPed = GetPlayerPed(-1)
  
    RequestAnimSet("move_m@hipster@a") 
    while not HasAnimSetLoaded("move_m@hipster@a") do
      Citizen.Wait(0)
    end    

    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(9000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_m@hipster@a", true)
    SetPedIsDrunk(playerPed, true)
	
end)

--Opium
RegisterNetEvent('esx_drugeffects:onOpium')
AddEventHandler('esx_drugeffects:onOpium', function()
  
  local playerPed = GetPlayerPed(-1)
  
        RequestAnimSet("move_m@drunk@moderatedrunk") 
    while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
      Citizen.Wait(0)
    end    

    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(9000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)
    SetPedIsDrunk(playerPed, true)
	
 end)

--Meth
RegisterNetEvent('esx_drugeffects:onMeth')
AddEventHandler('esx_drugeffects:onMeth', function()
  
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)

        RequestAnimSet("move_injured_generic") 
    while not HasAnimSetLoaded("move_injured_generic") do
      Citizen.Wait(0)
    end    

    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(9000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_injured_generic", true)
    SetPedIsDrunk(playerPed, true)
    
end)

--Coke
RegisterNetEvent('esx_drugeffects:onCoke')
AddEventHandler('esx_drugeffects:onCoke', function()
  
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)

        RequestAnimSet("move_m@hurry_butch@a") 
    while not HasAnimSetLoaded("move_m@hurry_butch@a") do
      Citizen.Wait(0)
    end    

    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(9000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_m@hurry_butch@a", true)
    SetPedIsDrunk(playerPed, true)
    
end)

-- Lsd
RegisterNetEvent('esx_drugeffects:onlsd')
AddEventHandler('esx_drugeffects:onlsd', function()
  
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)

        RequestAnimSet("move_m@hurry_butch@a") 
    while not HasAnimSetLoaded("move_m@hurry_butch@a") do
      Citizen.Wait(0)
    end    

    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(9000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_m@hurry_butch@a", true)
    SetPedIsDrunk(playerPed, true)
    
end)

-- Héroine
RegisterNetEvent('esx_drugeffects:onheroine')
AddEventHandler('esx_drugeffects:onheroine', function()
  
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)

        RequestAnimSet("move_m@hurry_butch@a") 
    while not HasAnimSetLoaded("move_m@hurry_butch@a") do
      Citizen.Wait(0)
    end    

    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(9000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_m@hurry_butch@a", true)
    SetPedIsDrunk(playerPed, true)
    
end)

-- Extasie
RegisterNetEvent('esx_drugeffects:onexta')
AddEventHandler('esx_drugeffects:onexta', function()
  
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)

        RequestAnimSet("move_m@hurry_butch@a") 
    while not HasAnimSetLoaded("move_m@hurry_butch@a") do
      Citizen.Wait(0)
    end    

    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(9000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_m@hurry_butch@a", true)
    SetPedIsDrunk(playerPed, true)
    
end)
