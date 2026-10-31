import { supabase } from "@/lib/supabaseClient";

export const dynamic = "force-dynamic";

export default async function Home() {
  let connectionStatus = "Not checked";
  let tableCount = 0;

  try {
    const { count, error } = await supabase
      .from("campuses")
      .select("*", { count: "exact", head: true });

    if (error) {
      connectionStatus = `Connected to Supabase, but query failed: ${error.message}`;
    } else {
      connectionStatus = "Connected to Supabase successfully";
      tableCount = count ?? 0;
    }
  } catch (err) {
    connectionStatus =
      "Could not reach Supabase. Check your .env.local values.";
  }

  return (
    <main className="min-h-screen flex items-center justify-center p-6">
      <div className="max-w-md w-full bg-panel border border-line rounded-lg p-8 text-center">
        <div className="text-xs text-ink-soft mb-2">Vertex Consulting</div>
        <h1 className="text-xl font-semibold mb-4">
          Vertex Approval Tracker — Phase 1 Setup Complete
        </h1>
        <p className="text-sm text-ink-soft mb-1">Supabase status:</p>
        <p className="text-sm font-medium mb-4">{connectionStatus}</p>
        <p className="text-xs text-ink-soft">
          Rows currently in campuses table: {tableCount}
        </p>
      </div>
    </main>
  );
}
