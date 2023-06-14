import { createClient } from '@supabase/supabase-js';

const supabase = createClient('https://xfhjgjtviyqcmsvvmbas.supabase.co', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhmaGpnanR2aXlxY21zdnZtYmFzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI3MzI5NTUsImV4cCI6MTk4ODMwODk1NX0.cynDuO9vxKM6Yzo_UQJJ-5ePeATIY84ee2A3GmqvM8c');

interface Message {
    id: string;
    chat_room_id: string;
    sender_id: string;
    type: "text" | "voice" | "video";
    content: string;
    reactions: { user_id: string; reaction: string }[];
    created_at: string;
}

export const createMessage = async (message: Message): Promise<Message | null> => {
    const { data, error } = await supabase.from("messages").insert([message]);
    if (error) {
        console.error("Error creating message:", error);
        return null;
    }
    return data?.[0] ?? null;
};

// Delete Message
export const deleteMessage = async (messageId: string): Promise<boolean> => {
    const { error } = await supabase.from("messages").delete().match({ id: messageId });
    if (error) {
        console.error("Error deleting message:", error);
        return false;
    }
    return true;
}

// React to Message
export const reactToMessage = async (messageId: string, userId: string, reaction: string): Promise<boolean> => {
    const { error } = await supabase.from("messages").update({ reactions: [{ user_id: userId, reaction }] }).match({ id: messageId });
    if (error) {
        console.error("Error reacting to message:", error);
        return false;
    }
    return true;
}
