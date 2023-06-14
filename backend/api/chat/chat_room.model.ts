const { createClient } = require('@supabase/supabase-js');
interface ChatRoom {
    id: string;
    name: string;
    type: "direct" | "group";
    users: string[];
    created_at: string;
}


const supabase = createClient('https://xfhjgjtviyqcmsvvmbas.supabase.co', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhmaGpnanR2aXlxY21zdnZtYmFzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI3MzI5NTUsImV4cCI6MTk4ODMwODk1NX0.cynDuO9vxKM6Yzo_UQJJ-5ePeATIY84ee2A3GmqvM8c');


// get all chat rooms
export const getChatRooms = async (req: any, res: any) => {
    try {
        const { data, error } = await supabase.from("chat_rooms").select();
        if (error) {
            throw error;
        }
        res.json({ success: true, data });
    } catch (error) {
        console.error("Error fetching chat rooms:", error);
        res.status(500).json({ success: false, error: "Internal server error" });
    }
};

// create chat room
export const createChatRoom = async (req: any, res: any, chatRoom: ChatRoom): Promise<ChatRoom | null> => {
    try {
        const { data, error } = await supabase.from("chat_rooms").insert([chatRoom]);
        if (error) {
            throw error;
        }
        res.json({ success: true, data: data?.[0] ?? null });
        return data?.[0] ?? null;
    } catch (error) {
        console.error("Error creating chat room:", error);
        res.status(500).json({ success: false, error: "Internal server error" });
        return null;
    }
};

// delete chat room
export const deleteChatRoom = async (req: any, res: any, chatRoomId: string): Promise<boolean> => {
    try {
        const { error } = await supabase.from("chat_rooms").delete().match({ id: chatRoomId });
        if (error) {
            throw error;
        }
        res.json({ success: true });
        return true;
    } catch (error) {
        console.error("Error deleting chat room:", error);
        res.status(500).json({ success: false, error: "Internal server error" });
        return false;
    }
};

// join chat room
export const joinChatRoom = async (req: any, res: any, chatRoomId: string, userId: string): Promise<boolean> => {
    try {
        const { error } = await supabase.from("chat_rooms").update({ users: { $add: [userId] } }).match({ id: chatRoomId });
        if (error) {
            throw error;
        }
        res.json({ success: true });
        return true;
    } catch (error) {
        console.error("Error joining chat room:", error);
        res.status(500).json({ success: false, error: "Internal server error" });
        return false;
    }
};

// add user to chat room
export const addUserToChatRoom = async (req: any, res: any, chatRoomId: string, userId: string): Promise<boolean> => {
    try {
        const { error } = await supabase.from("chat_rooms").update({ users: { $add: [userId] } }).match({ id: chatRoomId });
        if (error) {
            throw error;
        }
        res.json({ success: true });
        return true;
    } catch (error) {
        console.error("Error adding user to chat room:", error);
        res.status(500).json({ success: false, error: "Internal server error" });
        return false;
    }
};

// kick from chat room
export const kickFromChatRoom = async (req: any, res: any, chatRoomId: string, userId: string): Promise<boolean> => {
    try {
        const { error } = await supabase.from("chat_rooms").update({ users: { $remove: [userId] } }).match({ id: chatRoomId });
        if (error) {
            throw error;
        }
        res.json({ success: true });
        return true;
    } catch (error) {
        console.error("Error kicking from chat room:", error);
        res.status(500).json({ success: false, error: "Internal server error" });
        return false;
    }
};

// leave chat room
export const leaveChatRoom = async (req: any, res: any, chatRoomId: string, userId: string): Promise<boolean> => {
    try {
        const { error } = await supabase.from("chat_rooms").update({ users: { $remove: [userId] } }).match({ id: chatRoomId });
        if (error) {
            throw error;
        }
        res.json({ success: true });
        return true;
    } catch (error) {
        console.error("Error leaving chat room:", error);
        res.status(500).json({ success: false, error: "Internal server error" });
        return false;
    }
};
