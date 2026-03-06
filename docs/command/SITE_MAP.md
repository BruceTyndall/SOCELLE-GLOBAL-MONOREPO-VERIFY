# SITE MAP — SOCELLE GLOBAL
**Generated:** March 5, 2026 — G0 Repo Inventory  
**Authority:** Per `docs/command/SOCELLE_CANONICAL_DOCTRINE.md`  
**Source files:** `SOCELLE-WEB/src/App.tsx`, `SOCELLE-MOBILE-main/apps/mobile/lib/`

---

## WEB — PUBLIC ROUTES (30 routes)

| # | Route | Page File | Status | Data Source |
|---|---|---|---|---|
| 1 | `/` | `pages/public/Home.tsx` | Active | **DEMO** — hardcoded `INTELLIGENCE_SIGNALS` array |
| 2 | `/home` | Redirect → `/` | Redirect | — |
| 3 | `/brands` | `pages/public/Brands.tsx` | Active | **LIVE** — `supabase.from('brands')` |
| 4 | `/brands/:slug` | `pages/public/BrandStorefront.tsx` | Active | **LIVE** — `supabase.from('brands')` + seed content + products |
| 5 | `/intelligence` | `pages/public/Intelligence.tsx` | Active | **LIVE** — `useIntelligence()` hook → `market_signals` table |
| 6 | `/insights` | Redirect → `/intelligence` | Redirect | — |
| 7 | `/events` | `pages/public/Events.tsx` | Active | **LIVE** — `supabase.from('events')` (table may be empty) |
| 8 | `/jobs` | `pages/public/Jobs.tsx` | Active | **LIVE** — `supabase.from('job_postings')` |
| 9 | `/jobs/:slug` | `pages/public/JobDetail.tsx` | Active | **LIVE** — `supabase.from('job_postings')` |
| 10 | `/plans` | `pages/public/Plans.tsx` | Active | **DEMO** — hardcoded `TIERS` + `COMPARISON` arrays |
| 11 | `/about` | `pages/public/About.tsx` | Active | Static (content-only — appropriate) |
| 12 | `/education` | `pages/public/Education.tsx` | Active | **LIVE** — `supabase.from('protocols')` for category counts |
| 13 | `/protocols` | `pages/public/Protocols.tsx` | Active | **LIVE** — fetches protocols from Supabase |
| 14 | `/protocols/:slug` | `pages/public/ProtocolDetail.tsx` | Active | **LIVE** — protocol detail from Supabase |
| 15 | `/professionals` | `pages/public/Professionals.tsx` | Active | **DEMO** — hardcoded `FEATURES` + `STATS` arrays |
| 16 | `/for-brands` | `pages/public/ForBrands.tsx` | Active | **DEMO** — hardcoded `FEATURES` + `STATS` arrays |
| 17 | `/for-medspas` | `pages/public/ForMedspas.tsx` | Active | Static (landing page copy) |
| 18 | `/for-salons` | `pages/public/ForSalons.tsx` | Active | Static (landing page copy) |
| 19 | `/how-it-works` | `pages/public/HowItWorks.tsx` | Active | Static (content-only) |
| 20 | `/request-access` | `pages/public/RequestAccess.tsx` | Active | **LIVE** — `supabase.from('access_requests')` |
| 21 | `/faq` | `pages/public/FAQ.tsx` | Active | **DEMO** — hardcoded `FAQ_DATA` array (appropriate for FAQ) |
| 22 | `/privacy` | `pages/public/Privacy.tsx` | Active | Static (legal) |
| 23 | `/terms` | `pages/public/Terms.tsx` | Active | Static (legal) |
| 24 | `/forgot-password` | `pages/public/ForgotPassword.tsx` | Active | **LIVE** — `supabase.auth.resetPasswordForEmail` |
| 25 | `/reset-password` | `pages/public/ResetPassword.tsx` | Active | **LIVE** — `supabase.auth.updateUser` |
| 26 | `/api/docs` | `pages/public/ApiDocs.tsx` | Active | Static (documentation) |
| 27 | `/api/pricing` | `pages/public/ApiPricing.tsx` | Active | Static (documentation) |
| 28 | `/claim/brand/:slug` | `pages/claim/ClaimBrand.tsx` | Active | LIVE — claim flow |
| 29 | `/claim/business/:slug` | `pages/claim/ClaimBusiness.tsx` | Active | LIVE — claim flow |
| 30 | (orphaned) `Insights.tsx` | `pages/public/Insights.tsx` | Orphaned | **DEMO** — hardcoded `TREND_PLACEHOLDERS` (route redirected to `/intelligence`) |

