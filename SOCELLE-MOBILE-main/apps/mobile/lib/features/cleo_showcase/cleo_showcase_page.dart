// ═══════════════════════════════════════════════════════════════════════════
// CLEO DESIGN SYSTEM — VISUAL QA SHOWCASE
// All components rendered for design review and regression verification.
// ═══════════════════════════════════════════════════════════════════════════
//
// This page is gated behind FeatureFlags.kEnableCleoShowcase (default: false).
// It is never visible in production builds.
//
// To enable for local QA:
//   1. Set kEnableCleoShowcase = true in core/feature_flags.dart
//   2. Navigate to this page from a debug menu or developer settings
//   3. Verify every component renders correctly
//   4. Reset kEnableCleoShowcase = false before committing
//
// Components verified:
//   ✓ CleoColors — 20 tokens
//   ✓ CleoText — 9 styles
//   ✓ CleoRadius — 4 responsive sizes
//   ✓ CleoAnimation — curves/durations referenced
//   ✓ CleoPillButton — 45 combos (3 variants × 3 tones × 5 sizes)
//   ✓ CleoGlassCard — light + dark
//   ✓ CleoCard — default + tinted + tappable
//   ✓ CleoChip — selected/unselected on light + dark
//   ✓ CleoNavPill — interactive selection
//   ✓ CleoSectionLabel — default + custom color
//   ✓ CleoScaffold — used as page wrapper

import 'package:flutter/material.dart';
import 'package:socelle_mobile/core/feature_flags.dart';
import 'package:socelle_mobile/core/theme/cleo_design_system.dart';

/// Visual QA showcase for the Cleo Design System.
///
/// Gated behind [FeatureFlags.kEnableCleoShowcase].
class CleoShowcasePage extends StatefulWidget {
  const CleoShowcasePage({super.key});

  @override
  State<CleoShowcasePage> createState() => _CleoShowcasePageState();
}

class _CleoShowcasePageState extends State<CleoShowcasePage> {
  // Interactive state for chip demos
  final List<bool> _chipsLight = [false, true, false, false, false];
  final List<bool> _chipsDark = [false, true, false];

  // Interactive state for nav pill demo
  int _navIndex = 0;

  static const _chipLabelsLight = ['All', 'Hair', 'Nails', 'Skin', 'Wellness'];
  static const _chipLabelsDark = ['Feed', 'Brands', 'Events'];
  static const _navLabels = ['Feed', 'Discover', 'Profile'];

