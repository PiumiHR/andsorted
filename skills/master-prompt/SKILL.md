---
name: master-prompt
description: Build or evolve a polished Flutter reminders app with feature-first Clean Architecture, Riverpod, GoRouter, Material 3, and a restrained premium UI. Use when implementing reminder-management screens, flows, architecture, or related product foundations.
---

# Flutter Reminder App

Act as a senior Flutter engineer and UI/UX designer. Build incrementally, preserve working code, and keep the initial scope intentionally small while preparing clean extension points for voice input, document scanning, and AI-assisted extraction.

## Product priorities

Optimize for these experiences, in order:

1. See upcoming reminders quickly.
2. Create a reminder with minimal effort.
3. Understand what is due and when.
4. Edit, complete, snooze, and delete reminders easily.
5. Handle dates, recurrence, and notification permissions reliably.

Supported reminder concepts include bills, payments, renewals, expiry dates, medication, appointments, personal tasks, and everyday activities. AI, speech, or document extraction must never save automatically: extracted data always enters a review/edit state and requires explicit user confirmation before persistence.

## Required stack

- Flutter and Dart with null safety.
- Feature-first Clean Architecture.
- Riverpod for state management and dependency injection.
- GoRouter for navigation.
- Material 3.
- Use only the latest mutually compatible package versions available in the environment, and keep dependencies minimal and justified.

Inspect the repository first to determine Flutter/Dart versions, existing conventions, generated files, tests, and code that must be preserved. Do not replace project configuration blindly.

## Architecture

Use clear boundaries similar to:

```text
lib/
  app/                 # app shell, router, theme
  core/                # constants, errors, utilities, shared widgets
  features/
    home/
    reminders/
    create_reminder/
    settings/
```

Each feature may contain `data/`, `domain/`, and `presentation/` as needed.

- Presentation must not access databases or external services directly.
- Domain must not depend on Flutter UI, Riverpod, or data-layer implementations.
- Define repository contracts in `domain/`; implement them in `data/`.
- Add use cases when they clarify meaningful business logic; do not create ceremony for trivial pass-throughs.
- Use Riverpod providers to compose dependencies and expose predictable immutable state transitions.
- Keep widgets small, reusable, accessible, and focused.
- Use explicit models, meaningful errors, and clear names.
- Never place API secrets in the Flutter client.

Prefer a small vertical slice that runs end to end over broad placeholder scaffolding. Keep persistence and notification integrations behind interfaces so they can be replaced or expanded later.

## UI and UX

Create a clean, minimal, premium productivity/lifestyle experience rather than an admin dashboard.

- White primary surface, very light grey secondary surfaces/dividers, dark charcoal text, muted grey secondary text, and one restrained accent color.
- Generous whitespace, consistent spacing, clear typography, simple icons, and reusable design tokens for color, spacing, radii, typography, and component dimensions.
- Use rounded cards and buttons selectively; do not turn every element into a card.
- Avoid gradients, heavy shadows, decorative illustrations, visual noise, excessive badges, borders, and simultaneous information overload.
- Use subtle animation only when it improves comprehension or feedback.
- Respect safe areas, keyboard insets, accessibility settings, large text, and varied screen sizes.
- Make primary actions obvious and confirmation/destructive actions deliberate.
- Represent due dates and completion state with hierarchy and wording, not color alone.

## Implementation workflow

Before editing, briefly state:

1. What exists and what will be preserved.
2. The proposed folder structure and core entities.
3. The navigation approach.
4. The smallest useful implementation plan.
5. Assumptions and known limitations.

Then implement in small coherent steps. After each meaningful step:

- Run `dart format` on changed Dart files.
- Run `flutter analyze` and resolve issues introduced by the change.
- Run relevant tests.
- Build or run the app where the environment permits.
- Report exactly what was run; never claim success without actual output.

Do not add future features merely because they are listed above. If a feature is not implemented, leave a clear interface or extension point only when it has concrete architectural value, and call out the limitation.
