This is a [Next.js](https://nextjs.org) project bootstrapped with [`create-next-app`](https://nextjs.org/docs/app/api-reference/cli/create-next-app).

## Project Setup (Next.js + TypeScript + Tailwind + Supabase + GitHub + Vercel)

What’s included:
- Next.js 15 (App Router, TypeScript, Tailwind CSS)
- Supabase JS SDK with client at `src/lib/supabase/client.ts`
- Example env template: `.env.local.example`
- GitHub Actions CI (`.github/workflows/ci.yml`)

### 1) Environment Variables
Copy `.env.local.example` to `.env.local` and set real values:

```
NEXT_PUBLIC_SUPABASE_URL=https://ahxgjgorxyteneqacrws.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=...your anon key...
```

Note: `.env.local` is git-ignored by default.

### 2) Supabase Client
Use the exported `supabase` from `@/lib/supabase/client` in client components:

```ts
import { supabase } from "@/lib/supabase/client";
```

The home page includes a simple “Test Supabase” button to try a basic query.

### 3) GitHub Setup
- Create a new GitHub repository and add it as a remote:
	- `git remote add origin https://github.com/<you>/<repo>.git`
	- `git push -u origin main`
- Add the following repository secrets (Settings > Secrets and variables > Actions):
	- `NEXT_PUBLIC_SUPABASE_URL`
	- `NEXT_PUBLIC_SUPABASE_ANON_KEY`

### 4) Vercel Deployment
- Import this GitHub repo into Vercel
- Set Environment Variables in the Vercel Project Settings (same keys as above)
- Deploy. Vercel auto-detects Next.js and builds accordingly.

---

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.tsx`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/app/building-your-application/optimizing/fonts) to automatically optimize and load [Geist](https://vercel.com/font), a new font family for Vercel.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.
