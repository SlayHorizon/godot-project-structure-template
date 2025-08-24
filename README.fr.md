[README.md](./README.md) — 🇺🇸 English version *(Version anglaise)*

# Godot Project Structure Template
> Un guide descriptif sur la structuration et l'organisation d'un projet Godot.

> [!TIP]
> **Template Godot prêt à l'emploi que vous pouvez ouvrir directement dans Godot.**

Ce template est un point de départ pour organiser un projet Godot. Utilisez-le comme inspiration et adaptez-le à vos préférences et besoins.

J'ai créé ce template parce que je voulais une ressource à partager avec les personnes qui me demandaient comment structurer des projets Godot,
mais la plupart des exemples que j'ai trouvés étaient soit trop spécifiques, soit simplement une copie de la séparation scenes/scripts d'Unity, ce que je trouve moins pratique pour Godot à cause de la duplication.
Alors le voici.

## Principes

Cette structure de projet est basée sur quelques principes qui tendent à bien s'adapter:

- Grouper les sujets connexes ensemble.
- Séparer les assets bruts des fichiers spécifiques à Godot.
- Garder la structure peu profonde sauf si la profondeur améliore la clarté.
- Privilégier la cohérence dans la nomenclature, la disposition des fichiers et le comportement.
- Tous les noms de dossiers et de fichiers doivent utiliser `snake_case` (recommandé par le [guide de style Godot](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html#naming-conventions)).

Vous pouvez adapter ces principes ou les étendre pour correspondre à votre propre style.
Les suivre mène souvent à des bénéfices pratiques, surtout quand les projets grandissent :

## Bénéfices

Avoir une structure de dossiers claire et cohérente:

- Rend la collaboration plus fluide car tout le monde sait où vont les choses.
- Accélère l'intégration des nouveaux membres de l'équipe.
- Aide à éviter les fichiers ou la logique dupliqués.
- Réduit le temps passé à chercher des assets ou des scripts.
- S'adapte naturellement quand votre jeu grandit en complexité.

Que vous travailliez seul ou en équipe, la structure devient invisible quand elle fonctionne et douloureuse quand elle ne fonctionne pas.

---

## Dossier racine

```bash
.
├── assets/      # Assets bruts (art, audio, polices, etc.)
├── data/        # Fichiers de données (sauvegardes, configs, traductions, etc.)
└── source/      # Toutes les scènes, scripts et ressources Godot
```

- `assets/` et `data/` permettent aux artistes et non-programmeurs de contribuer sans naviguer dans votre structure de code source.
- Vous pouvez fusionner `assets/` et `data/` si votre équipe préfère.

## Dossier `source/`

```bash
source/
├── main.tscn        # Point d'entrée du projet
├── main.gd
├── features/        # Systèmes de gameplay (carte, entités, etc.)
├── ui/              # Écrans d'interface et composants réutilisables
│   ├── common/
│   └── theme/
├── autoload/        # Gestionnaires globaux/singletons
├── utils/           # Optionnel : Scripts d'aide
└── shaders/         # Optionnel : Shaders Godot
```

### Point d'entrée du projet : `main.tscn` / `main.gd`

- Utilisez `main.tscn` et `main.gd` pour effectuer des vérifications initiales (paramètres, migration de sauvegarde, logique spécifique à la plateforme, écrans de démarrage, etc.) avant de charger le jeu ou menu réel.
> C'est un modèle courant que j'utilise personnellement dans mes projets Godot et qui aide à garder la logique de démarrage séparée des scènes principales.

## Dossier `features/`

Le dossier `features/` regroupe les systèmes de gameplay majeurs. Dans les projets plus petits, vous pouvez choisir de placer ces dossiers directement sous `source/` pour la simplicité.

Chaque système majeur obtient son propre dossier :

```bash
features/
├── map/
│   ├── map.gd
│   ├── map.tscn
│   └── levels/                  # Niveaux de carte individuels
│       ├── dungeon.tscn
│       └── shop.tscn
├── entities/
│   ├── entity.gd                # Entité de base (class_name Entity)
│   ├── components/
│   │   ├── attack.gd
│   │   └── health.gd
│   ├── enemies/
│   │   ├── enemy.gd             # Logique d'ennemi de base (extends entity.gd)
│   │   └── skeleton/
│   │       ├── skeleton.gd      # Logique spécifique au squelette (extends enemy.gd)
│   │       └── skeleton.tscn
│   └── player/
│       ├── player.gd            # Logique du joueur (extends entity.gd)
│       └── player.tscn
└── item/
    ├── item.gd
    └── resources/
        ├── bow.tres
        └── sword.tres
```

- Privilégiez la clarté sur le minimalisme : c'est bien d'avoir quelques niveaux d'imbrication si cela aide à organiser la logique.

## Dossier `ui/`

Séparez les composants réutilisables des écrans d'interface complets.

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

## Dossier `autoload/`

Pour les gestionnaires globaux ou systèmes qui doivent être accessibles de partout :

```bash
autoload/
├── game_state.gd         # Autoload GameState
├── event_bus.gd          # Autoload EventBus
└── transition_manager/   # Autoload TransitionManager
    ├── transition_manager.gd
    └── transition_manager.tscn
```

---

## Notes de conclusion

- Considérez tout ce qui précède comme une base utile, pas un règlement, mais un point de départ flexible que vous pouvez adapter. N'hésitez pas à choisir ce qui fonctionne le mieux pour vos besoins et préférences.
- Préférez une structure peu profonde quand c'est possible, c'est souvent plus facile à naviguer. Mais si plus de profondeur aide à clarifier la propriété ou la logique, n'hésitez à l'utiliser.
- Le dossier `addons/` par défaut est logiquement séparé de la structure principale du projet car chaque addon est autonome et peut organiser ses propres dossiers `assets/`, `data/`, et `source/` à sa manière.
- Pour des exemples de projets multijoueurs, consultez mes autres projets:
  - [godot-tiny-mmo](https://github.com/SlayHorizon/godot-tiny-mmo)
  - [godot-dedicated-server-example](https://github.com/SlayHorizon/godot-dedicated-server-example)

---

<details>
<summary>Comment utiliser</summary>

1. Cliquez sur "Use this template" sur GitHub
2. Clonez et ouvrez dans Godot
3. Adaptez la structure à vos besoins

</details>

<details>
<summary>Contribuer</summary>

Suggestions et PRs bienvenues ! Si vous avez une structure qui fonctionne bien pour votre équipe, n'hésitez pas à la partager.

</details>

<details>
<summary>Crédits</summary>
	
_Merci à Axel (du Discord Godot) pour ses commentaires et suggestions réfléchis qui ont aidé à façonner ce template._

</details>
