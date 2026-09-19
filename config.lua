-- DevNeganSmith | devnegansmith_headshots | v1.0.0

Config = {}

-- Al estar activado, un disparo real en el hueso de la cabeza mata al jugador
-- aunque el arma haya reducido su daño por distancia.
Config.Enabled = true

-- Solo se aplican a daño causado por otro jugador. Esto evita que caídas,
-- explosiones, vehículos, NPCs o daño ambiental se interpreten como headshots.
Config.PlayerVsPlayerOnly = true

-- Armas que nunca deben activar una muerte por headshot.
Config.ExcludedWeapons = {
    [`WEAPON_UNARMED`] = true,
    [`WEAPON_STUNGUN`] = true,
    [`WEAPON_FIREEXTINGUISHER`] = true,
    [`WEAPON_PETROLCAN`] = true,
    [`WEAPON_HAZARDCAN`] = true,
    [`WEAPON_FERTILIZERCAN`] = true,
}
