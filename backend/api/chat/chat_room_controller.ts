import { Server, Socket } from "socket.io";

const { createClient } = require('@supabase/supabase-js');
const supabase = createClient('https://xfhjgjtviyqcmsvvmbas.supabase.co', 'YOUR_SUPABASE_API_KEY');

const io = new Server();

// Socket.IO event handlers
io.on('connection', (socket: Socket) => {
    // Join chat room
    socket.on('joinChatRoom', async ({ chatRoomId, userId }: { chatRoomId: string, userId: string, }) => {
        try {
            // Update chat room in the database to add the user
            const { error } = await supabase
                .from("chat_rooms")
                .update({ users: supabase.sql(`users || ${userId}`) })
                .match({ id: chatRoomId });

            if (error) {
                throw error;
            }

            // Emit event to notify the user has joined the chat room
            socket.join(chatRoomId);
            io.to(chatRoomId).emit('chatRoomJoined', { chatRoomId, userId });
        } catch (error) {
            console.error("Error joining chat room:", error);
        }
    });

    // Leave chat room
    socket.on('leaveChatRoom', async ({ chatRoomId, userId }: { chatRoomId: string, userId: string }) => {
        try {
            // Update chat room in the database to remove the user
            const { error } = await supabase
                .from("chat_rooms")
                .update({ users: supabase.sql(`array_remove(users, ${userId})`) })
                .match({ id: chatRoomId });

            if (error) {
                throw error;
            }

            // Emit event to notify the user has left the chat room
            socket.leave(chatRoomId);
            io.to(chatRoomId).emit('chatRoomLeft', { chatRoomId, userId });
        } catch (error) {
            console.error("Error leaving chat room:", error);
        }
    });

    // Handle direct chat messages
    socket.on('directMessage', async ({ senderId, recipientId, message }: { senderId: string, recipientId: string, message: string }) => {
        try {
            // Process the direct chat message

            // Emit the message to the recipient(s)
            io.to(recipientId).emit('directMessage', { senderId, message });
        } catch (error) {
            console.error("Error sending direct chat message:", error);
        }
    });

    // Handle group chat messages
    socket.on('groupMessage', async ({ chatRoomId, userId, message }: { chatRoomId: string, userId: string, message: string }) => {
        try {
            // Process the group chat message

            // Emit the message to all members of the group
            io.to(chatRoomId).emit('groupMessage', { chatRoomId, userId, message });
        } catch (error) {
            console.error("Error sending group chat message:", error);
        }
    });

});

// Chat room controller
exports.createChatRoom = async (req: any, res: any) => {
    try {
        const { name, type, users } = req.body;

        // Create the chat room in the database

        // Emit an event to notify connected clients about the new chat room
        io.emit('chatRoomCreated', { name, type, users });

        // Send a response back to the client
        res.json({ success: true });
    } catch (error) {
        console.error("Error creating chat room:", error);
        res.status(500).json({ success: false, error: "Internal server error" });
    }
};

exports.deleteChatRoom = async (req: any, res: any) => {
    try {
        const { chatRoomId } = req.params;

        // Delete the chat room from the database

        // Emit an event to notify connected clients about the deleted chat room
        io.emit('chatRoomDeleted', { chatRoomId });

        // Send a response back to the client
        res.json({ success: true });
    } catch (error) {
        console.error("Error deleting chat room:", error);
        res.status(500).json({ success: false, error: "Internal server error" });
    }
};
