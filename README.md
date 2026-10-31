# Vertex Approval Tracker — Phase 1

This is the foundation only: project setup, database schema, and a Supabase
connection check on the homepage. No login, no Outlook connection, and no
dashboard UI yet — those come in later phases.

---

## 1. Run it locally first (recommended before GitHub/Vercel)

| Step | Command / Action |
|---|---|
| 1 | Unzip this folder, open a terminal inside it |
| 2 | Run `npm install` |
| 3 | Copy `.env.example` to a new file named `.env.local` |
| 4 | Fill in `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY` (see Step 2 below for where to find these) |
| 5 | Run `npm run dev` |
| 6 | Open `http://localhost:3000` in your browser |

You should see "Vertex Approval Tracker — Phase 1 Setup Complete" and a
Supabase connection status. If it says the connection failed, double-check
Step 4 and that you've run the SQL in Step 2 below.

---

## 2. Set up Supabase (do this first)

| Step | Action |
|---|---|
| 1 | Go to supabase.com → New Project |
| 2 | Name it "vertex-approval-tracker", set a strong database password, choose a region close to Pakistan (e.g. Singapore) |
| 3 | Once created, go to **SQL Editor** → **New query** |
| 4 | Paste the contents of `supabase/migrations/0001_init.sql`, click **Run** |
| 5 | Open a new query, paste the contents of `supabase/migrations/0002_seed.sql`, click **Run** |
| 6 | Go to **Table Editor** and confirm you see: campuses, users, keywords, payment_requests, approvals, cheques — with campuses and keywords already containing your real data |
| 7 | Go to **Project Settings → API** |
| 8 | Copy the **Project URL** → this is `NEXT_PUBLIC_SUPABASE_URL` |
| 9 | Copy the **anon public** key → this is `NEXT_PUBLIC_SUPABASE_ANON_KEY` |

Put both into your `.env.local` file (locally) — you'll add them to Vercel
separately in Step 4, since `.env.local` is never uploaded anywhere.

---

## 3. Push the code to GitHub

| Step | Action |
|---|---|
| 1 | Go to github.com → **New repository** → name it `vertex-approval-tracker` → keep it **Private** → do not add a README (you already have one) → Create |
| 2 | In your terminal, inside this project folder, run: |

```
git init
git add .
git commit -m "Phase 1: project setup and Supabase schema"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/vertex-approval-tracker.git
git push -u origin main
```

Replace `YOUR-USERNAME` with your actual GitHub username. Your `.env.local`
will NOT be uploaded — it's excluded by `.gitignore` on purpose, since it
holds your real keys.

---

## 4. Deploy to Vercel

| Step | Action |
|---|---|
| 1 | Go to vercel.com → **Add New** → **Project** |
| 2 | Import the `vertex-approval-tracker` repository from GitHub |
| 3 | Before clicking Deploy, open **Environment Variables** and add: |

| Name | Value |
|---|---|
| `NEXT_PUBLIC_SUPABASE_URL` | (same value as your `.env.local`) |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | (same value as your `.env.local`) |

| Step | Action |
|---|---|
| 4 | Click **Deploy** |
| 5 | Once deployed, open the live link Vercel gives you — you should see the same "Phase 1 Setup Complete" page, now live on the internet |

---

## What's intentionally NOT in this phase

- No login screen yet
- No dashboard, inbox, or TAT tracker UI yet
- No Outlook / Microsoft Graph connection yet (your Client ID, Tenant ID,
  Client Secret and Redirect URI from Azure are not used yet — keep them
  saved privately, they're needed in Phase 3)
- Row Level Security is turned on for every table but has no policies yet,
  so no one (not even the app) can read/write rows until Phase 3 adds
  proper access rules tied to login

## Next phase

Once this is running locally and deployed on Vercel with the Supabase
connection showing "Connected successfully," come back and the next
instruction will build the login screen and the first dashboard UI.
