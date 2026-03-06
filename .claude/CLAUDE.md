# SOCELLE GLOBAL — GOVERNANCE & OPERATING CONTEXT
**Authority:** This is the root governance file for the entire SOCELLE monorepo.  
**Last Updated:** March 5, 2026  
**Canonical Command Docs:** `docs/command/*`

---

## 1. CANONICAL DOCUMENT AUTHORITY

The following documents in `/docs/command/` are the **sole source of truth** for all platform decisions. No other document may override, contradict, or redefine what these documents establish.

| Document | Governs |
|---|---|
| `SOCELLE_CANONICAL_DOCTRINE.md` | Platform thesis, dual requirement doctrine, style locks (color/type/glass), banned language, conversion CTAs, voice, visual rules, data integrity rules |
| `SOCELLE_ENTITLEMENTS_PACKAGING.md` | Roles, plan tiers, free preview rules, mini-app unlock map, subscription hooks, entitlement enforcement |
| `SOCELLE_DATA_PROVENANCE_POLICY.md` | Allowed/disallowed sources, attribution, confidence scoring, freshness SLAs, influencer monitoring, truthfulness policy |
| `SOCELLE_FIGMA_TO_CODE_HANDOFF.md` | Token naming parity (Figma→CSS→Tailwind→Flutter), component naming, breakpoints, grids, export rules, no-drift checklist |
| `SOCELLE_RELEASE_GATES.md` | Pre-merge checklist, pre-deploy checklist, schema validation, no-fake-live validation, performance budgets, broken links, rollback protocol, **Doc Gate** |

**Rule:** If any file outside `/docs/command/` contradicts a command doc, the command doc wins. Update the contradicting file, not the command doc.

---

## 2. DOC GATE (GLOBAL QA ENFORCEMENT — NON-NEGOTIABLE)

Authoritative docs:
- `/docs/command/*` (global canonical)
- This file: `/.claude/CLAUDE.md` (global governance)
- Each app may have a local `CLAUDE.md` for stack-specific rules, but **local files may NOT override global doctrine**.

Every agent output, every PR, every document must pass the Doc Gate. Violations are **automatic FAIL — no exceptions.**

### FAIL Conditions

#### FAIL 1: External Doc Reference
Any output that treats a doc **outside** `/docs/command/` as authoritative → **FAIL**.

- ❌ "Per `SOCELLE_MASTER_WORK_ORDER.md`..." (legacy, not in `/docs/command/`)
- ❌ "Per `GOVERNANCE.md`..." (legacy, superseded)
- ❌ "Per `ART_DIRECTION_SPEC.md`..." (legacy, superseded)
- ✅ "Per `docs/command/SOCELLE_CANONICAL_DOCTRINE.md` §3..."

**Exception:** App-level `CLAUDE.md` files may contain stack-specific runtime rules that do not contradict command docs. These are operational context, not governance authority.

#### FAIL 2: New Work Order Docs
Any new "work order," "master plan," "master prompt," "rebuild plan," or equivalent governance document created **outside** `/docs/command/` → **FAIL**.

- ❌ Creating `SOCELLE_MASTER_WORK_ORDER_V10.md` in project root
- ❌ Creating `NEW_REBUILD_PLAN.md` anywhere
- ❌ Creating `PHASE_3_WORK_ORDER.md` in any directory
- ✅ Updating an existing command doc in `/docs/command/` via controlled change process (see §5)
- ✅ Creating app-specific implementation specs (e.g., `SOCELLE-WEB/docs/component_spec.md`) that reference command docs

#### FAIL 3: Contradiction
Any output that contradicts `/docs/command/` doctrine, entitlements, provenance, or design locks → **FAIL**.

- ❌ Using `#1E252B` for primary text (contradicts Doctrine §3)
- ❌ Displaying fake "Updated 3m ago" (contradicts Doctrine §6 + Provenance §7)
- ❌ Using `font-serif` on public pages (contradicts Doctrine §4)
- ❌ Creating outreach emails (contradicts Doctrine no-outreach rule)
- ❌ Proposing a pricing model that contradicts Entitlements doc

#### FAIL 4: Fake Live Claims
Any fake "live" claims — numbers, freshness timestamps, signal counts — not tied to real endpoints or clearly labeled DEMO/PREVIEW → **FAIL**.

- ❌ Hardcoded `"Updated 3 min ago"` with no `updated_at` column
- ❌ `"130+ sources"` when zero sources are connected
- ❌ Animated counters counting to fabricated numbers
- ✅ `"Preview data — live pipeline activates at launch"`
- ✅ `"DEMO"` badge on all mock surfaces

