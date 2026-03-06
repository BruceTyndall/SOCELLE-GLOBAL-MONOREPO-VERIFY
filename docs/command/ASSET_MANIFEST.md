# ASSET MANIFEST — SOCELLE GLOBAL
**Generated:** March 5, 2026 — V1 Visual Asset Inventory  
**Authority:** Per `docs/command/SOCELLE_CANONICAL_DOCTRINE.md` §7 (Beauty Is Visual)  
**Rule:** No gradient art blocks as content. Use repo visuals first.

---

## VIDEOS (6 files)

All located in `SOCELLE-WEB/public/videos/`

| File | Description | Recommended Placements |
|---|---|---|
| `dropper.mp4` | Close-up serum dropper — amber/gold tones | Homepage hero (currently used), Intelligence Hub hero |
| `blue-drops.mp4` | Blue liquid drops — clinical/scientific feel | For Medspas hero, Education hero |
| `tube.mp4` | Product tube — clean product shot | For Brands hero, Brand Storefront ambient |
| `foundation.mp4` | Foundation texture — premium beauty | For Salons hero, Professionals hero |
| `air-bubbles.mp4` | Air bubbles in liquid — ethereal/luxury | About page hero, Request Access hero |
| `yellow-drops.mp4` | Yellow/gold droplets — warm luxury | How It Works hero, Events page hero |

### Video Placement Status

| Page | Current Video | Recommended | Status |
|---|---|---|---|
| Homepage | `dropper.mp4` ✅ | — | ✅ Has video |
| Intelligence | None | `dropper.mp4` or `blue-drops.mp4` | ❌ Missing |
| Jobs | None | `foundation.mp4` | ❌ Missing |
| Brands | None | `tube.mp4` | ❌ Missing |
| Events | None | `yellow-drops.mp4` | ❌ Missing |
| Education | None | `blue-drops.mp4` | ❌ Missing |
| For Brands | None | `tube.mp4` | ❌ Missing |
| For Medspas | None | `blue-drops.mp4` | ❌ Missing |
| For Salons | None | `foundation.mp4` | ❌ Missing |
| Professionals | None | `foundation.mp4` | ❌ Missing |
| Plans | None | `air-bubbles.mp4` | ❌ Missing |
| How It Works | None | `yellow-drops.mp4` | ❌ Missing |
| About | None | `air-bubbles.mp4` | ❌ Missing |
| Request Access | None | `air-bubbles.mp4` | ❌ Missing |
| FAQ | N/A | Not required | ✅ N/A |
| Privacy / Terms | N/A | Not required | ✅ N/A |

**Summary:** Only 1 of 14 applicable pages has a video. Per Doctrine §7: "Every viewport-height section that could have a video, has one."

---

## PHOTOS (7 files)

All located in `SOCELLE-WEB/public/images/`

| File | Format | Description | Recommended Placements |
|---|---|---|---|
| `photo-1.svg` | SVG (base64 JPEG) | Beauty/treatment room | Intelligence signal cards, About page |
| `photo-2.svg` | SVG (base64 JPEG) | Product application | Brands directory cards, ForBrands |
| `photo-3.svg` | SVG (base64 JPEG) | Skincare closeup | Education cards, Protocol detail |
| `photo-4.svg` | SVG (base64 JPEG) | Professional setting | Jobs cards, Professionals page |
| `photo-5.svg` | SVG (base64 JPEG) | Spa/medspa interior | ForMedspas, ForSalons |
| `photo-6.svg` | SVG (base64 JPEG) | Brand product display | Brand storefront, Plans page |
| `photo-7.svg` | SVG (base64 JPEG) | Clinical environment | Intelligence Hub, Events page |

**Note:** These are SVG wrappers containing base64-encoded JPEGs. For production, extract the JPEG data and serve as proper AVIF/WebP per `docs/command/SOCELLE_FIGMA_TO_CODE_HANDOFF.md` §4 export rules.

---

## SWATCHES (12 files)

All located in `SOCELLE-WEB/public/images/swatches/`

| Files | Description | Recommended Placements |
|---|---|---|
| `1.svg` through `12.svg` | Color swatch graphics | Brand category icons, filter pills, product cards |

---

## OTHER ASSETS

| File | Location | Description |
|---|---|---|
| `favicon.ico` | `SOCELLE-WEB/public/` | Browser favicon |
| `favicon.svg` | `SOCELLE-WEB/public/` | SVG favicon |
| `og-image.svg` | `SOCELLE-WEB/public/` | OpenGraph share image |
| `vite.svg` | `SOCELLE-WEB/public/` | Vite default (should be removed) |
| `_headers` | `SOCELLE-WEB/public/` | Cloudflare headers |
| `_redirects` | `SOCELLE-WEB/public/` | Cloudflare redirects |

---

## ASSET GAPS

### Missing Assets Needed

| Asset | Type | Purpose | Priority |
|---|---|---|---|
| Hero poster frames | AVIF/WebP | Static fallback for video heroes on mobile/reduced-motion | P0 |
| Brand logos | PNG/SVG | Brand directory + storefront (currently text-only placeholders) | P1 |
| Signal card thumbnails | AVIF/WebP | Photo context for intelligence signals (Doctrine §7: "Numbers without visual context are naked assertions") | P1 |
| Event cover images | AVIF/WebP | Event cards in calendar view | P1 |
| Job company logos | PNG/SVG | Job listing cards | P2 |
| Studio preview mockups | AVIF/WebP | Studio landing pages (when built) | P2 |

---

*Per `docs/command/SOCELLE_CANONICAL_DOCTRINE.md` §7: Real imagery, not gradient placeholders. Per `docs/command/SOCELLE_FIGMA_TO_CODE_HANDOFF.md` §4: AVIF primary, WebP fallback, JPEG legacy.*
