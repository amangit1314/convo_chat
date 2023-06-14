
const { createMessage, deleteMessage, reactToMessage } = require('./message.model');

// Create message
export const createMessageController = async (req: any, res: any) => {
    try {
        const message = req.body;
        const createdMessage = await createMessage(message);
        if (createdMessage) {
            res.json({ success: true, data: createdMessage });
        } else {
            res.status(500).json({ success: false, error: 'Failed to create message' });
        }
    } catch (error) {
        console.error('Error creating message:', error);
        res.status(500).json({ success: false, error: 'Internal server error' });
    }
};

// Delete message
export const deleteMessageController = async (req: any, res: any) => {
    try {
        const messageId = req.params.messageId;
        const success = await deleteMessage(messageId);
        if (success) {
            res.json({ success: true });
        } else {
            res.status(500).json({ success: false, error: 'Failed to delete message' });
        }
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
        const success = await reactToMessage(messageId, userId, reaction);
        if (success) {
            res.json({ success: true });
        } else {
            res.status(500).json({ success: false, error: 'Failed to react to message' });
        }
    } catch (error) {
        console.error('Error reacting to message:', error);
        res.status(500).json({ success: false, error: 'Internal server error' });
    }
};