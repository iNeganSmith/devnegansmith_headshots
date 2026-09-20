# Documentación - DevNeganSmith Headshots

## Descripción

`devnegansmith_headshots` es un recurso client-side para FiveM que escucha el evento nativo de daño de red y verifica si el jugador local recibió un impacto válido en la cabeza.

Cuando se cumplen las condiciones configuradas, establece la vida de la víctima en `0`, produciendo una muerte inmediata.

## Compatibilidad de frameworks

El recurso es **Standalone / Framework Independent**.

- Standalone: ✅
- ESX Legacy: ✅
- QBCore: ✅
- Qbox / QBX: ✅

No utiliza objetos, callbacks, exports o eventos propios de ESX, QBCore o Qbox.

## Archivos

### `fxmanifest.lua`

Define el recurso, autor, versión y archivos cargados por FiveM.

### `config.lua`

Contiene las opciones configurables.

### `client.lua`

Contiene la detección del daño y la lógica del headshot letal.

## Configuración

### Activar o desactivar

```lua
Config.Enabled = true
```

### Solo jugador contra jugador

```lua
Config.PlayerVsPlayerOnly = true
```

Con `true`, el atacante debe ser otro jugador.

### Armas excluidas

```lua
Config.ExcludedWeapons = {
    [`WEAPON_UNARMED`] = true,
    [`WEAPON_STUNGUN`] = true,
}
```

Añade aquí cualquier arma que no deba activar la muerte inmediata.

## Funcionamiento interno

El recurso escucha `CEventNetworkEntityDamage` y comprueba:

1. que el sistema esté activo;
2. que exista un atacante válido;
3. que se cumpla la condición PvP configurada;
4. que el atacante utilice un arma válida;
5. que el arma no esté excluida;
6. que el último hueso dañado sea la cabeza (`31086`).

Si todo es válido, establece la salud de la víctima en `0`.

Incluye una protección corta para evitar procesar dos veces el mismo evento.

## Dependencias

No requiere dependencias externas.

Tampoco requiere SQL, `ox_lib`, `ox_target`, ESX, QBCore ni `qbx_core`.

## Compatibilidad con sistemas médicos

La compatibilidad de framework es independiente de la compatibilidad de la lógica médica.

Como el recurso fuerza la salud del jugador a `0`, cualquier sistema que gestione muerte, last stand, revive, heridas, sangrado o invencibilidad puede modificar el resultado.

Se recomienda validar especialmente:

- `esx_ambulancejob`;
- `qb-ambulancejob`;
- `qbx_ambulancejob`;
- Wasabi Ambulance;
- ARS Ambulance;
- cualquier sistema médico personalizado.

## Instalación

```text
resources/[devnegansmith]/devnegansmith_headshots
```

```cfg
ensure devnegansmith_headshots
```

## Pruebas recomendadas

- disparo en cabeza de jugador;
- disparo al cuerpo;
- arma excluida;
- daño producido por NPC;
- interacción con last stand;
- interacción con ambulancia;
- respawn y revive;
- recursos que alteren daño o invencibilidad.

## Autor

- Autor: **DevNeganSmith**
- Recurso: `devnegansmith_headshots`
- Tipo: **Standalone / Framework Independent**
- Frameworks compatibles: **ESX Legacy, QBCore y Qbox/QBX**
- Versión: `1.0.1`

## Licencia y términos

Código bajo **MIT License**. Consulta [`LICENSE`](LICENSE) y [`TERMS.md`](TERMS.md).
