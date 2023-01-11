-- Réalisé par Galaxie Geek#1486 -- 
-- Définition ESX --
ESX = nil
local PlayerData = {}
local yes = true
local no = false

Citizen.CreateThread(function()
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

	while ESX == nil do Citizen.Wait(100) end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
     PlayerData = xPlayer
end)
--------------------------------------------------------------

Citizen.CreateThread(function()
    if Config.Blips.Afficher then
        for _, pos in pairs(Config.Blips.Position) do
            arme = AddBlipForCoord(pos)
            SetBlipSprite(arme, Config.Blips.Sprite)
            SetBlipScale(arme, Config.Blips.Scale)
            SetBlipColour(arme, Config.Blips.Color)
            SetBlipAsShortRange(arme, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Vente d'arme")
            EndTextCommandSetBlipName(arme)
        end
    end
end)

function Garmurerie()
    local Garmurerie = RageUI.CreateMenu("Vente d'Armes", "Acheter vos armes...")
    Garmurerie:SetRectangleBanner(Config.Banniere.ColorR, Config.Banniere.ColorG, Config.Banniere.ColorB)
        RageUI.Visible(Garmurerie, not RageUI.Visible(Garmurerie))
            while Garmurerie do
            Citizen.Wait(5)
            RageUI.IsVisible(Garmurerie, yes, yes, yes, function()

        for k,v in pairs(Config.Armurerie) do
        RageUI.ButtonWithStyle(v.nom, nil, {RightLabel = "~r~$" .. v.prix .. "~s~"},yes, function(Hovered, Active, Selected)
            if (Selected) then
                RageUI.Popup({message = "Attender 10 secondes le temps que Wade aille chercher votre arme !"})
                Citizen.Wait(10000)   
                TriggerServerEvent('garme:vente', v.arme, v.prix, v.nom)
            end
        end)
end

    end, function()
    end, 1)

            if not RageUI.Visible(Garmurerie) then
            Garmurerie = RMenu:DeleteType("Garmurerie", yes)
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

Citizen.CreateThread(function()
    while true do
        local interval = 1000
        local position = Config.Pos.Vente
        for _, v in pairs(position) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                local displ = 3000
                if distance <= 10.0 then
                    interval = 0    
                    DrawMarker(Config.Marker.Type, v.x, v.y, v.z - 0.9, 0.0, 0.0, 360.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, Config.Marker.ColorR, Config.Marker.ColorG, Config.Marker.ColorB, Config.Marker.Opacite, false, false, p19, false, false, false, false)
                    if distance <= 1.5 then
                        RageUI.Text({message = "Appuyez sur ~b~[E]~s~ pour parler à Wade", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            FreezeEntityPosition(PlayerPedId(), yes)    
                            RageUI.Text({message = "{~b~Vous~s~} Salut Wade, j'aurai besoin d'une arme !", time_display = displ})
                            Citizen.Wait(displ)
                            RageUI.Text({message = "{~r~Wade~s~} Aucun soucis, voilà ce que j'ai en stock", time_display = displ})
                            Citizen.Wait(displ)    
                            RageUI.Text({message = "{~b~Vous~s~} Merci !", time_display = displ})
                            Citizen.Wait(displ)  
                        Garmurerie()
        end
    end
    end
    Citizen.Wait(5)
    end
end
end)

-- Ped -- 
local yes = true
local name = "cs_wade"
local type = "PED_TYPE_CIVMALE"

Citizen.CreateThread(function()
    local hash = GetHashKey(name)
        while not HasModelLoaded(hash) do
        RequestModel(hash)
    Wait(2000)
    end 
   local ped = CreatePed(type, name, Config.Pos.Ped.x,Config.Pos.Ped.y,Config.Pos.Ped.z-1.0, Config.Pos.Ped.h, false, yes) 
    SetBlockingOfNonTemporaryEvents(ped, yes) 
    FreezeEntityPosition(ped, yes)
    SetEntityInvincible(ped, yes)
    end)