  @override
  Widget build(BuildContext context) {
    // Gate: show locked state when flag is off
    if (!FeatureFlags.kEnableCleoShowcase) {
      return Scaffold(
        backgroundColor: CleoColors.bgMain,
        appBar: AppBar(
          title: const Text('Cleo Showcase'),
          backgroundColor: CleoColors.bgMain,
          foregroundColor: CleoColors.primaryCocoa,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.lock_outline, size: 48, color: CleoColors.neutralBeige),
              SizedBox(height: 16),
              Text('Showcase disabled', style: CleoText.headlineMedium),
              SizedBox(height: 8),
              Text(
                'Set kEnableCleoShowcase = true to view.',
                style: CleoText.bodyMedium,
              ),
            ],
          ),
        ),
      );
    }

    return CleoScaffold(
      appBar: AppBar(
        title: const Text('Cleo Design System'),
        backgroundColor: CleoColors.bgMain,
        foregroundColor: CleoColors.primaryCocoa,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 80),
        children: [
          // ─── SECTION: Colors ──────────────────────────────────────────────
          const _ShowcaseDivider(label: 'Color Tokens — 20 values'),
          const SizedBox(height: 16),
          const _ColorSwatch(label: 'primaryCocoa', color: CleoColors.primaryCocoa),
          const _ColorSwatch(label: 'deepCocoa', color: CleoColors.deepCocoa),
          const _ColorSwatch(label: 'neutralBeige', color: CleoColors.neutralBeige),
          const _ColorSwatch(label: 'bgMain', color: CleoColors.bgMain),
          const _ColorSwatch(label: 'bgAlt', color: CleoColors.bgAlt),
          const _ColorSwatch(label: 'bgNearWhite', color: CleoColors.bgNearWhite),
          const _ColorSwatch(label: 'red400', color: CleoColors.red400),
          const _ColorSwatch(label: 'orange400', color: CleoColors.orange400),
          const _ColorSwatch(label: 'orange700', color: CleoColors.orange700),
          const _ColorSwatch(label: 'yellow400', color: CleoColors.yellow400),
          const _ColorSwatch(label: 'green400', color: CleoColors.green400),
          const _ColorSwatch(label: 'green600', color: CleoColors.green600),
          const _ColorSwatch(label: 'green900', color: CleoColors.green900),
          const _ColorSwatch(label: 'teal400', color: CleoColors.teal400),
          const _ColorSwatch(label: 'blue400', color: CleoColors.blue400),
          const _ColorSwatch(label: 'purple400', color: CleoColors.purple400),
          const _ColorSwatch(label: 'glassLight', color: CleoColors.glassLight),
          const _ColorSwatch(label: 'glassDark', color: CleoColors.glassDark),
          const _ColorSwatch(label: 'glassWhite', color: CleoColors.glassWhite),
          const _ColorSwatch(label: 'glassDarkBg', color: CleoColors.glassDarkBg),
          const SizedBox(height: 40),

          // ─── SECTION: Typography ──────────────────────────────────────────
          const _ShowcaseDivider(label: 'Typography — 9 styles'),
          const SizedBox(height: 16),
          const Text('Display Large — 48px w300', style: CleoText.displayLarge),
          const SizedBox(height: 12),
          const Text('Display Medium — 32px w300', style: CleoText.displayMedium),
          const SizedBox(height: 12),
          const Text('Headline Large — 24px w300', style: CleoText.headlineLarge),
          const SizedBox(height: 12),
          const Text('Headline Medium — 20px w400', style: CleoText.headlineMedium),
          const SizedBox(height: 12),
          const Text('Body Large — 16px w400', style: CleoText.bodyLarge),
          const SizedBox(height: 8),
          const Text('Body Medium — 14px w400 muted', style: CleoText.bodyMedium),
          const SizedBox(height: 8),
          const Text('Label — 13.8px w500', style: CleoText.label),
          const SizedBox(height: 8),
          const Text('LABEL UPPERCASE — 13.8px w500 beige', style: CleoText.labelUppercase),
          const SizedBox(height: 8),
          const Text('Button Label — 16px w500', style: CleoText.buttonLabel),
          const SizedBox(height: 40),

          // ─── SECTION: Pill Buttons (45 combinations) ─────────────────────
          const _ShowcaseDivider(label: 'Pill Buttons — 45 combos (3 variant × 3 tone × 5 size)'),
          const SizedBox(height: 16),

          // extraLarge
          const _PillSizeSection(size: PillSize.extraLarge),
          const SizedBox(height: 20),
          // large
          const _PillSizeSection(size: PillSize.large),
          const SizedBox(height: 20),
          // betweenLargeAndMedium
          const _PillSizeSection(size: PillSize.betweenLargeAndMedium),
          const SizedBox(height: 20),
          // medium
          const _PillSizeSection(size: PillSize.medium),
          const SizedBox(height: 20),
          // small
          const _PillSizeSection(size: PillSize.small),
          const SizedBox(height: 40),

          // ─── SECTION: Glass Cards ─────────────────────────────────────────
          const _ShowcaseDivider(label: 'Glass Cards — light + dark'),
          const SizedBox(height: 16),

          // Light glass card on warm background
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: CleoColors.bgAlt,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const CleoGlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Glass Card — Light', style: CleoText.headlineMedium),
                  SizedBox(height: 4),
                  Text(
                    'Backdrop blur on warm off-white background.',
                    style: CleoText.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Dark glass card on deep cocoa background
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: CleoColors.deepCocoa,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const CleoGlassCard(
              isDark: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Glass Card — Dark',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Backdrop blur on deep cocoa background.',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: CleoColors.textOnDarkMuted,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),

          // ─── SECTION: Standard Cards ──────────────────────────────────────
          const _ShowcaseDivider(label: 'Standard Cards'),
          const SizedBox(height: 16),
          const CleoCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Standard Card', style: CleoText.headlineMedium),
                SizedBox(height: 6),
                Text(
                  'Warm near-white background with subtle border and shadow.',
                  style: CleoText.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          CleoCard(
            color: CleoColors.bgAlt,
            onTap: () {},
            child: const Text('Tappable Card — bgAlt', style: CleoText.bodyLarge),
          ),
          const SizedBox(height: 40),

          // ─── SECTION: Chips ───────────────────────────────────────────────
          const _ShowcaseDivider(label: 'Chips — light + dark, selected/unselected'),
          const SizedBox(height: 16),

          // Light chips
          const CleoSectionLabel('Light background'),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (var i = 0; i < _chipLabelsLight.length; i++)
                CleoChip(
                  label: _chipLabelsLight[i],
                  isSelected: _chipsLight[i],
                  onTap: () => setState(() => _chipsLight[i] = !_chipsLight[i]),
                ),
            ],
          ),
          const SizedBox(height: 16),

          // Dark chips
          const CleoSectionLabel('Dark background'),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CleoColors.deepCocoa,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (var i = 0; i < _chipLabelsDark.length; i++)
                  CleoChip(
                    label: _chipLabelsDark[i],
                    isDark: true,
                    isSelected: _chipsDark[i],
                    onTap: () => setState(() => _chipsDark[i] = !_chipsDark[i]),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          // ─── SECTION: Nav Pill ────────────────────────────────────────────
          const _ShowcaseDivider(label: 'Nav Pill Bar — horizontal selection'),
          const SizedBox(height: 16),
          Center(
            child: CleoNavPill(
              items: _navLabels,
              selectedIndex: _navIndex,
              onTap: (i) => setState(() => _navIndex = i),
            ),
          ),
          const SizedBox(height: 40),

          // ─── SECTION: Section Labels ──────────────────────────────────────
          const _ShowcaseDivider(label: 'Section Labels (Eyebrow text)'),
          const SizedBox(height: 16),
          const CleoSectionLabel('Intelligence Feed'),
          const SizedBox(height: 8),
          const CleoSectionLabel('Discover'),
          const SizedBox(height: 8),
          const CleoSectionLabel('Custom Color', color: CleoColors.orange400),
          const SizedBox(height: 40),

          // ─── SECTION: Border Radius ───────────────────────────────────────
          const _ShowcaseDivider(label: 'Border Radius — responsive (mobile < 600dp, tablet ≥ 600dp)'),
          const SizedBox(height: 16),
          _RadiusSwatch(label: 'small', radius: CleoRadius.small(context)),
          _RadiusSwatch(label: 'medium', radius: CleoRadius.medium(context)),
          _RadiusSwatch(label: 'large', radius: CleoRadius.large(context)),
          _RadiusSwatch(label: 'card', radius: CleoRadius.card(context)),
          _RadiusSwatch(
            label: 'pill (height=48)',
            radius: CleoRadius.pill(48),
          ),
          const SizedBox(height: 40),

          // ─── SECTION: Animation Tokens ────────────────────────────────────
          const _ShowcaseDivider(label: 'Animation Tokens (reference)'),
          const SizedBox(height: 16),
          const _AnimationTokenRow(name: 'CleoAnimation.snap', value: 'linear — 200ms — state changes'),
          const _AnimationTokenRow(name: 'CleoAnimation.cinematic', value: 'Cubic(0.75,0,0.25,1) — 1200ms — scroll reveals'),
          const _AnimationTokenRow(name: 'CleoAnimation.standard', value: 'Cubic(0.4,0,0.2,1) — 800ms — default'),
          const _AnimationTokenRow(name: 'CleoAnimation.dFill', value: '100ms — fill micro-interactions'),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Private showcase helper widgets
// ─────────────────────────────────────────────────────────────────────────────

/// Divider with uppercase section label for the showcase.
class _ShowcaseDivider extends StatelessWidget {
  const _ShowcaseDivider({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1, thickness: 1, color: Color(0x1AAC9B98)),
        const SizedBox(height: 10),
        Text(
          label.toUpperCase(),
          style: CleoText.labelUppercase.copyWith(fontSize: 11),
        ),
      ],
    );
  }
}

/// Color token swatch row.
class _ColorSwatch extends StatelessWidget {
  const _ColorSwatch({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 26,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: const Color(0x22AC9B98),
                width: 0.5,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(label, style: CleoText.label),
        ],
      ),
    );
  }
}

