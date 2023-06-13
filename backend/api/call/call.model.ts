import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_API_KEY;

if (!supabaseUrl || !supabaseKey) {
    throw new Error('Supabase URL or API key is not provided.');
}

const supabase = createClient(supabaseUrl, supabaseKey);

interface Call {
    id: string;
    type: "video" | "voice";
    participants: string[];
    state: "join" | "call" | "hang" | "leave" | "dontPick";
    created_at: string;
}

const createCall = async (call: Call): Promise<Call | null> => {
    const { data, error } = await supabase.from("calls").insert([call]);
    if (error) {
        console.error("Error creating call:", error);
        return null;
    }
    return data?.[0] ?? null;
};

// Other CRUD operations for Call
