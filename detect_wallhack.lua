-- Anti-Wallhack pour FiveM : Détecte les comportements de raycast suspects
-- Créé par Meliodassge

local function detectSuspiciousRaycasts()
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)

    local raycastHit, _, _, _, entityHit = GetEntityPlayerIsFreeAimingAt(PlayerId())

    if raycastHit and entityHit ~= 0 then
        local entityType = GetEntityType(entityHit)
        if entityType == 1 then
            TriggerEvent('chat:addMessage', {
                args = { "^1[ANTI-WALLHACK]", "Comportement suspect détecté ! Wallhack potentiel." }
            })
            print("[ANTI-WALLHACK] Raycast suspect détecté pour le joueur : " .. GetPlayerName(PlayerId()))
        end
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        detectSuspiciousRaycasts()
    end
end)