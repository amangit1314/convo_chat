import express from 'express';
const messageRouter = express.Router();

const {
    createMessageController,
    deleteMessageController,
    reactToMessageController,
    getAllMessagesController,
    getMessageByIdController,
} = require('./message.controller');

// Send message
messageRouter.post('/messages/send', createMessageController);

// Receive message
messageRouter.get('/messages/:messageId', getMessageByIdController);

// Display all messages
messageRouter.get('/messages', getAllMessagesController);

// Delete message
messageRouter.delete('/messages/:messageId', deleteMessageController);

// React to message
messageRouter.post('/messages/:messageId/react', reactToMessageController);

module.exports = messageRouter;
