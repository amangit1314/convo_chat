// // model for messae
// // sender name or id
// // chat id
// // message
// // timestamp

// const mongoose = require("mongoose");
// const Schema = mongoose.Schema;

// const messageSchema = new Schema({
//   sender: {
//     type: Schema.Types.ObjectId,
//     ref: "User",
//   },
//   chat: {
//     type: Schema.Types.ObjectId,
//     ref: "Chat",
//   },
//   message: {
//     type: String,
//     required: true,
//     trim: true,
//   },
//   timestamps: true,
// });

// const Message = mongoose.model("Message", messageSchema);
// module.exports = Message;
