Claude Code updates this at the end of every session
Last Updated: 2026-03-05 (Session 25 — Wave 9 complete)
Current Phase: WAVE 10 — Live Data + External APIs
Next Milestone: Events table, Jobs table, RSS ingestion, Home live wire, ForgotPassword/ResetPassword token fix
Source of Truth: /docs/SOCELLE_MASTER_PROMPT_FINAL.md + CLAUDE.md (project root) + MASTER_STATUS.md (repo root)

⚠️ LAUNCH GATE — DO NOT GO LIVE
The site must NOT be made live (production deploy, DNS pointing to production, or public launch) until the product owner explicitly says "make it live" or "go live." Do not deploy to production, connect socelle.com to a live build, or remove any staging/preview safeguards without that explicit instruction.

---

⚠️ DESIGN SYSTEM CHANGE — READ BEFORE ANY UI WORK
Sessions 1–24 used pro-* tokens (pro-charcoal, pro-ivory, pro-gold, etc.).
Waves 1–9 (March 3–5, 2026) replaced ALL public page tokens with Pearl Mineral V2.
DO NOT use pro-* tokens on any page in src/pages/public/.
DO NOT use font-serif on any public page.
DO NOT use DM Serif Display, Playfair Display, or Inter on public pages.
The pro-* tokens still exist in portal code (business/brand/admin) for backward compat — do not clean those without a dedicated audit WO.
Full spec: CLAUDE.md (root) → LOCKED DESIGN SYSTEM section.

---

RECENT PROGRESS — WAVES 1–9 (March 3–5, 2026, Sessions ~25)

Design system overhaul (Waves 1–6):
- Pearl Mineral V2 applied to all 23 public pages
- Tailwind config: graphite = #141418, mn-bg = #F6F3EF, accent = #6E879B
- All pro-* tokens removed from public pages
- font-serif violations: 0 (cleaned in W9-06)
- Banned SaaS phrases: 0 (full copy sweep)
- General Sans via Fontshare wired as primary typeface on all public pages
- Liquid Pearl glass system on MainNav and cards

Navigation fixed (W9-01):
- MainNav updated to 8 required links: Intelligence | Brands | Education | Events | Jobs | For Buyers | For Brands | Pricing
- Auth-aware right pill: admin→/admin, business_user→/portal/dashboard, brand_admin→/brand/dashboard, guest→Sign In + Request Access

Conversion funnel fixed (W9-01):
- RequestAccess.tsx form now inserts to access_requests Supabase table (was broken — e.preventDefault() with no DB write)
- BenchmarkDashboard route added to App.tsx (/portal/benchmarks — was orphaned)

New pages built (W9-02, W9-03):
- Events.tsx at /events — Phase 1 stub with 8 mock events, dark hero, filter system
- Jobs.tsx at /jobs — stub with 12 mock jobs
- JobDetail.tsx at /jobs/:slug — job detail page

SEO (W9-04):
- Helmet meta tags added to: HowItWorks, Pricing, FAQ, Education, Protocols, Brands, ApiDocs, ApiPricing, ProtocolDetail

Live Data Infrastructure (W9-05):
- market_signals Supabase table created (migration: create_market_signals)
- 10 curated seed signals across 8 categories (migration: seed_market_signals_initial)
- useIntelligence.ts rewritten V2: fetches from market_signals → mock fallback → isLive flag
- Intelligence.tsx: PREVIEW banner when isLive=false, skeleton loading, dynamic freshness label
- Insights.tsx: Full rewrite to Pearl Mineral V2 (was still using pro-* tokens)
- AdminMarketSignals.tsx: New admin page at /admin/market-signals for curating signals

Infrastructure:
- MASTER_STATUS.md created at repo root — authoritative sweep of every page, portal, data state
- 70 migrations total (ADD ONLY policy strictly enforced)
- TypeScript: 0 errors. Build: passing.

RECENT PROGRESS — SESSIONS 18–24 (Feb 28, 2026)

- BUG-M01 fixed: Brand inbox rewritten from legacy brand_messages to conversations + messages system
- Admin Brand Hub: Orders, Products, Retailers, Analytics, Settings wired to DB
- Reseller application: /portal/apply, Dashboard Apply Now / Under review banners
- Order tracking: Reseller OrderDetail shows tracking section + Track package link
- Unverified business listing: /brand/pipeline, Flag as Fit → business_interest_signals
- Basic product search: tsvector on pro_products + retail_products (migration 20260228100001)
- Brand claim flow: /claim/brand/:slug, claim_brand RPC, /brand/claim/review
- Business claim flow: /claim/business/:slug, claim_business RPC, /portal/claim/review
- Returns workflow: request_return/resolve_return RPCs (migration 20260228100004)
- Order-linked messages: get_or_create_order_conversation RPC (migration 20260228100005)
- Email transactional: send-email Edge Function (Resend) — new_order + order_status types
- Dashboard resilience: Promise.allSettled on Business, Brand, Admin dashboards

