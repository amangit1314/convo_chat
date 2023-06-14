const messageRouter = express.router;

const { createMessageController, deleteMessageController, reactToMessageController } = require('./message.controller');

// Create message
messageRouter.post('/messages', createMessageController);

// Delete message
messageRouter.delete('/messages/:messageId', deleteMessageController);

// React to message
messageRouter.post('/messages/:messageId/react', reactToMessageController);

module.exports = messageRouter;

