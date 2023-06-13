import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_API_KEY;

if (!supabaseUrl || !supabaseKey) {
    throw new Error('Supabase URL or API key is not provided.');
}

const supabase = createClient(supabaseUrl, supabaseKey);


interface Message {
    id: string;
    chat_room_id: string;
    sender_id: string;
    type: "text" | "voice" | "video";
    content: string;
    reactions: { user_id: string; reaction: string }[];
    created_at: string;
}

const createMessage = async (message: Message): Promise<Message | null> => {
    const { data, error } = await supabase.from("messages").insert([message]);
    if (error) {
        console.error("Error creating message:", error);
        return null;
    }
    return data?.[0] ?? null;
};

// Other CRUD operations for Message