---

AUTONOMOUS CORE INTELLIGENCE MODE (Payment Bypass — Still Active)
- Paywall is technically open: all users treated as PRO. No Stripe/RevenueCat/subscriptions implementation yet.
- Payment bypass flag: src/lib/paymentBypass.ts (VITE_PAYMENT_BYPASS=false to restore guards)
- All Tier 1 Payment tasks (Stripe checkout, Stripe Connect, subscription tables) remain POSTPONED
- Directive: /docs/SOCELLE_Master_Strategy_Build_Directive.md

---

PLATFORM SPECS / DEEP DIVES (consult when building in these areas)
| Doc | Use when |
|-----|----------|
| CLAUDE.md (root) | ALWAYS READ FIRST — design tokens, nav spec, protected routes, non-negotiable rules |
| MASTER_STATUS.md (root) | Current state of every page, portal, data source — updated Wave 9 |
| /docs/SOCELLE_MASTER_PROMPT_FINAL.md | Full product spec (note: design token section superseded by CLAUDE.md) |
| /docs/MASTER_PROMPT_VS_RESEARCH.md | Strategic alignment with 2026 Beauty/SaaS research |
| /docs/platform/RESELLER_EDUCATION_2026_DEEP_DIVE.md | Education Hub, reseller learning, credentials, AI-led flows |
| /docs/platform/UI_UX_SITE_DESIGN_DEEP_DIVE.md | UI/UX, site design — use for portal work; public page design governed by CLAUDE.md |
| /docs/platform/COMMUNITY_NEWS_AND_BEAUTY_INTELLIGENCE_DEEP_DIVE.md | Community, news/digests, AI beauty intelligence, habit loops |
| /docs/platform/FIGMA_AUDIT_AND_ACTION_PLAN.md | Figma audit checklist |
| /docs/MASTER_BRAIN_ARCHITECTURE.md | AI orchestrator (4-tier OpenRouter), atomic credits, mobile-web tokens |
| /docs/SOCELLE_Master_Strategy_Build_Directive.md | Autonomous Core Intelligence — payment bypass, mission priorities |
| /docs/SOCELLE_COMPLETE_API_CATALOG.md | 90+ external APIs cataloged — 0 integrated as of Wave 9 |

---

WAVE 10 — CURRENT PRIORITIES (Short Term, 1–2 weeks)

🔴 Fix Before Launch (P0 remaining)
| # | Task | File | Est |
|---|------|------|-----|
| W10-01 | ForgotPassword + ResetPassword still use pro-* tokens | ForgotPassword.tsx, ResetPassword.tsx | 1h |
| W10-02 | Home market pulse numbers hardcoded (2,847 professionals etc.) — no DEMO label | Home.tsx | 0.5h |
| W10-03 | BrandStorefront adoption metrics — no PREVIEW label | BrandStorefront.tsx | 0.5h |
| W10-04 | Insights.tsx orphaned — not in nav, not linked. Decide: wire to Intelligence or remove | Insights.tsx + Nav | 0.5h |

🟡 Wave 10 Features
| # | Feature | Scope | Est |
|---|---------|-------|-----|
| W10-05 | events Supabase table + wire Events.tsx | Migration + page update | 4h |
| W10-06 | job_postings Supabase table + wire Jobs.tsx | Migration + page update | 6h |
| W10-07 | Home market pulse live wire (COUNT from Supabase) | Migration view + Home.tsx | 3h |
| W10-08 | RSS ingestion pipeline — Edge Function, 10 feeds, rss_items table | Edge Fn + migration | 10h |
| W10-09 | Open Beauty Facts integration — ingredients table | Edge Fn + migration | 8h |
| W10-10 | NPI Registry operator verification | Edge Fn + businesses column | 6h |
| W10-11 | Auto-email trigger on access_requests INSERT | DB webhook + send-email edge fn | 2h |

---

PHASE 1 STATUS — MIGRATIONS (15 total — ALL COMPLETE ✅)
All Phase 1 migrations applied. See MASTER_STATUS.md for full Supabase state.
Total migrations as of Wave 9: 70

PHASE 1 STATUS — FEATURES
Commerce (Core Critical Path)
| Feature | Status | Notes |
|---------|--------|-------|
| Brand storefront pages | ✅ Complete | Public /brands/:slug live |
| Product catalog management | ✅ Complete | |
| Multi-brand cart (localStorage) | 🔄 Partial | Cart exists, checkout not wired (payments postponed) |
| Checkout (Stripe) | ⬜ Postponed | Payment bypass active |
| Brand payouts (Stripe Connect) | ⬜ Postponed | |

