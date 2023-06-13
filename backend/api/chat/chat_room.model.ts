import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_API_KEY;

if (!supabaseUrl || !supabaseKey) {
    throw new Error('Supabase URL or API key is not provided.');
}

const supabase = createClient(supabaseUrl, supabaseKey);


interface ChatRoom {
    id: string;
    name: string;
    type: "direct" | "group";
    users: string[];
    created_at: string;
}

const createChatRoom = async (chatRoom: ChatRoom): Promise<ChatRoom | null> => {
    const { data, error } = await supabase.from("chat_rooms").insert([chatRoom]);
    if (error) {
        console.error("Error creating chat room:", error);
        return null;
    }
    return data?.[0] ?? null;
};

// Other CRUD operations for ChatRoom
