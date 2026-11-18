# DRH Tuner Panel

A small, stable-API mod for Dungeon Rampage Haxe.

<!-- drh:show -->
Press **F6** to show or hide the in-game panel. It displays three saved presets:

- Movement speed multiplier (1.0x–3.0x)
- Damage multiplier (1.0x–5.0x)
- Attack-area multiplier (1.0x–3.0x)

Change the values in the game's **MODS** settings. The settings are persisted by the official mod API.

**Important:** this first version is a configuration/overlay prototype. The sliders do not alter gameplay. The stable mod API exposes no supported mutators for movement, damage, or projectile collision, and online combat outcomes are controlled by the game server. It does not bypass or conceal itself from anti-cheat.
<!-- /drh:show -->

## Run locally

From a clone of this game repository, use the DRH Launcher command described in [Making a mod](https://github.com/verox-source/Dungeon-Rampage-Haxe/blob/master/docs/making-a-mod.md):

`DRH-Launcher --run-mod <absolute-path-to-this-folder>`

The mod requires the official API mod version 1.5 or later within the same major version. It uses only the stable API and does not require the `extends` permission.
