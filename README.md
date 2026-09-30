# Life Checklist: setup guide

Your own copy of the app, running on your own free website and database. It takes about 30–45 minutes the first time. Supabase and GitHub update their menus now and then, so a button name may differ slightly from what's written here.

**What's in this folder**

| File | What it is |
|---|---|
| `index.html` | The app itself |
| `config.js` | Where you paste your two Supabase values |
| `supabase.js` | The code that talks to your database |
| `sw.js`, `manifest.webmanifest`, icons | Let the app install to your home screen and open offline |
| `setup.sql` | Creates your database table (used in step 2) |

---

## Step 0: Make a GitHub account
Go to **github.com** and sign up (free). You'll use it to sign into Supabase and to host the app.

## Step 1: Create a Supabase project (your database)
1. Go to **supabase.com** → **Start your project** → sign in with GitHub.
2. Click **New project**.
   - Name: `life-checklist`
   - Database password: click **Generate** and save it somewhere (you'll rarely need it).
   - Region: **Central EU (Frankfurt)** (closest to Croatia).
3. Click **Create new project** and wait 1–2 minutes.

## Step 2: Create the table
1. In the left sidebar, open **SQL Editor** → **New query**.
2. Open `setup.sql` from this folder, copy everything, and paste it in.
3. Click **Run**. You should see "Success. No rows returned".

This also turns on protection so each account can only see its own data.

## Step 3: Connect the app to your database
1. In Supabase, click **Connect** at the top (or **Project Settings → API Keys**).
2. Copy two things:
   - **Project URL**: looks like `https://abcdxyz.supabase.co`
   - **Publishable key**: starts with `sb_publishable_`. Older projects call it the **anon public** key.
   - Never use the **secret** or **service_role** key. That one must stay private.
3. Open `config.js` in a text editor (Notepad on Windows: right-click → Open with → Notepad). It looks like this:
   ```js
   window.LM_CONFIG = {
     url: "PASTE_YOUR_PROJECT_URL_HERE",
     key: "PASTE_YOUR_PUBLISHABLE_KEY_HERE"
   };
   ```
   Replace the text inside the quotes with your URL and key. Keep the quotes. Save.

## Step 4: Turn off email confirmation (simplest)
In Supabase: **Authentication → Sign In / Providers → Email** → switch off **Confirm email** → Save.
(If you leave it on, you'll need to click a link in an email when you create your account.)

## Step 5: Put the app online with GitHub Pages
1. On github.com click **+ → New repository**.
   - Name: `life-checklist`
   - Set it to **Public** (free Pages hosting needs that). Only the app's code is public. Your data stays locked in Supabase behind your login, and the publishable key is designed to be public.
   - Click **Create repository**.
2. On the next page click **uploading an existing file**.
3. Drag in **all the files from this folder** (the files themselves, not the folder). Then click **Commit changes**.
4. Go to the repository's **Settings → Pages**.
   - Source: **Deploy from a branch**
   - Branch: **main**, folder **/ (root)** → **Save**
5. Wait 1–2 minutes, then refresh. Your link appears at the top:
   `https://YOUR-GITHUB-NAME.github.io/life-checklist/`

## Step 6: Create your account
Open your link → type your email and a password → **Create account**. Your school timetable is already loaded.

## Step 7: Lock it so nobody else can sign up
Supabase → **Authentication → Sign In / Providers** → switch off **Allow new users to sign up** → Save.
You can still sign in on any device. Strangers who find the link can't make accounts on your database.

## Step 8: Put it on your home screen
- **iPhone (Safari):** open your link → **Share** button (square with an up arrow) → **Add to Home Screen** → **Add**.
- **Android (Chrome):** open your link → **⋮** → **Add to home screen** or **Install app** → **Install**.
- **PC (Chrome or Edge):** open your link → click the install icon at the right end of the address bar (a monitor with an arrow) → **Install**.

Sign in once on each device. After that it stays signed in and everything syncs.

---

## Good to know
- **Saving is automatic.** The corner shows *Synced*, *Saving…* or *Offline*. Changes made offline sync when you're back online.
- **Backups:** **Account → Download backup** saves a file with all your data. **Restore** loads one back.
- **Updating the app:** when Claude gives you a new `index.html`, open your GitHub repository → **Add file → Upload files** → drop it in → **Commit changes**. Your settings in `config.js` stay as they are, and your data isn't touched.
- **Free Supabase projects pause after about a week of no use.** If the app says it can't load, log into supabase.com and click **Restore project**. Your data is kept.
- **"Use on this device only"** on the sign-in screen runs the app with no account. It saves only in that browser and doesn't sync.