/// Border radius visual swatch.
class _RadiusSwatch extends StatelessWidget {
  const _RadiusSwatch({required this.label, required this.radius});

  final String label;
  final BorderRadius radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 40,
            decoration: BoxDecoration(
              color: CleoColors.bgAlt,
              borderRadius: radius,
              border: Border.all(color: const Color(0x3347201C), width: 0.8),
            ),
          ),
          const SizedBox(width: 16),
          Text('CleoRadius.$label', style: CleoText.label),
        ],
      ),
    );
  }
}

/// Animation token reference row.
class _AnimationTokenRow extends StatelessWidget {
  const _AnimationTokenRow({required this.name, required this.value});

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: CleoText.label),
          const SizedBox(height: 2),
          Text(value, style: CleoText.bodyMedium),
        ],
      ),
    );
  }
}

/// Pill button section for a single size — shows all 9 variant×tone combos.
class _PillSizeSection extends StatelessWidget {
  const _PillSizeSection({required this.size});

  final PillSize size;

  String get _sizeLabel {
    return switch (size) {
      PillSize.extraLarge => 'extraLarge (80px)',
      PillSize.large => 'large (60px)',
      PillSize.betweenLargeAndMedium => 'betweenLargeAndMedium (56px)',
      PillSize.medium => 'medium (48px)',
      PillSize.small => 'small (40px)',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_sizeLabel, style: CleoText.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        // primary row
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final tone in PillTone.values) ...[
                CleoPillButton(
                  label: 'primary·${tone.name}',
                  variant: PillVariant.primary,
                  tone: tone,
                  size: size,
                  onTap: () {},
                ),
                const SizedBox(width: 8),
              ],
            ],
          ),
        ),
        const SizedBox(height: 4),
        // secondary row
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final tone in PillTone.values) ...[
                CleoPillButton(
                  label: 'secondary·${tone.name}',
                  variant: PillVariant.secondary,
                  tone: tone,
                  size: size,
                  onTap: () {},
                ),
                const SizedBox(width: 8),
              ],
            ],
          ),
        ),
        const SizedBox(height: 4),
        // tertiary row
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final tone in PillTone.values) ...[
                CleoPillButton(
                  label: 'tertiary·${tone.name}',
                  variant: PillVariant.tertiary,
                  tone: tone,
                  size: size,
                  onTap: () {},
                ),
                const SizedBox(width: 8),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
