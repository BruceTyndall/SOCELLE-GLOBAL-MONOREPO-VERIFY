# Cleo Design System — Flutter Usage Guide

**Version:** 1.0 (M0 — Phase 0)
**File:** `lib/core/theme/cleo_design_system.dart`
**Import:** `import 'package:socelle_mobile/core/theme/cleo_design_system.dart';`

---

## Overview

The Cleo design system is the visual language for all **new intelligence surfaces** in Socelle Mobile. It translates the Cleo web design system into Flutter tokens, widgets, and a full `ThemeData`.

The aesthetic is: **warm cocoa glassmorphism** — frosted glass surfaces, shimmer gradient pill buttons, editorial light-weight typography, backdrop blur, and warm off-white backgrounds.

---

## When to Use CleoTheme vs SocelleTheme

| Surface | Theme | Rule |
|---|---|---|
| Feed tab (Tab 0) | **CleoTheme** | New intelligence surface |
| Discover tab (Tab 1) | **CleoTheme** | New intelligence surface |
| Profile tab (Tab 4) | **CleoTheme** | New intelligence surface |
| Revenue tab (Tab 2) | **SocelleTheme** | Existing gap-recovery — DO NOT CHANGE |
| Schedule tab (Tab 3) | **SocelleTheme** | Existing gap-recovery — DO NOT CHANGE |
| Settings | **SocelleTheme** | Existing gap-recovery — DO NOT CHANGE |
| Dashboard / Gap Actions | **SocelleTheme** | Existing gap-recovery — DO NOT CHANGE |
| Onboarding (Steps 1–4) | **SocelleTheme** | Existing — DO NOT CHANGE |
| Onboarding (Step 5 — Explore) | **CleoTheme** | New explore profile step |
| Paywall | **SocelleTheme** | Existing — DO NOT CHANGE |
| Weekly Summary | **SocelleTheme** | Existing — DO NOT CHANGE |

**Rule:** If the screen existed before the M0–M9 evolution, it uses SocelleTheme. If it is new (added in M1–M9), it uses CleoTheme.

---

## Token Reference

### CleoColors

```dart
// Core brand
CleoColors.primaryCocoa   // #47201C — primary text, headings, active states
CleoColors.deepCocoa      // #29120F — dark backgrounds, footer areas
CleoColors.neutralBeige   // #AC9B98 — muted text, placeholders, eyebrows

// Page backgrounds
CleoColors.bgMain         // #F8F6F2 — warm off-white scaffold background
CleoColors.bgAlt          // #F3E9E3 — peach section tint, alternate cards
CleoColors.bgNearWhite    // #FAF9F5 — standard card background

// Semantic palette
CleoColors.red400         // #FF6568
CleoColors.orange400      // #FF8B1A
CleoColors.orange700      // #C53C00
CleoColors.yellow400      // #FAC800
CleoColors.green400       // #05DF72
CleoColors.green600       // #00A544
CleoColors.green900       // #0D542B
CleoColors.teal400        // #00D3BD
CleoColors.blue400        // #54A2FF — use sparingly (no bright blue dominance)
CleoColors.purple400      // #C07EFF

// Glass tints (for glassmorphic surfaces)
CleoColors.glassLight     // rgba(134,134,134,0.10) — glass on light bg
CleoColors.glassDark      // rgba(71,32,28,0.40)   — glass on dark bg
CleoColors.glassWhite     // rgba(255,255,255,0.20) — white glass overlay
CleoColors.glassDarkBg    // rgba(41,18,16,0.10)   — subtle dark tint

// Text on dark surfaces
CleoColors.textOnDark      // #FFFFFF
CleoColors.textOnDarkMuted // rgba(255,255,255,0.80)

// Shadows — use as BoxShadow in BoxDecoration
CleoColors.shadowLight     // 10% black, blur 12, offset (0,6)
CleoColors.shadowMedium    // 15% black, blur 14, offset (0,4)
CleoColors.shadowDark      // 18% black, blur 12, offset (0,6)
```

### CleoText