---

## WEB — BUSINESS PORTAL (22 routes, prefix `/portal/*`)

| # | Route | Page File | Auth |
|---|---|---|---|
| 1 | `/portal` | `pages/business/PortalHome.tsx` | — |
| 2 | `/portal/login` | `pages/business/Login.tsx` | — |
| 3 | `/portal/signup` | `pages/business/Signup.tsx` | — |
| 4 | `/portal/dashboard` | `pages/business/Dashboard.tsx` | `business_user` / `admin` |
| 5 | `/portal/intelligence` | `pages/business/IntelligenceHub.tsx` | `business_user` / `admin` |
| 6 | `/portal/advisor` | `pages/business/AIAdvisor.tsx` | `business_user` / `admin` |
| 7 | `/portal/notifications` | `pages/business/NotificationPreferences.tsx` | `business_user` / `admin` |
| 8 | `/portal/plans` | `pages/business/PlansList.tsx` | `business_user` / `admin` |
| 9 | `/portal/plans/new` | `pages/business/PlanWizard.tsx` | `business_user` / `admin` |
| 10 | `/portal/plans/compare` | `pages/business/PlanComparison.tsx` | `business_user` / `admin` |
| 11 | `/portal/plans/:id` | `pages/business/PlanResults.tsx` | `business_user` / `admin` |
| 12 | `/portal/brands/:slug` | `pages/business/BrandDetail.tsx` | — |
| 13 | `/portal/orders` | `pages/business/Orders.tsx` | `business_user` / `admin` |
| 14 | `/portal/orders/:id` | `pages/business/OrderDetail.tsx` | `business_user` / `admin` |
| 15 | `/portal/account` | `pages/business/Account.tsx` | `business_user` / `admin` |
| 16 | `/portal/messages` | `pages/business/Messages.tsx` | `business_user` / `admin` |
| 17 | `/portal/calendar` | `pages/business/MarketingCalendar.tsx` | `business_user` / `admin` |
| 18 | `/portal/apply` | `pages/business/Apply.tsx` | `business_user` / `admin` |
| 19 | `/portal/claim/review` | `pages/business/ClaimReview.tsx` | `business_user` / `admin` |
| 20 | `/portal/ce-credits` | `pages/business/CECredits.tsx` | `business_user` / `admin` |
| 21 | `/portal/locations` | `pages/business/LocationsDashboard.tsx` | `business_user` / `admin` |
| 22 | `/portal/benchmarks` | `pages/business/BenchmarkDashboard.tsx` | `business_user` / `admin` |

---

## WEB — BRAND PORTAL (26 routes, prefix `/brand/*`)