Accounts & Onboarding
| Feature | Status | Notes |
|---------|--------|-------|
| Brand onboarding (direct apply) | ✅ Complete | /brand/apply + wizard |
| Brand onboarding (claim flow) | ✅ Complete | /claim/brand/:slug |
| Business/reseller onboarding | ✅ Complete | /portal/signup |
| Business claim flow | ✅ Complete | /claim/business/:slug |

Intelligence (NEW — Wave 9)
| Feature | Status | Notes |
|---------|--------|-------|
| market_signals table + seed | ✅ Complete | 10 seed signals |
| useIntelligence.ts V2 | ✅ Complete | Supabase fetch + mock fallback |
| Intelligence.tsx PREVIEW mode | ✅ Complete | isLive flag drives banner |
| AdminMarketSignals.tsx | ✅ Complete | /admin/market-signals |
| Events page | ✅ Stub | Mock data — needs Supabase events table |
| Jobs page | ✅ Stub | Mock data — needs job_postings live |

Messaging
| Feature | Status | Notes |
|---------|--------|-------|
| Conversations + messages model | ✅ Complete | |
| Inbox UI (business + brand) | ✅ Complete | |
| Order-linked messages | ✅ Complete | |
| Broadcast messages | ⬜ Not Started | Phase 3 |

PHASE 2 STATUS — NOT STARTED
| # | Migration | Status |
|---|-----------|--------|
| 01 | 20260301000001 — create spa_menu_items | ⬜ Not Started |
| 02 | 20260301000002 — create reseller_saved_protocols | ⬜ Not Started |
| 03 | 20260301000003 — create reseller_inventory | ⬜ Not Started |
| 04 | 20260301000004 — create brand_rep_assignments | ⬜ Not Started |

PHASE 2 FEATURES — NOT STARTED
- Course builder, Education library, Certification system (Education module)
- Socelle Academy v1
- Live training scheduler (Zoom integration)

PHASE 3–7 STATUS — NOT STARTED
- Phase 3: Marketing Studio + Payments + Beauty Intelligence
- Phase 4: Community + Social Proof
- Phase 5: Analytics + Reporting
- Phase 6: Mobile Native
- Phase 7: International

---

BUILT — PRE-WAVE HERITAGE FEATURES (still live in codebase)
| Feature | Route | Status | Note |
|---------|-------|--------|------|
| Brand portal — Performance analytics | /brand/performance | ✅ Functional | Real Supabase queries |
| Brand portal — Customers (retailer CRM) | /brand/customers | ✅ Functional | |
| Edge — AI Orchestrator (4-tier) | supabase/functions/ai-orchestrator | ✅ Deployed | OpenRouter: Claude Sonnet/Gemini 2.5 Pro/GPT-4o-mini/Llama 3.3 Groq |
| Edge — AI Concierge | supabase/functions/ai-concierge | ✅ Deployed | Delegates to orchestrator |
| Edge — Credit banking | migrations/20260228000001 | ✅ Applied | tenant_balances, deduct_credits(), top_up_credits() |
| Edge — Stripe webhook | supabase/functions/stripe-webhook | ✅ Deployed | Wired but Stripe not yet active |
| Edge — send-email (Resend) | supabase/functions/send-email | ✅ Deployed | new_order + order_status types live |

---

LIVE BUGS TRACKER
| ID | Bug | Status | Priority |
|----|-----|--------|----------|
| BUG-B01 | plans.business_id queried but may not exist | ✅ Fixed | — |
| BUG-B02 | plans.fit_score queried but may not exist | ✅ Fixed | — |
| BUG-M01 | Brand inbox on legacy brand_messages | ✅ Fixed | — |
| BUG-W9-01 | ForgotPassword/ResetPassword still use pro-* tokens | ⚠️ Open | Low — functional |
| BUG-W9-02 | Home market pulse numbers hardcoded, no DEMO label | ⚠️ Open | Medium |
| BUG-W9-03 | BrandStorefront adoption % hardcoded, no PREVIEW label | ⚠️ Open | Low |

---

EXTERNAL SETUP REQUIRED (Owner: Human)
| Item | Needed For | Status |
|------|-----------|--------|
| Stripe account + API keys | Checkout | ⬜ Postponed |
| Stripe Connect setup | Brand payouts | ⬜ Postponed |
| Brevo account + API key | Marketing broadcasts (Phase 3) | ⬜ Not Started |
| Supabase project (Web) | Everything | ✅ rumdmulxzmjtsplsjngi |
| Resend API key | Transactional email | ✅ Wired in send-email fn |

