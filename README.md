# El Tiburón

A mobile Godot game in development, built around short daily play sessions and mini-games. The intended session is roughly 15 minutes: play, make progress, and return another day. Progression mechanics are still being designed.

The Godot project starts at [`project.godot`](project.godot). Game scenes and scripts are under [`game/`](game/); the Convex backend is under [`convex/`](convex/). The current implementation includes authentication and a café scene with Sloffee.

See [`CONTEXT.md`](CONTEXT.md) for settled game terminology and [`AGENTS.md`](AGENTS.md) for coding-agent guidance. Development documentation is in English; player-facing text is in Spanish.

## Code organization

### File placement

Apply these rules to new work; preserve existing exceptions unless moving them is part of the task.

| Location | Responsibility |
| --- | --- |
| `game/scenes/<screen>/` | A screen's scene, matching script, and screen-specific resources. Keep existing groupings such as `game/scenes/auth/<screen>/`. |
| `game/components/<name>/` | Reusable UI scenes and their scripts. Keep one-off controls with their screen. |
| `game/avatar/<character>/` | Character scenes, scripts, and character behavior. |
| `<screen directory>/assets/` | Art used only by that screen. |
| `game/assets/` | Shared art. |
| `game/scripts/` | Application-wide autoload scripts, not screen-specific behavior. |

Use lowercase `snake_case` for files and directories. Keep a scene and its attached script together with matching basenames, such as `cafe.tscn` and `cafe.gd`.

### Ownership and navigation

- A screen owns its layout, control signal wiring, and local behavior.
- Reusable UI owns its internal behavior and exposes signals for actions the screen handles; it does not reach into other screens.
- Screens request top-level transitions through `Game.route_to(...)`. Register destinations in `Game.Route` and `Game.ROUTES`, and handle them in `Game.route_to(...)`; keep destination scene paths there.
- Scene-local state is disposable: leaving a screen frees its scene, and returning creates a fresh instance. Authentication survives through the existing autoloads; gameplay persistence is not yet defined.
- When new state must survive navigation, decide its owner and whether it must survive an application restart explicitly. Add an autoload only for a concrete cross-scene lifetime need, not merely because a new screen exists.

For example, a button leaving the café is wired in `game/scenes/cafe/cafe.gd`. Its destination gets a separate folder under `game/scenes/` and a registered route. The café requests navigation through `Game` rather than accessing the destination's nodes.
