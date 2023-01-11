-- Réalisé par Galaxie Geek#1486 -- 

ESX = nil
local yes = true
local no = false
local notif2 = "esx:showAdvancedNotification"
local numbers = 8
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Event --
RegisterNetEvent('garme:vente')
AddEventHandler('garme:vente', function(arme, prix, nom)

    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    if Config.Money.Sale then
            xPlayer.removeAccountMoney('black_money', prix)
            xPlayer.addWeapon(arme, 99999)
            TriggerClientEvent(notif2, _src, 'SUCCES', '~g~Arme reçus~s~' , 'Vous avez reçus un/e ~r~' .. nom .. "~s~ que vous avez payé ~g~" .. prix .. "~s~$ d'argent sale", 'CHAR_WADE', numbers)
    else
        if prix <= xPlayer.getMoney() then
            xPlayer.removeMoney(prix)
            xPlayer.addWeapon(arme, 999999)
            TriggerClientEvent(notif2, _src, 'SUCCES', '~g~Arme reçus~s~' , 'Vous avez reçus un/e ~r~' .. nom .. "~s~ que vous avez payé ~g~" .. prix .. "~s~$", 'CHAR_WADE', numbers)
        else
            TriggerClientEvent(notif2, _src, 'ERREUR', '~r~Action Impossible~s~' , 'Vous n\'avez pas asser ~r~d\'argent propre~s~ !', 'CHAR_WADE', numbers)
        end
    end
end)