---

DECISIONS LOG
| Date | Decision | Why |
|------|----------|-----|
| 2026-02-24 | Replaced brand_messages with conversations + messages system | Old threading model too limited |
| 2026-02-28 | Payment bypass (Autonomous Core Intelligence) activated | Focus Master Brain + Identity Bridge; payments postponed |
| 2026-02-28 | Platform deep dives adopted as reference specs | Secure product + design direction in master build |
| 2026-02-28 | Master Brain mandatory for all AI and mobile UX | All AI via ai-orchestrator; atomic credits; WCAG 2.2 AA |
| 2026-03-05 | Pearl Mineral V2 design system adopted for all public pages | Intelligence-first thesis; pro-* tokens banned on public pages |
| 2026-03-05 | Intelligence-first product thesis | Platform is intelligence first, marketplace second |
| 2026-03-05 | MASTER_STATUS.md created as live audit document | build_tracker was stale; needed authoritative current-state sweep |
| 2026-03-05 | market_signals table + AdminMarketSignals UI created | False live claims on Intelligence Hub needed real data infrastructure |

---

AGENT COORDINATION RULES
1. Read CLAUDE.md (root) FIRST before any work — non-negotiable rules, token spec, protected routes
2. Read MASTER_STATUS.md before starting any feature — it has the live sweep of every page
3. Run `npx tsc --noEmit` AND `npm run build` before marking any work complete
4. Portal routes (/portal/*, /brand/*, /admin/*) — DO NOT MODIFY without explicit WO scope
5. Supabase migrations — ADD ONLY, never modify existing
6. Commerce flow (cart, checkout, orders) — NEVER MODIFY
7. Auth system (ProtectedRoute, AuthProvider) — NEVER MODIFY
8. No pro-* tokens on public pages (src/pages/public/)
9. No font-serif on public pages
10. Intelligence leads, marketplace follows — visible in every output
11. Update this file at the end of every session

---

DAILY STANDUP FORMAT
Paste this as your FIRST message in every Claude Code session:
---DAILY STANDUP---
Date:
Session Goal:
Current Wave/Phase:
Last Session Summary:
Time Available:
Blocker?:
---END STANDUP---

STATUS KEY
⬜ Not Started
🔄 In Progress
✅ Complete
❌ Blocked — needs decision
⚠️ Complete but needs attention
🔁 Needs revision

WEEKLY REVIEW PROMPT
Paste this every Friday:
Weekly review time. Do the following:
1. Read /docs/build_tracker.md
2. Read CLAUDE.md (root) and MASTER_STATUS.md (root)
3. Read /docs/SOCELLE_MASTER_PROMPT_FINAL.md Sections 12 and 22
4. If Education, UI/UX, messaging, or Phase 3 intelligence work was done: confirm alignment with /docs/platform/ deep dives
5. Check all file changes from this week (git log --since="7 days ago")
6. Produce a weekly summary: phases progressed, migrations completed, features shipped, bugs fixed, blockers, next 5 tasks
7. Update this file with current status
8. Are we on track? If not, what should we cut or descope?

MILESTONE TRACKER
| Milestone | Target Phase | Status |
|-----------|-------------|--------|
| All Phase 1 migrations (15) | Phase 1 | ✅ |
| P0 bugs fixed (plans.business_id, plans.fit_score) | Phase 1 | ✅ |
| Brand storefront pages live | Phase 1 | ✅ |
| Pearl Mineral V2 on all public pages | Wave 9 | ✅ |
| font-serif violations eliminated | Wave 9 | ✅ |
| MainNav 8 required links | Wave 9 | ✅ |
| RequestAccess form wired to Supabase | Wave 9 | ✅ |
| market_signals table + seed | Wave 9 | ✅ |
| Events page (stub) | Wave 9 | ✅ |
| Jobs page (stub) | Wave 9 | ✅ |
| Events table (live Supabase) | Wave 10 | ⬜ |
| Jobs table (live Supabase) | Wave 10 | ⬜ |
| Home market pulse live wire | Wave 10 | ⬜ |
| RSS ingestion pipeline | Wave 10 | ⬜ |
| ForgotPassword/ResetPassword token fix | Wave 10 | ⬜ |
| Multi-brand checkout (Stripe) | Phase 3 | ⬜ Postponed |
| Brand payouts (Stripe Connect) | Phase 3 | ⬜ Postponed |
| Education Hub v1 | Phase 2 | ⬜ |
| Mobile native app | Phase 6 | ⬜ |

Update this file at the end of every Claude Code session.
It is the first thing Claude Code reads at the start of every session.
An outdated tracker means a confused Claude Code and wasted build time.
