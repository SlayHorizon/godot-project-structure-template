[README.fr.md](./README.fr.md) — 🇫🇷 Version française *(French version)*

# Godot Project Structure Template
> A descriptive guide abour structuring and organizing a Godot project.

> [!TIP]
> **Ready-to-use Godot project template you can directly open in Godot.**

This template is a starting point for organising a Godot Project. Use it as inspiration and adapt it to your preferences and needs.

I created this template because I wanted a resource to share with people who asked me about structuring Godot projects,
but most examples I found were either too specific or simply mirrored Unity’s scenes/scripts split, which I find less practical for Godot due to duplication.  
So here it is.

## Principles

This project structure is based on a few principles that tend to scale well:

- Group related topics together.
- Separate raw assets from Godot-specific files.
- Keep structure shallow unless depth improves clarity.
- Favor consistency across naming, file layout, and behavior.
- All folder and file names should use `snake_case` (recommended by the [Godot style guide](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html#naming-conventions)).

You can adapt these principles or extend them to match your own style.  
Following them often leads to practical benefits, especially as projects grow:

## Benefits

Having a clear and consistent folder structure:

- Makes collaboration smoother as everyone knows where things go.
- Speeds up onboarding for new team members.
- Helps avoid duplicated files or logic.
- Reduces time spent searching for assets or scripts.
- Scales naturally as your game grows in complexity.

Whether you’re working solo or with a team, structure becomes invisible when it works and painful when it doesn’t.

---

## Root Folder

```bash
.
├── assets/      # Raw assets (art, audio, fonts, etc.)
├── data/        # Data files (saves, configs, translations, etc.)
└── source/      # All Godot scenes, scripts, and resources
```

- `assets/` and `data/` allow artists and non-programmers to contribute without navigating in your code source structure.
- You can merge `assets/` and `data/` if your team prefers.

## `source/` Folder

```bash
source/
├── main.tscn        # Entry point of the project
├── main.gd
├── features/        # Gameplay systems (map, entities, etc.)
├── ui/              # UI screens and reusable components
│   ├── common/
│   └── theme/
├── autoload/        # Global managers/singletons
├── utils/           # Optional: Helper scripts
└── shaders/         # Optional: Godot shaders
```

### Project Entry Point: `main.tscn` / `main.gd`

- Use `main.tscn` and `main.gd` to perform initial checks (settings, save migration, platform-specific logic, splash screens, etc.) before loading the actual game or menu.
> This is a common pattern I personally use in my Godot projects and helps keep startup logic separate from main scenes.

## `features/` Folder

The `features/` folder groups major gameplay systems. In smaller projects, you may choose to place these folders directly under `source/` for simplicity.

Each major system gets its own folder:

```bash
features/
├── map/
│   ├── map.gd
│   ├── map.tscn
│   └── levels/                  # Individual map levels
│       ├── dungeon.tscn
│       └── shop.tscn
├── entities/
│   ├── entity.gd                # Base entity (class_name Entity)
│   ├── components/
│   │   ├── attack.gd
│   │   └── health.gd
│   ├── enemies/
│   │   ├── enemy.gd             # Base enemy logic (extends entity.gd)
│   │   └── skeleton/
│   │       ├── skeleton.gd      # Skeleton-specific logic (extends enemy.gd)
│   │       └── skeleton.tscn
│   └── player/
│       ├── player.gd            # Player logic (extends entity.gd)
│       └── player.tscn
└── item/
	├── item.gd
	└── resources/
		├── bow.tres
		└── sword.tres
```

- Favor clarity over minimalism: it's okay to have a few levels of nesting if it helps organize logic.

## `ui/` Folder

Separate reusable components from full UI screens.

```bash
ui/
├── common/
│   ├── button.tscn
│   ├── popup.tscn
│   └── panel.tscn
├── theme/
│   ├── theme.tres
│   └── halloween.tres
├── boot_screen/
│   └── boot_screen.tscn
├── main_menu/
│   ├── main_menu.gd
│   └── main_menu.tscn
└── inventory/
	├── inventory.tscn
	├── inventory.gd
	└── item_slot.gd
```


## `autoload/` Folder

For global managers or systems that need to be accessible from anywhere:

```bash
autoload/
├── game_state.gd         # GameState autoload
├── event_bus.gd          # EventBus autoload 
└── transition_manager/   # TransitionManager autoload
	├── transition_manager.gd
	└── transition_manager.tscn
```

---

## Closing Notes

- Consider all the above as a helpful foundation, not a rulebook, but a flexible starting point you can adapt. Feel free to pick and choose what works best for your needs and preferences.
- Prefer a shallow structure where possible, it's often easier to navigate. But if more depth helps clarify ownership or logic, don't hesitate to use it.
- The default `addons/` folder is logically separate from the main project structure as each addon is self-contained and may organize its own `assets/`, `data/`, and `source/` folders in their own way.
- For multiplayer project examples, check out my other repos:
  - [godot-tiny-mmo](https://github.com/SlayHorizon/godot-tiny-mmo)
  - [godot-dedicated-server-example](https://github.com/SlayHorizon/godot-dedicated-server-example)

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

<details>
<summary>Credits</summary>
	
_Thanks to Axel (from the Godot Discord) for thoughtful feedback and suggestions that helped shape this template._

</details>
