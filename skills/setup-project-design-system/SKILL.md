---
name: setup-project-design-system
description: Establish a Flutter app shell and reusable Material 3 design system before business features. Use when setting up project foundations, theme tokens, shared widgets, Riverpod, or GoRouter.
---

# Flutter Foundation and Design System

Set up the project foundation without inventing business logic. Inspect the existing repository first, preserve working code and conventions, and keep the first implementation reviewable through placeholder screens.

## Project setup

Before editing:

1. Inspect Flutter and Dart versions, `pubspec.yaml`, existing source structure, routes, tests, and generated files.
2. Identify code that must be preserved and avoid replacing project configuration blindly.
3. Propose the smallest foundation plan: app shell, theme location, shared widgets, state setup, and navigation.
4. Add only packages required by the requested foundation. Configure Riverpod and GoRouter only when they are not already present.

Use feature-first boundaries where applicable:

```text
lib/
  app/
    app.dart
    router/
    theme/
  core/
    widgets/
  features/
    <feature>/
```

Keep theme tokens in `app/theme/` or the repository's established design-system location. Keep reusable controls in `core/widgets/`; feature-specific widgets stay within their feature.

## Design system

Configure Material 3 with a clean, quiet visual language:

- Use pure white `#FFFFFF` as the primary background.
- Use dark charcoal for primary text, medium grey for secondary text, and very light grey for dividers and subtle surfaces.
- Reserve one restrained muted indigo or blue accent for primary actions and selected states.
- Define a sans-serif typography scale with explicit heading, body, label, and caption styles.
- Define reusable spacing tokens for `4`, `8`, `12`, `16`, `24`, and `32` logical pixels.
- Define consistent radii, control heights, icon sizes, and content widths.
- Prefer whitespace and hierarchy over borders and shadows.
- Avoid excessive nested containers, cards, gradients, decorative treatments, or competing accent colors.

Create only reusable primitives that the app shell needs, such as:

- Primary and secondary buttons.
- Text-field decoration or wrapper.
- Section heading.
- Empty state.
- Loading state.
- Error state with a retry action where retry is meaningful.

Keep widgets small, accessible, composable, and usable with large text and varied screen sizes. Do not hide important meaning in color alone.

## App shell

Create placeholder screens sufficient to review the theme and navigation before business features exist. Use a Material 3 bottom navigation bar only when the planned information architecture has multiple top-level destinations; otherwise keep navigation minimal. Make selected states, titles, and primary actions clear.

Use Riverpod for dependency/state wiring, not as a reason to add fake state. Keep GoRouter configuration centralized and typed or strongly named where the existing project supports it. Do not add persistence, notifications, API clients, or domain models unless the repository already requires them for the shell.

## Validation

Implement in small steps. After changes:

- Run `dart format` on changed Dart files.
- Run `flutter analyze` and resolve issues introduced by the work.
- Run relevant widget tests, adding focused coverage for theme/app-shell rendering and navigation when a test structure exists.
- Build or run the app where the environment permits.
- Report exact commands and results; never claim a check passed without running it.

Call out intentional placeholders and remaining business-feature work clearly.
