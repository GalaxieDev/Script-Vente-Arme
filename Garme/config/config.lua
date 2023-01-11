-- Réalisé par Galaxie Geek#1486 -- 

Config = {}

Config.Blips = { -- https://docs.fivem.net/docs/game-references/blips/
    Afficher = false, -- Si le blips est affiché ou pas 
    Position = {vector3(94.692260742188, 3756.5744628906, 40.771026611328)}, -- Position du blips
    Sprite = 150, -- Type de blips
    Scale = 0.7, -- Taille du blips
    Color = 1 -- Couleur du blips
}

Config.Money = {
    Sale = false -- Si vous devez payer en argent sale, laisser sur true
}

Config.Pos = {
    Vente = {vector3(94.408195495605, 3755.7978515625, 40.771045684814)}, -- Position de la vente d'arme !
    Ped = {x = 94.692260742188, y = 3756.5744628906, z = 40.871026611328, h = 161.54428100585938} -- Position du Ped
}

Config.Marker = { -- https://docs.fivem.net/docs/game-references/markers/
    Type = 6, -- Type de marker
    ColorR = 99, -- Couleur du marker (Red)
    ColorG = 7, -- Couleur du marker (Green)
    ColorB = 7, -- Couleur du marker (Blue)
    Opacite = 280
}

Config.Banniere = {
    ColorR = 99, -- Couleur de la bannière (Red)
    ColorG = 7, -- Couleur de la bannière (Green)
    ColorB = 7 -- Couleur de la bannière (Blue)
}

Config.Armurerie = { -- Vous pouvez copier les lignes pour rajouter d'autres arme ^^
    {nom = "Pétoire", arme = "weapon_snspistol", prix = 950},
    {nom = "Pistolet", arme = "weapon_pistol", prix = 1200},
    {nom = "Pistolet Mitrailleur", arme = "weapon_machinepistol", prix = 1850},
    {nom = "Calibre 50", arme = "weapon_pistol50", prix = 2000},
    {nom = "Uzi", arme = "weapon_microsmg", prix = 2150},
    {nom = "SMG", arme = "weapon_smg", prix = 2850},
    {nom = "Fusil à pompe coupé", arme = "weapon_sawnoffshotgun", prix = 3100},
    {nom = "Fusil compact", arme = "weapon_compactrifle", prix = 4125},
    {nom = "AK-47", arme = "weapon_assaultrifle", prix = 12350},
}