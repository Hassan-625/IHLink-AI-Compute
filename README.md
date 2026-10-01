# IHLink AI & Compute

Standalone managed AI, data-processing and compute-services platform.

## Platform role

- **Platform key:** `compute`
- **Frontend:** standalone repository
- **Backend:** shared IHLink Supabase project
- **Administration:** IHLink Command Center
- **Deployment:** Vercel

## Core capabilities

- AI and machine-learning workload requests
- Data processing and analysis
- Model experimentation and evaluation
- Compute profile and dataset requirements
- Estimated runtime and compute-job tracking
- Actual runtime, credits and cost usage records
- Quotations, invoices, files and support

## Architecture

Requested/estimated compute requirements are kept distinct from actual usage records. Authorized operations staff record runtime, credits and cost after workload execution.

The platform uses shared IHLink authentication and backend services while retaining its own customer-facing routes, platform authorization and specialist workflow.

## Technology

- React
- TypeScript
- Vite
- Tailwind CSS
- React Router
- Supabase
- Vercel

## Local development

```bash
npm install
npm run dev
```

Build for production with `npm run build`. Where configured, run `npm run typecheck` and `npm run lint` before release.

## Environment and secrets

Configure public client values such as `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY` through environment configuration. Cross-platform origin variables may be configured where IHLink handoff is required.

Never commit service-role credentials, payment/provider secrets, private API keys or webhook secrets.

## Data and security

Customer records are protected through Supabase Row Level Security and server-side workflows. Privileged operational changes and payment settlement must remain server-authorized. Specialist data must not become writable merely because an account is generally active.

## IHLink ecosystem integration

The application is a standalone IHLink platform connected to the shared backend and central Command Center. Authentication may be shared, but platform/service authorization remains explicit.

## Deployment

Production is deployed through the IHLink Vercel team. Verify production routing, environment configuration and core authenticated flows after each release.

## Ownership

**IHLink Co. Ltd.**  
Copyright © 2026 IHLink Co. Ltd. All rights reserved.