| # | Route | Page File | Auth |
|---|---|---|---|
| 1 | `/brand/login` | `pages/brand/Login.tsx` | — |
| 2 | `/brand/apply` | `pages/brand/Apply.tsx` | — |
| 3 | `/brand/apply/received` | `pages/brand/ApplicationReceived.tsx` | — |
| 4 | `/brand` | Redirect → `/brand/dashboard` | `brand_admin` / `admin` |
| 5 | `/brand/dashboard` | `pages/brand/Dashboard.tsx` | `brand_admin` / `admin` |
| 6 | `/brand/claim/review` | `pages/brand/ClaimReview.tsx` | `brand_admin` / `admin` |
| 7 | `/brand/onboarding` | `pages/brand/Onboarding.tsx` | `brand_admin` / `admin` |
| 8 | `/brand/orders` | `pages/brand/Orders.tsx` | `brand_admin` / `admin` |
| 9 | `/brand/orders/:id` | `pages/brand/OrderDetail.tsx` | `brand_admin` / `admin` |
| 10 | `/brand/products` | `pages/brand/Products.tsx` | `brand_admin` / `admin` |
| 11 | `/brand/performance` | `pages/brand/Performance.tsx` | `brand_admin` / `admin` |
| 12 | `/brand/messages` | `pages/brand/Messages.tsx` | `brand_admin` / `admin` |
| 13 | `/brand/campaigns` | `pages/brand/Campaigns.tsx` | `brand_admin` / `admin` |
| 14 | `/brand/campaigns/new` | `pages/brand/CampaignBuilder.tsx` | `brand_admin` / `admin` |
| 15 | `/brand/automations` | `pages/brand/Automations.tsx` | `brand_admin` / `admin` |
| 16 | `/brand/promotions` | `pages/brand/Promotions.tsx` | `brand_admin` / `admin` |
| 17 | `/brand/customers` | `pages/brand/Customers.tsx` | `brand_admin` / `admin` |
| 18 | `/brand/pipeline` | `pages/brand/Pipeline.tsx` | `brand_admin` / `admin` |
| 19 | `/brand/storefront` | `pages/brand/Storefront.tsx` | `brand_admin` / `admin` |
| 20 | `/brand/intelligence` | `pages/brand/BrandIntelligenceHub.tsx` | `brand_admin` / `admin` |
| 21 | `/brand/advisor` | `pages/brand/BrandAIAdvisor.tsx` | `brand_admin` / `admin` |
| 22 | `/brand/notifications` | `pages/brand/BrandNotificationPreferences.tsx` | `brand_admin` / `admin` |
| 23 | `/brand/intelligence-pricing` | `pages/brand/IntelligencePricing.tsx` | `brand_admin` / `admin` |
| 24 | `/brand/intelligence-report` | `pages/brand/IntelligenceReport.tsx` | `brand_admin` / `admin` |
| 25 | `/brand/plans` | `pages/brand/Plans.tsx` (legacy) | `brand_admin` / `admin` |
| 26 | `/brand/leads` | `pages/brand/Leads.tsx` (legacy) | `brand_admin` / `admin` |

---

## WEB — ADMIN PORTAL (29 routes, prefix `/admin/*`)

| # | Route | Page File | Auth |
|---|---|---|---|
| 1 | `/admin/login` | `pages/admin/AdminLogin.tsx` | — |
| 2 | `/admin/debug-auth` | `pages/admin/AuthDebug.tsx` | `admin` |
| 3 | `/admin` | Redirect → `/admin/brands` | `admin` |
| 4 | `/admin/dashboard` | `pages/admin/AdminDashboard.tsx` | `admin` |
| 5 | `/admin/inbox` | `pages/admin/AdminInbox.tsx` | `admin` |
| 6 | `/admin/orders` | `pages/admin/AdminOrders.tsx` | `admin` |
| 7 | `/admin/orders/:id` | `pages/admin/AdminOrderDetail.tsx` | `admin` |
| 8 | `/admin/debug` | `pages/admin/DebugPanel.tsx` | `admin` |
| 9 | `/admin/submissions/:id` | `pages/admin/SubmissionDetail.tsx` | `admin` |
| 10 | `/admin/protocols/import` | `pages/admin/BulkProtocolImport.tsx` | `admin` |
| 11 | `/admin/ingestion` | `components/IngestionView.tsx` | `admin` |
| 12 | `/admin/protocols` | `components/ProtocolsView.tsx` | `admin` |
| 13 | `/admin/mixing` | `components/MixingRulesView.tsx` | `admin` |
| 14 | `/admin/costs` | `components/CostsView.tsx` | `admin` |
| 15 | `/admin/calendar` | `components/MarketingCalendarView.tsx` | `admin` |
| 16 | `/admin/rules` | `components/BusinessRulesView.tsx` | `admin` |
| 17 | `/admin/health` | `components/SchemaHealthView.tsx` | `admin` |
| 18 | `/admin/products` | Inline JSX (ProProductsView + RetailProductsView) | `admin` |
| 19 | `/admin/approvals` | `pages/admin/AdminApprovalQueue.tsx` | `admin` |
| 20 | `/admin/seeding` | `pages/admin/AdminSeeding.tsx` | `admin` |
| 21 | `/admin/signals` | `pages/admin/AdminSignals.tsx` | `admin` |
| 22 | `/admin/market-signals` | `pages/admin/AdminMarketSignals.tsx` | `admin` |
| 23 | `/admin/intelligence` | `pages/admin/IntelligenceDashboard.tsx` | `admin` |
| 24 | `/admin/reports` | `pages/admin/ReportsLibrary.tsx` | `admin` |
| 25 | `/admin/api` | `pages/admin/ApiDashboard.tsx` | `admin` |
| 26 | `/admin/regions` | `pages/admin/RegionManagement.tsx` | `admin` |
| 27 | `/admin/brands` | `pages/admin/AdminBrandList.tsx` | `admin` |
| 28 | `/admin/brands/new` | `pages/admin/BrandAdminEditor.tsx` | `admin` |
| 29 | `/admin/brands/:id` | Brand Hub (7 sub-routes below) | `admin` |

