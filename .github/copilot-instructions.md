Checklist

- [x] Verify that the copilot-instructions.md file in the .github directory is created.
	- Created at `.github/copilot-instructions.md`.

- [x] Clarify Project Requirements
	- Next.js + TypeScript + Tailwind + Supabase + GitHub + Vercel.

- [x] Scaffold the Project
	- Bootstrapped with `create-next-app` (App Router, TS, Tailwind, ESLint) in current directory.

- [x] Customize the Project
	- Added Supabase client at `src/lib/supabase/client.ts` and example "Test Supabase" UI on home page.
	- Added `.env.local.example` and configured `.env.local` locally.

- [x] Install Required Extensions
	- No extensions required by setup tool.

- [x] Compile the Project
	- `npm run build` passes locally.

- [ ] Create and Run Task
	- Skipped (npm scripts suffice: `npm run dev`, `npm run build`).

- [ ] Launch the Project
	- Pending user confirmation to run `npm run dev`.

- [x] Ensure Documentation is Complete
	- Updated `README.md` with Supabase/GitHub/Vercel steps.

Notes
- CI added at `.github/workflows/ci.yml` (expects `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY` as repo secrets).
- `.env*` is git-ignored; keep secrets out of VCS.