```dart
CleoText.displayLarge     // 48px, w300 — hero numbers, major headings
CleoText.displayMedium    // 32px, w300 — section headings
CleoText.headlineLarge    // 24px, w300 — card headings
CleoText.headlineMedium   // 20px, w400 — sub-headings
CleoText.bodyLarge        // 16px, w400 — primary body text
CleoText.bodyMedium       // 14px, w400, neutralBeige — secondary/muted text
CleoText.label            // 13.8px, w500 — labels, tags
CleoText.labelUppercase   // 13.8px, w500, neutralBeige — eyebrow/section labels
CleoText.buttonLabel      // 16px, w500 — pill button text

// Convenience constructors
CleoText.heading('My Heading')                   // displayMedium as Widget
CleoText.eyebrow('Section Title')               // labelUppercase as Widget
```

**Key principle:** Cleo headings use `w300` (light weight). This is intentional and matches the web design system. Do not change to w500 or bold.

### CleoRadius

```dart
CleoRadius.small(context)   // 16dp mobile / 24dp tablet
CleoRadius.medium(context)  // 24dp mobile / 32dp tablet
CleoRadius.large(context)   // 48dp mobile / 80dp tablet
CleoRadius.card(context)    // 32dp mobile / 48dp tablet
CleoRadius.pill(height)     // height/2 — always circular pill
```

Tablet breakpoint: `shortestSide >= 600dp`. Always pass `BuildContext` for responsive radius.

### CleoAnimation

```dart
CleoAnimation.snap          // Curves.linear — instant state changes
CleoAnimation.cinematic     // Cubic(0.75,0,0.25,1) — scroll reveal entrances
CleoAnimation.standard      // Cubic(0.4,0,0.2,1) — default transitions

CleoAnimation.dSnap         // 200ms — UI state changes
CleoAnimation.dReveal       // 1200ms — scroll entrances
CleoAnimation.dTransform    // 800ms — layout transitions
CleoAnimation.dFill         // 100ms — micro-interactions (progress fills)
```

---

## Component Reference

### CleoPillButton

The primary interactive element. Three axes: **variant × tone × size**.

```dart
CleoPillButton(
  label: 'Get Started',
  variant: PillVariant.primary,    // primary | secondary | tertiary
  tone: PillTone.glass,            // light | dark | glass
  size: PillSize.medium,           // extraLarge | large | betweenLargeAndMedium | medium | small
  icon: Icons.arrow_forward,       // optional
  iconPosition: IconAlignment.end, // start | end
  onTap: () {},
  isActive: false,                 // active/selected state
  isDisabled: false,               // disabled state
  enableBlur: true,                // backdrop blur (default true)
  isDarkTheme: false,              // adapt colors for dark background
  expand: false,                   // fill available width
)
```

**Size guide:**
| Size | Height | Use case |
|---|---|---|
| extraLarge | 80px | Hero CTAs only |
| large | 60px | Primary page actions |
| betweenLargeAndMedium | 56px | Featured actions |
| medium | 48px | Standard buttons |
| small | 40px | Compact/inline actions |

**When to use shimmer border:** Automatically shown on `primary` variant + `glass` tone.
**When to use dark tone:** On `deepCocoa` or image backgrounds.

### CleoGlassCard

```dart
CleoGlassCard(
  child: YourContent(),
  isDark: false,                        // false = light glass, true = dark glass
  padding: const EdgeInsets.all(24),   // default
  blur: 6.0,                           // backdrop blur sigma
)
```

Use `CleoGlassCard` for overlay content, featured items, and cards that sit on top of rich backgrounds. Use `CleoCard` for standard content cards on the main background.

### CleoCard

```dart
CleoCard(
  child: YourContent(),
  padding: const EdgeInsets.all(24),
  color: CleoColors.bgAlt,   // optional, defaults to bgNearWhite
  onTap: () {},              // optional, makes card tappable
)
```

### CleoChip

```dart
CleoChip(
  label: 'Hair',
  isSelected: false,
  isDark: false,     // adapt for dark backgrounds
  onTap: () {},
)
```