#### FAIL 5: Omitted Routes/Screens
Any audit or spec that omits routes or screens discovered in the repo inventory → **FAIL**.

- ❌ Spec that covers 20 of 26 public routes (6 missing = FAIL)
- ❌ Mobile screen inventory that skips orphaned screens
- ❌ Admin audit that ignores stub pages
- ✅ Complete inventory with status per route (active / stub / orphaned / planned)

### PASS Requirements

Every agent output must satisfy ALL of these to pass the Doc Gate:

| Requirement | Standard |
|---|---|
| **Cite file paths** | Every recommendation maps to a specific file path, route, endpoint, table, or component. No vague references. |
| **Provide diffs/patch lists** | Any proposed change includes a diff or patch list showing exactly what changes and where. |
| **Mark DEMO vs LIVE** | Every data surface in the output is explicitly labeled `DEMO` (mock/hardcoded) or `LIVE` (DB-connected with real `updated_at`). No ambiguity. |
| **Reference command docs** | Cite the specific command doc and section number for any governance rule applied. |
| **Complete coverage** | No page, route, screen, or surface may be omitted. "No page left behind." |

### Enforcement Script

```bash
# 1. No external doc references as authority
grep -rn "Per .*\.md" output/ | grep -v "docs/command/" | grep -v "CLAUDE.md" → must be empty

# 2. No new work order docs
find . -name "*WORK_ORDER*" -o -name "*MASTER_PLAN*" -o -name "*REBUILD*" \
  | grep -v "docs/command/" | grep -v "node_modules" → must be empty

# 3. No fake live claims
grep -rn "Updated .* ago" src/pages/ --include="*.tsx" \
  | grep -v "formatFreshness\|formatRelativeTime\|updated_at" → must be empty

# 4. Contradiction check (manual)
# Compare all color hex values, font references, CTA language against command docs
```

---

## 3. MINI-APP BOUNDARIES

SOCELLE is a modular platform. Each mini-app has a defined boundary. Agents must not cross boundaries without explicit coordination.

### App Boundaries

| Mini-App | Codebase Location | Runtime | Owner Agent |
|---|---|---|---|
| **Web (Public + Portals)** | `SOCELLE-WEB/` | Vite + React + Tailwind + Supabase | Web Agent |
| **Mobile** | `SOCELLE-MOBILE-main/apps/mobile/` | Flutter + Riverpod + Supabase | Mobile Agent |
| **Marketing Site** | `apps/marketing-site/` | Next.js (planned) | Web Agent |
| **Web Portal** | `apps/web-portal/` | TBD | Web Agent |
| **Supabase Backend** | `supabase/` | PostgreSQL + Edge Functions (Deno) | Backend Agent |
| **Shared Packages** | `packages/` | Shared config + UI primitives | All (read), Backend (write) |

### Studio Mini-Apps (within Web)

| Studio | Route Prefix | Status |
|---|---|---|
| Social Studio | `/studio/social/*` | Planned |
| CRM Studio | `/studio/crm/*` | Planned |
| Sales Studio | `/studio/sales/*` | Planned |
| Marketing Studio | `/studio/marketing/*` | Planned |
| Education Studio | `/studio/education/*` | Planned |

### Intelligence Mini-Apps (within Web + Mobile)

| Mini-App | Web Route | Mobile Screen | Status |
|---|---|---|---|
| Intelligence Hub | `/intelligence` | `IntelligenceScreen` | Partial (web only) |
| Jobs Intelligence | `/jobs`, `/jobs/:slug` | `JobsScreen` | Stub (web only) |
| Brand Intelligence | `/brands`, `/brands/:slug` | `BrandsScreen` | Partial (web only) |
| Events Radar | `/events` | `EventsScreen` | Stub (web only) |
| Education Academy | `/education` | `EducationScreen` | Stub (web only) |

### Operations Mini-Apps

| Mini-App | Route Prefix | Status |
|---|---|---|
| Admin Control Center | `/admin/*` | Active (24+ routes) |
| Ecommerce Marketplace | `/marketplace/*` | Planned |
| AI Layer | Edge Functions + `/api/*` | `ai-orchestrator` exists |

### Cross-Boundary Rules

