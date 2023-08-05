import { PrismaClient } from '@prisma/client';
import { Server, Socket } from 'socket.io';

const prisma = new PrismaClient();
const io = new Server();

// Socket.IO event handler for new connections
io.on('connection', (socket: Socket) => {
    console.log('User connected:', socket.id);

    // Join chat room based on user IDs
    socket.on('joinChatRoom', async ({ userId1, userId2 }: { userId1: string; userId2: string }) => {
        try {
            // Create a unique chat room ID using the user IDs (you can use a hashing function or any other method)
            const chatRoomId = generateUniqueChatRoomId(userId1, userId2);

            // Emit event to notify the users about the new chat room
            socket.join(chatRoomId);
            io.to(chatRoomId).emit('chatRoomJoined', { chatRoomId, users: [userId1, userId2] });
        } catch (error) {
            console.error('Error joining chat room:', error);
        }
    });

    // Handle direct chat messages
    socket.on('directMessage', async ({ chatRoomId, senderId, receiverId, message }: { chatRoomId: string; senderId: string; receiverId: string; message: string }) => {
        try {
            // Process the direct chat message and save it to the database using Prisma
            await prisma.message.create({
                data: {
                    chatRoomId,
                    sender: senderId,
                    receiver: receiverId,
                    type: 'directChat',
                    content: message,
                },
            });

            // Emit the message to the recipient(s)
            io.to(chatRoomId).emit('directMessage', { chatRoomId, senderId, message });
        } catch (error) {
            console.error('Error sending direct chat message:', error);
        }
    });

    // Handle disconnection
    socket.on('disconnect', () => {
        console.log('User disconnected:', socket.id);
    });
});

// Helper function to generate a unique chat room ID
function generateUniqueChatRoomId(userId1: string, userId2: string) {
    return userId1 + userId2;
}

// Create Chat Room
export const createChatRoom = async (req: any, res: any) => {
    try {
        const { senderId, receiverId, type, users } = req.body;

        // Create the chat room in the database using Prisma
        const createdChatRoom = await prisma.directChat.create({
            data: {
                senderId,
                receiverId,
                type,
                users: { connect: users.map((userId: string) => ({ uid: userId })) },
            },
        });

        // Emit an event to notify connected clients about the new chat room
        io.emit('chatRoomCreated', { chatRoomId: createdChatRoom.roomId, name, type, users });

        // Send a response back to the client
        res.json({ success: true });
    } catch (error) {
        console.error('Error creating chat room:', error);
        res.status(500).json({ success: false, error: 'Internal server error' });
    }
};

// Delete chat room
export const deleteChatRoom = async (req: any, res: any) => {
    try {
        const { chatRoomId } = req.params;

        // Delete the chat room from the database using Prisma
        await prisma.chatRoom.delete({
            where: { roomId: chatRoomId },
        });

        // Emit an event to notify connected clients about the deleted chat room
        io.emit('chatRoomDeleted', { chatRoomId });

        // Send a response back to the client
        res.json({ success: true });
    } catch (error) {
        console.error('Error deleting chat room:', error);
        res.status(500).json({ success: false, error: 'Internal server error' });
    }
};

// Edit chat room details
export const editChatRoomDetails = async (req: any, res: any) => {
    try {
        const { chatRoomId } = req.params;
        const { name, type, users } = req.body;

        // Update the chat room in the database using Prisma
        const updatedChatRoom = await prisma.chatRoom.update({
            where: { roomId: chatRoomId },
            data: { name, type, users: { set: users.map((userId: string) => ({ uid: userId })) } },
        });

        // Emit an event to notify connected clients about the updated chat room
        io.emit('chatRoomUpdated', { chatRoomId: updatedChatRoom.roomId, name, type, users });

        // Send a response back to the client
        res.json({ success: true });
    } catch (error) {
        console.error('Error editing chat room details:', error);
        res.status(500).json({ success: false, error: 'Internal server error' });
    }
};

// Get all chat rooms
export const getAllChatRooms = async (req: any, res: any) => {
    try {
        // Fetch all chat rooms from the database using Prisma
        const chatRooms = await prisma.chatRoom.findMany();

        // Send the chat rooms as the response to the client
        res.json({ success: true, data: chatRooms });
    } catch (error) {
        console.error('Error getting all chat rooms:', error);
        res.status(500).json({ success: false, error: 'Internal server error' });
    }
};
