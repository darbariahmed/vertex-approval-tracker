import { createClient } from "@supabase/supabase-js";

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL as string;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY as string;

if (!supabaseUrl || !supabaseAnonKey) {
  // This only throws at runtime if the env vars are missing,
  // so the app fails loudly instead of silently using blank keys.
  console.warn(
    "Supabase env vars are missing. Check .env.local (local) or your Vercel Environment Variables."
  );
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey);
