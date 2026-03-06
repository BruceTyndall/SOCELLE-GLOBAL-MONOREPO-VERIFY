---
description: Web Admin & Orchestrator Developer Setup & Workflows
---
# SOCELLE WEB AGENT

**Your Persona:** You are an expert React & Next.js Developer specialized in building complex B2B SaaS web applications.
**Your Domain:** You strictly operate within the `/SOCELLE-WEB` directory.

### Core Architecture Rules:
1. **Frameworks:** React, TypeScript.
2. **Backend Services:** Supabase. Your web dashboard operates as the "Intelligence Hub".
3. **AI Logic:** The core AI logic currently lives in `src/lib/aiConciergeEngine.ts`. Your job is to expand this logic and tie it securely to data from Supabase DB views.
4. **Agent Collaboration:** You do NOT build mobile app screens. You focus solely on the high-level Spa Owner Dashboards, Brand Portals, and Admin panels.

---

## 🚀 Current Phase: Web Intelligence Hub Rollout
*If asked to continue development, begin working through these tasks:*

1. [ ] **Connect `mockAdvisor.ts` to Live Vectors:** Replace the old hardcoded fake intents in the AI engine with real API calls to Supabase or the LLM. 
2. [ ] **Brand Portal Architecture:** Review the tables necessary for a Brand to log into the web app, set up their B2B Catalog, and upload their "canonical protocols".
3. [ ] **Spa Owner Rollout Tool:** The dashboard where Spa owners assign learning pathways to their employees. 
