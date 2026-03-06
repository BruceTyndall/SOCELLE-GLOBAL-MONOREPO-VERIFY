# HARDCODED SURFACES — SOCELLE GLOBAL
**Generated:** March 5, 2026 — G0 Repo Inventory  
**Authority:** Per `docs/command/SOCELLE_CANONICAL_DOCTRINE.md` §6, `docs/command/SOCELLE_DATA_PROVENANCE_POLICY.md` §7  
**Doc Gate:** All items below are potential FAIL 4 violations unless labeled DEMO/PREVIEW

---

## P0 — FAKE LIVE CLAIMS (Doc Gate FAIL 4)

These surfaces display data that **implies real-time/live** but is hardcoded.

### 1. Home — "Live Market Feed" Badge + INTELLIGENCE_SIGNALS
**File:** `SOCELLE-WEB/src/pages/public/Home.tsx`  
**Lines:** 13–18, 161–167  
**Violation:** `INTELLIGENCE_SIGNALS` array contains hardcoded values with fake timestamps (`"2m ago"`, `"Real-time"`, `"1h ago"`, `"12m ago"`) and a green pulsing "Live Market Feed" badge. None of these are DB-connected.

```typescript
// Line 13-18 — hardcoded
const INTELLIGENCE_SIGNALS = [
  { id: '1', label: 'Polynucleotides', value: '+42%', trend: 'up', confidence: 'High', updated: '2m ago', ... },
  { id: '2', label: 'Average Cart Value', value: '$1,294', trend: 'up', confidence: 'Verified', updated: 'Real-time', ... },
  { id: '3', label: 'Aggressive Peels', value: '-12%', trend: 'down', confidence: 'Moderate', updated: '1h ago', ... },
  { id: '4', label: 'Barrier Repair', value: '+88%', trend: 'up', confidence: 'High', updated: '12m ago', ... },
];

// Line 161-167 — fake live badge
<div className="... text-emerald-700 bg-emerald-50 ...">
  <span className="animate-ping ..."></span>  // ← green pulsing dot
  Live Market Feed  // ← false label
</div>
```

**Severity:** P0 — Directly violates Doctrine §6 and Provenance §7

---

### 2. Home — Cocoa/Warm Theme Colors
**File:** `SOCELLE-WEB/src/pages/public/Home.tsx`  
**Lines:** 29–36, 43, 83, 111, etc.  
**Violation:** Uses `#29120f`, `#47201c`, `#f8f6f2`, `var(--color-primary-cocoa)`, `var(--bg-page-main)`, and `font-serif` — all contradicting Doctrine §3 (Pearl Mineral palette) and §4 (no serif on public pages).

**Severity:** P0 — Design system violation

---

## P1 — HARDCODED DEMO DATA (Needs DEMO Label)

These surfaces use hardcoded arrays for content but do not imply real-time status. They still need DEMO labeling or DB wiring.

### 3. Insights — TREND_PLACEHOLDERS
**File:** `SOCELLE-WEB/src/pages/public/Insights.tsx`  
**Lines:** 8–36  
**Issue:** 3 hardcoded trend articles with `"Industry report"` and `"Q1 2026"` sources, no DB connection.  
**Note:** Route `/insights` is redirected to `/intelligence`, so this page is orphaned. Consider deletion.

### 4. ForBrands — STATS Array
**File:** `SOCELLE-WEB/src/pages/public/ForBrands.tsx`  
**Lines:** 54–58  
**Issue:** `{ value: '500+', label: 'Licensed operators' }` — Hardcoded. Not verified against DB count.

### 5. Professionals — STATS Array
**File:** `SOCELLE-WEB/src/pages/public/Professionals.tsx`  
**Lines:** 54–58  
**Issue:** `{ value: '500+', label: 'Licensed operators' }` — Same hardcoded claim. Not verified.

### 6. Plans — TIERS + COMPARISON Arrays
**File:** `SOCELLE-WEB/src/pages/public/Plans.tsx`  
**Lines:** 27–86, 96–107  
**Issue:** Pricing tiers (Free / $149 / Custom) and feature comparison are all hardcoded. Not connected to a `subscription_plans` table.  
**Note:** Acceptable for now if pricing is not yet in DB. But claims like "Real-time market signals (daily)" should match actual cadence.

### 7. ProtocolDetail — adoptionCount
**File:** `SOCELLE-WEB/src/pages/public/ProtocolDetail.tsx`  
**Line:** 181  
**Issue:** `{protocol.adoptionCount.toLocaleString()} professionals` — Count comes from protocol data but may be hardcoded in seed data. Verify if this is a computed aggregate or a static field.

### 8. BrandStorefront — Multiple Data Points
**File:** `SOCELLE-WEB/src/pages/public/BrandStorefront.tsx`  
**Lines:** 592, 715  
**Issue:** `{interestCount} professionals have already expressed interest` and `{peerData.professionalCount.toLocaleString()} licensed professionals` — These ARE fetched from Supabase but may resolve to 0. Verify empty state handling.

---

## P2 — STATIC CONTENT (Acceptable)

These pages use hardcoded content that is appropriate for static pages and do not require DEMO labeling.

| Page | File | Content Type | Status |
|---|---|---|---|
| About | `About.tsx` | VALUES array | ✅ Acceptable (mission/values = static) |
| FAQ | `FAQ.tsx` | FAQ_DATA array | ✅ Acceptable (FAQ = static content) |
| Privacy | `Privacy.tsx` | SECTIONS array | ✅ Acceptable (legal = static) |
| Terms | `Terms.tsx` | Content | ✅ Acceptable (legal = static) |
| HowItWorks | `HowItWorks.tsx` | STICKY_CARDS | ✅ Acceptable (explainer = static) |
| ApiDocs | `ApiDocs.tsx` | NAV_SECTIONS | ✅ Acceptable (docs = static) |
| ApiPricing | `ApiPricing.tsx` | Content | ✅ Acceptable (docs = static) |
| RequestAccess | `RequestAccess.tsx` | BENEFITS / BUSINESS_TYPES | ✅ Acceptable (form config) |
| ForMedspas | `ForMedspas.tsx` | Copy | ✅ Acceptable (landing page) |
| ForSalons | `ForSalons.tsx` | Copy | ✅ Acceptable (landing page) |

---

## SUMMARY

| Severity | Count | Action Required |
|---|---|---|
| **P0 — Fake Live** | 2 surfaces | Wire to DB or remove fake-live labels immediately |
| **P1 — Demo Data** | 6 surfaces | Label DEMO or wire to DB |
| **P2 — Static** | 10 surfaces | No action needed |

---

*Per `docs/command/SOCELLE_RELEASE_GATES.md` §9: All surfaces cited with exact file paths and line numbers.*
