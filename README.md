# Godot Project Structure Template

> [!NOTE]
> **Ready-to-use Godot project template you can directly open in Godot.**  
> Use this as inspiration, adapt the structure to your preferences and needs.

A feature oriented folder structure for Godot projects, designed not only for clarity but also to make team collaboration easier.  
I created this because I couldn't find good and simple project organization that weren't either too specific or just copying Unity's scenes/scripts split (which I dislike personally as it creates duplication).

This structure works well for most indie projects and small teams. Keep it simple, no need to overcomplicate things.


## Root Folder

```bash
.
├── assets/      # Raw assets (art, audio, fonts, etc.)
├── data/        # Data files (saves, configs, translations, etc.)
└── source/      # All Godot scenes, scripts, and resources
```

The `assets/` and `data/` folders are for easy collaboration with artists, so they can add files without touching the Godot project structure.
Some people may prefer to combine `assets/` and `data/` into a single folder. Use the structure that best fits your workflow.

## `source/` Folder

```bash
source/
├── main.tscn        # Project entry scene
├── main.gd          # Entry script
├── main_scenes/     # Root scenes (game, main menu, etc.)
├── features/        # Gameplay systems (map, entities, dialogue, etc.)
├── ui/              # Reusable UI and themes
│   ├── common/
│   └── theme/
├── utils/           # Helper scripts
├── autoload/        # Global managers/singletons
└── shaders/         # Custom shaders
```

### Project Entry Point: `main.tscn` / `main.gd`

- `main.tscn` and `main.gd` at the root of `source/` serve as the **project’s entry point**.
- Use these to perform initial checks (settings, save migration, platform-specific logic, splash screens, etc.) before loading the actual game or menu.
- This is a common pattern I personally use in my Godot projects and helps keep startup logic separate from main scenes.

### `features/` Folder

The `features/` folder groups major gameplay systems. In smaller projects, you may choose to place these folders directly under `source/` for simplicity.

Each major system gets its own folder:

```bash
features/
├── map/
│   ├── map.gd
│   ├── map.tscn
│   └── dungeon.tscn
├── entities/
│   ├── entity.gd
│   ├── entity.tscn
│   ├── player.gd
│   ├── npc.gd
│   └── enemy.gd
└── dialogue/
    ├── dialogue_manager.gd
    └── dialogue_box.tscn
```

### `main_scenes/` Folder

These are your "whole" scenes composed from features:

```bash
main_scenes/
├── boot_screen.tscn
├── main_menu.tscn
├── game.tscn
└── credits.tscn
```

> [!TIP]
> If you use scene-per-level swapping, this folder might not be useful.  
> The same applies if you use a single whole scene as your `main.tscn`.

### `ui/` Folder

```bash
ui/
├── common/
│   ├── button.tscn
│   ├── popup.tscn
│   └── panel.tscn
└── theme/
    ├── theme.tres
    └── halloween.tres
```

---

## Additional Notes

- For most indie games, this structure organization is enough.
- Keep it flat, not deep, easier to find things.
- For multiplayer examples, check out my other repos:
  - [godot-tiny-mmo](https://github.com/SlayHorizon/godot-tiny-mmo)
  - [godot-dedicated-server-example](https://github.com/SlayHorizon/godot-dedicated-server-example)
- The default `addons/` folder is logically separate from the main project structure as each addon is self-contained and may organize its own `assets/`, `data/`, and `source/` folders in their own way.

---

<details>
<summary>How to Use</summary>

1. Click "Use this template" on GitHub
2. Clone and open in Godot
3. Adapt the structure to your needs

</details>

<details>
<summary>Contributing</summary>

Suggestions and PRs welcome! If you have a structure that works well for your team, feel free to share it.

</details>
