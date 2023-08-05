import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

// Create message
export const createMessageController = async (req: any, res: any) => {
    try {
        const { chatRoomId, sender, receiver, type, content } = req.body;
        const createdMessage = await prisma.message.create({
            data: {
                chatRoomId,
                sender,
                receiver,
                type,
                content,
            },
        });
        res.json({ success: true, data: createdMessage });
    } catch (error) {
        console.error('Error creating message:', error);
        res.status(500).json({ success: false, error: 'Internal server error' });
    }
};

// Delete message
export const deleteMessageController = async (req: any, res: any) => {
    try {
        const messageId = req.params.messageId;
        await prisma.message.delete({ where: { messageId } });
        res.json({ success: true });
    } catch (error) {
        console.error('Error deleting message:', error);
        res.status(500).json({ success: false, error: 'Internal server error' });
    }
};

// React to message
export const reactToMessageController = async (req: any, res: any) => {
    try {
        const messageId = req.params.messageId;
        const { userId, reaction } = req.body;

        // Create a new reaction and associate it with the message
        const createdReaction = await prisma.reaction.create({
            data: {
                userId,
                reaction,
                messageId,
            },
        });

        if (createdReaction) {
            res.json({ success: true });
        } else {
            res.status(500).json({ success: false, error: 'Failed to react to message' });
        }
    } catch (error) {
        console.error('Error reacting to message:', error);
        res.status(500).json({ success: false, error: 'Internal server error' });
    }
};