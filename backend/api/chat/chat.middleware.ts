
const chatRoomRouter = express.router;
const { createChatRoom, joinChatRoom, addUserToChatRoom, kickFromChatRoom, leaveChatRoom, deleteChatRoom, getChatRooms } = require('./chat_room.model');

// Get all chatRooms
chatRoomRouter.get('/chatRooms', getChatRooms);

// Create chat room
chatRoomRouter.post('/chatRooms', createChatRoom);

// Join chat room
chatRoomRouter.post('/chatRooms/:chatRoomId/join/:userId', joinChatRoom);

// Add user to chat room
chatRoomRouter.post('/chatRooms/:chatRoomId/users/:userId', addUserToChatRoom);

// Kick user from chat room
chatRoomRouter.delete('/chatRooms/:chatRoomId/users/:userId', kickFromChatRoom);

// Leave chat room
chatRoomRouter.delete('/chatRooms/:chatRoomId/users/:userId', leaveChatRoom);

// Delete chat room
chatRoomRouter.delete('/chatRooms/:chatRoomId', deleteChatRoom);

module.exports = chatRoomRouter;
