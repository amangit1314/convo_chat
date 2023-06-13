// // chat name
// // is group chat
// // users
// // last message
// // group Admin if admin

// const mongoose = require("mongoose");
// const Schema = mongoose.Schema;

// const chatSchema = new Schema({
//   name: {
//     type: String,
//     required: true,
//     trim: true,
//   },
//   isGroupChat: {
//     type: Boolean,
//     required: true,
//     default: false,
//   },
//   users: [
//     {
//       type: Schema.Types.ObjectId,
//       ref: "User",
//     },
//   ],
//   lastMessage: {
//     type: Schema.Types.ObjectId,
//     ref: "Message",
//   },
//   groupAdmin: {
//     type: Schema.Types.ObjectId,
//     ref: "User",
//   },
//   timestamps: true,
// });

// const Chat = mongoose.model("Chat", chatSchema);
// module.exports = Chat;