1. **Mobile may not modify** `SOCELLE-WEB/` files or Supabase migrations.
2. **Web may not modify** `SOCELLE-MOBILE-main/` files.
3. **Both may read** `packages/` and `supabase/` schemas.
4. **Only Backend Agent** may create or modify Supabase migrations.
5. **Design token changes** require updates in both web (`tailwind.config.js`) and mobile (`socelle_theme.dart`) — coordinated by the Figma-to-Code handoff doc.
6. **Shared types** (database types, API contracts) live in `/packages/` or are generated from Supabase schema.

---

## 4. APP-LEVEL DELEGATION

Each app has its own `CLAUDE.md` for stack-specific runtime context. These files are **operational**, not **governance**. They may not contradict command docs.

| App | CLAUDE.md Location | Purpose |
|---|---|---|
| SOCELLE-WEB | `SOCELLE-WEB/.claude/CLAUDE.md` | Web stack rules, wave tracker, directory structure, tech stack, nav spec |
| SOCELLE-MOBILE | `SOCELLE-MOBILE-main/.claude/CLAUDE.md` | Flutter rules, state management, mobile-specific patterns (to be created) |
| Supabase Backend | `supabase/.claude/CLAUDE.md` | Migration rules, RLS patterns, edge function conventions (to be created) |

### What App-Level CLAUDE.md Files May Contain

- ✅ Stack-specific rules (React patterns, Flutter patterns, SQL conventions)
- ✅ Directory structure and file organization
- ✅ Current wave status and active work orders
- ✅ Build commands and verification steps
- ✅ Protected route lists (what not to touch)
- ✅ Tech stack details (versions, dependencies)

### What App-Level CLAUDE.md Files May NOT Contain

- ❌ Design token definitions (governed by Doctrine + Handoff docs)
- ❌ Color, font, or glass specifications (governed by Doctrine)
- ❌ Data integrity rules (governed by Provenance Policy)
- ❌ Entitlement/pricing definitions (governed by Entitlements doc)
- ❌ Release gate criteria (governed by Release Gates doc)
- ❌ Any rule that contradicts a command doc

**Resolution:** If an app-level CLAUDE.md contradicts a command doc, the command doc wins. Update the app-level file.

---

## 5. CHANGE CONTROL

### Modifying Command Docs

Command docs are **controlled documents**. They cannot be casually edited.

| Action | Process |
|---|---|
| Fix a typo or formatting | Direct edit, no approval needed |
| Clarify existing rule (no semantic change) | Direct edit, note in commit message |
| Add a new rule or section | Requires owner (Bruce) approval before merge |
| Modify an existing rule | Requires owner approval + impact assessment |
| Remove a rule | Requires owner approval + migration plan for affected surfaces |
| Add a new command doc | Requires owner approval |

### No Parallel Plans Enforcement

**ONE canonical plan. Updates go in command docs. No side channels.**

- ❌ Creating `MY_IMPLEMENTATION_PLAN.md` that duplicates or contradicts command docs
- ❌ Creating a "v2" of any command doc alongside the original
- ❌ Having multiple agents produce conflicting specs for the same surface
- ❌ Referencing Slack/Discord/email decisions as authority (if it's not in a command doc, it doesn't exist)
- ✅ All changes to platform rules flow through `/docs/command/` updates
- ✅ All agent work references command docs as the authority
- ✅ Implementation specs in app directories reference (not redefine) command doc rules

### Contradiction Resolution

When two sources disagree:

1. `/docs/command/*` wins over everything
2. `/.claude/CLAUDE.md` (this file) wins over app-level CLAUDE.md files
3. App-level CLAUDE.md wins over inline code comments
4. Inline code comments win over tribal knowledge

---

## 6. AGENT OPERATING RULES

### Before Starting Any Work

1. Read this file (`/.claude/CLAUDE.md`)
2. Read the relevant command docs in `/docs/command/`
3. Read the app-level CLAUDE.md for your target app
4. Confirm you know which mini-app boundary you're operating in
5. Confirm your output will pass the Doc Gate

### During Work

- Reference command docs by path: `docs/command/SOCELLE_CANONICAL_DOCTRINE.md §3`
- Do not create new governance documents outside `/docs/command/`
- Do not modify existing command docs without change control process
- Coordinate cross-boundary changes with the relevant app agent

### After Work

- Run the Doc Gate check on your output
- Run the pre-merge checklist from `docs/command/SOCELLE_RELEASE_GATES.md`
- Run the no-drift checklist from `docs/command/SOCELLE_FIGMA_TO_CODE_HANDOFF.md` (if design changes)
- Update the app-level CLAUDE.md wave tracker if applicable

---

*SOCELLE GLOBAL GOVERNANCE v1.0 — March 5, 2026 — Command Center Authority*