### Brand Hub Sub-Routes (`/admin/brands/:id/*`)

| # | Route | Page File |
|---|---|---|
| 29a | `/admin/brands/:id/profile` | `pages/admin/BrandAdminEditor.tsx` |
| 29b | `/admin/brands/:id/products` | `pages/admin/brand-hub/HubProducts.tsx` |
| 29c | `/admin/brands/:id/protocols` | `pages/admin/brand-hub/HubProtocols.tsx` |
| 29d | `/admin/brands/:id/education` | `pages/admin/brand-hub/HubEducation.tsx` |
| 29e | `/admin/brands/:id/orders` | `pages/admin/brand-hub/HubOrders.tsx` |
| 29f | `/admin/brands/:id/retailers` | `pages/admin/brand-hub/HubRetailers.tsx` |
| 29g | `/admin/brands/:id/analytics` | `pages/admin/brand-hub/HubAnalytics.tsx` |
| 29h | `/admin/brands/:id/settings` | `pages/admin/brand-hub/HubSettings.tsx` |

---

## WEB — LEGACY REDIRECTS (9 routes)

| Route | Redirects To |
|---|---|
| `/spa/login` | `/portal/login` |
| `/spa/signup` | `/portal/signup` |
| `/spa/dashboard` | `/portal/dashboard` |
| `/spa/plans` | `/portal/plans` |
| `/spa/plan/new` | `/portal/plans/new` |
| `/spa/plan/:id` | `/portal/plans/:id` |
| `/spa/plans/new` | `/portal/plans/new` |
| `/spa/plans/:id` | `/portal/plans/:id` |
| `/spa/*` | `/portal` |

---

## MOBILE — SCREENS (17 pages)

| # | Screen | File | Feature |
|---|---|---|---|
| 1 | AuthGatePage | `features/auth/auth_gate_page.dart` | Auth |
| 2 | OnboardingPage | `features/onboarding/onboarding_page.dart` | Onboarding |
| 3 | PaywallPage | `features/paywall/paywall_page.dart` | Paywall |
| 4 | DashboardPage | `features/dashboard/dashboard_page.dart` | Dashboard |
| 5 | FeedPage | `features/feed/feed_page.dart` | Feed |
| 6 | DiscoverPage | `features/discover/discover_page.dart` | Discover |
| 7 | ShopPage | `features/shop/shop_page.dart` | Shop |
| 8 | SchedulePage | `features/schedule/schedule_page.dart` | Schedule |
| 9 | StudioPage | `features/studio/studio_page.dart` | Studio |
| 10 | MessagesPage | `features/messages/messages_page.dart` | Messages |
| 11 | ProfilePage | `features/profile/profile_page.dart` | Profile |
| 12 | SettingsPage | `features/settings/settings_page.dart` | Settings |
| 13 | CancelInterceptPage | `features/settings/cancel_intercept_page.dart` | Settings |
| 14 | RevenuePage | `features/revenue/revenue_page.dart` | Revenue |
| 15 | WeeklySummaryPage | `features/weekly_summary/weekly_summary_page.dart` | Analytics |
| 16 | SupportPage | `features/support/support_page.dart` | Support |
| 17 | CleoShowcasePage | `features/cleo_showcase/cleo_showcase_page.dart` | AI (Cleo) |

---

## TOTAL ROUTE COUNT

| Surface | Count |
|---|---|
| Web Public | 30 (includes 2 redirects, 1 orphaned) |
| Web Business Portal | 22 |
| Web Brand Portal | 26 |
| Web Admin Portal | 29 (+ 8 brand-hub sub-routes) |
| Web Legacy Redirects | 9 |
| Mobile Screens | 17 |
| **TOTAL** | **133** |

---

*Per `docs/command/SOCELLE_RELEASE_GATES.md` §9 FAIL 5: No route omitted.*
