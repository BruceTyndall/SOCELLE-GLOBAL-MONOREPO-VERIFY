import 'package:flutter/material.dart';

/// Socelle Mobile Color System — Revenue Intelligence OS
///
/// Visual tone: editorial, calm, financial, minimal.
/// No playfulness. No fintech gimmicks. No bright blues. No neon. No gradients.
class SocelleColors {
  SocelleColors._();

  // ── Ink system ─────────────────────────────────────────────────────────
  static const ink = Color(0xFF1A1714);           // primary text, CTAs
  static const inkMuted = Color(0xFF6E6A66);      // secondary text, labels
  static const inkFaint = Color(0xFF706A65);      // tertiary, disabled — WCAG 2.2 AA ≥4.5:1

  // ── Surface system ─────────────────────────────────────────────────────
  static const background = Color(0xFFF5F3F0);    // scaffold background
  static const surface = Color(0xFFFFFFFF);        // card backgrounds
  static const surfaceMuted = Color(0xFFF0EDEA);   // inset areas, code blocks
  static const borderLight = Color(0xFFE8E5E1);   // card borders, dividers

  // ── Accent — muted deep green ──────────────────────────────────────────
  static const accent = Color(0xFF3D6B52);         // primary accent
  static const accentMuted = Color(0xFF5A8A6A);    // softer accent
  static const accentSurface = Color(0xFFEAF2EC);  // accent background wash

  // ── Leakage — muted terracotta ─────────────────────────────────────────
  static const leakage = Color(0xFFA85038);        // leakage numbers
  static const leakageMuted = Color(0xFFC47A5A);   // lighter terracotta
  static const leakageSurface = Color(0xFFFAEDE8); // leakage background wash

  // ── Recovery — sage green ──────────────────────────────────────────────
  static const recovery = Color(0xFF3D6B52);       // recovery numbers
  static const recoverySurface = Color(0xFFEAF2EC);

  // ── System states ──────────────────────────────────────────────────────
  static const error = Color(0xFFC62828);

  // ── Semantic aliases (legacy compatibility) ────────────────────────────
  static const textPrimary = ink;
  static const textSecondary = inkMuted;
  static const textMuted = inkFaint;
  static const cardBackground = surface;
  static const pureWhite = surface;
  static const surfaceSoft = surfaceMuted;
  static const divider = borderLight;
  static const border = borderLight;
  static const primary = accent;
  static const primaryDark = Color(0xFF2D5040);
  static const primaryLight = accentSurface;          // sage mist — info box backgrounds
  static const leakageRed = leakage;
  static const leakageRedLight = leakageSurface;      // terracotta wash — info box bg
  static const leakageRedDark = Color(0xFF7A3020);    // fired clay — text on light bg
  static const recoveredGreen = recovery;
  static const recoveredGreenLight = recoverySurface;
  static const recoveredGreenDark = Color(0xFF2D5040);
  static const intentionalAmber = Color(0xFFD97706);
  static const intentionalAmberLight = Color(0xFFFEF3C7);
  static const errorRed = error;
  static const accentBlue = Color(0xFF2563EB);
  static const accentRose = Color(0xFFE11D48);
  static const accentSun = Color(0xFFD97706);

  // ── Gold accent — editorial "money moment" screens only ───────────────
  /// Champagne gold. Used on the dark leakage reveal screen for the dollar
  /// figure, gold rules, and CTA. Not for use on light surfaces.
  static const accentGold = Color(0xFFC5A265);
  static const accentGoldLight = accentSurface;       // sage mist — icon container bg
  static const accentGoldDark = primaryDark;          // forest green — icon color

  // ── Trial urgency ──────────────────────────────────────────────────────
  static const trialRed = leakage;                    // terracotta — "Last day!" badge
  static const trialAmber = Color(0xFFC49A3A);        // muted warm amber — "3 days left"

  // ── Brand gradient (primary buttons, progress bars) ────────────────────
  /// The hero gradient used on primary action buttons and the progress bar.
  static const glamPlum = accent;
  static const glamInk = ink;                         // warm editorial near-black
  static const glamHeroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF3D6B52), Color(0xFF5A8A6A)],
  );

  /// 3-stop: warm ink → forest green → Socelle sage.
  /// Used on the onboarding intro hero card.
  static const glamHeroGradientColors = <Color>[
    Color(0xFF1A1714),
    Color(0xFF2D5040),
    Color(0xFF3D6B52),
  ];

  /// Used as the `colors:` list inside a LinearGradient widget.
  static const actionGradient = [Color(0xFF3D6B52), Color(0xFF5A8A6A)];
}