Use `CleoChip` for category filters and specialty tags. Group in a `Wrap` for multi-select or a `SingleChildScrollView > Row` for horizontal scroll.

### CleoNavPill

```dart
CleoNavPill(
  items: ['Feed', 'Discover', 'Profile'],
  selectedIndex: _currentIndex,
  onTap: (index) => setState(() => _currentIndex = index),
)
```

Use for in-page horizontal tab navigation within a Cleo surface (not for the main app `BottomNavigationBar`).

### CleoSectionLabel

```dart
const CleoSectionLabel('Intelligence Feed')   // default: neutralBeige
CleoSectionLabel('Trending', color: CleoColors.orange400)
```

Always-uppercase eyebrow text. Used above content sections on Cleo surfaces.

### CleoScaffold

```dart
CleoScaffold(
  body: YourBody(),
  isDark: false,                 // dark = deepCocoa bg, light = bgMain
  backgroundColor: null,        // override if needed
  appBar: yourAppBar,           // optional
)
```

Use as the root widget for all new Cleo-themed screens.

### CleoTheme

```dart
// In MaterialApp — only for Cleo-specific sub-routes/pages
// Do NOT apply to the root MaterialApp (that uses SocelleTheme)
MaterialApp(
  theme: CleoTheme.light,
  ...
)
```

---

## Design Principles

These principles are enforced in all Cleo surfaces:

1. **No gradients** — Use solid colors and glassmorphic tints instead.
2. **No ALL CAPS in content** — Section labels use `CleoSectionLabel` (uppercase via code). Never write UI copy in ALL CAPS.
3. **No bright blues** — `blue400` exists but should not dominate any screen.
4. **Revenue numbers: 48px dominant** — Gap-recovery numbers keep their 48px treatment.
5. **Loading states everywhere** — Every async Cleo screen must have a Shimmer/skeleton state.
6. **Editorial light headings** — All `h1`/`h2` equivalents use `w300`. This is intentional.
7. **Calm, professional** — Avoid aggressive colors, excessive animation, or heavy visual noise.

---

## Boundary Rules for Agents M1–M9

- **NEVER** modify `SocelleColors`, `SocelleTheme`, `SlotforceColors`, or `SlotforceTheme`.
- **NEVER** apply `CleoTheme` to Revenue, Schedule, Settings, Dashboard, Paywall, or Onboarding Steps 1–4.
- **NEVER** import `cleo_design_system.dart` in any existing gap-recovery file.
- **ALWAYS** use `CleoColors` for color in new screens. Never use hardcoded hex values.
- **ALWAYS** use `CleoPillButton` for primary/secondary actions on Cleo screens. Never use `SfButton` on new screens.
- **ALWAYS** use `CleoGlassCard` or `CleoCard` for card containers on Cleo screens. Never use `SfCard` on new screens.
- **ALWAYS** check `FeatureFlags.kEnableCleoShowcase` before rendering the showcase page.

---

## Visual QA

The `CleoShowcasePage` renders every component for visual verification.

**To enable:**
1. Set `kEnableCleoShowcase = true` in `lib/core/feature_flags.dart`
2. Navigate to `CleoShowcasePage` (add a debug route or temporarily replace home)
3. Verify all 45 button combinations, cards, chips, nav pill, type scale, and color swatches
4. Reset `kEnableCleoShowcase = false` before committing

**Location:** `lib/features/cleo_showcase/cleo_showcase_page.dart`

---

## Coexistence with SocelleTheme

Both design systems live in the same app simultaneously. This is intentional:

```
app/
  core/
    theme/
      socelle_colors.dart       ← Gap-recovery colors (DO NOT TOUCH)
      socelle_theme.dart        ← Gap-recovery theme (DO NOT TOUCH)
      slotforce_colors.dart     ← Legacy colors (DO NOT TOUCH)
      slotforce_theme.dart      ← Legacy theme (DO NOT TOUCH)
      cleo_design_system.dart   ← NEW: Intelligence surface tokens + widgets
```

The two systems never conflict because they apply to different screens. `CleoTheme.light` is only used when explicitly referenced — it does not override the root `MaterialApp` theme.
