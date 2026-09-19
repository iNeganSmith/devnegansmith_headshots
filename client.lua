-- DevNeganSmith | devnegansmith_headshots | v1.0.0

local HEAD_BONE = 31086
local lastHeadshot = 0

local function isValidHeadshot(victim, attacker, weapon)
    if not Config.Enabled or victim ~= PlayerPedId() or victim == attacker then
        return false
    end

    if not attacker or attacker == 0 or not IsEntityAPed(attacker) then
        return false
    end

    if Config.PlayerVsPlayerOnly and not IsPedAPlayer(attacker) then
        return false
    end

    -- 4 corresponde a armas de fuego; excluye golpes, cuchillos y vehículos.
    if not IsPedArmed(attacker, 4) then
        return false
    end

    if Config.ExcludedWeapons[weapon] then
        return false
    end

    local foundBone, bone = GetPedLastDamageBone(victim)
    return foundBone and bone == HEAD_BONE
end

AddEventHandler('gameEventTriggered', function(eventName, args)
    if eventName ~= 'CEventNetworkEntityDamage' then return end

    -- CEventNetworkEntityDamage: víctima, atacante y arma que produjo el daño.
    local victim = args[1]
    local attacker = args[2]
    local weapon = args[7]

    if not isValidHeadshot(victim, attacker, weapon) then return end

    -- Algunos recursos procesan el mismo evento más de una vez. El bloqueo
    -- corto evita ejecutar dos veces la muerte sin limitar tiros posteriores.
    local now = GetGameTimer()
    if now - lastHeadshot < 250 then return end
    lastHeadshot = now

    SetEntityHealth(victim, 0)
end)
