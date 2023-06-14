import { Socket } from "socket.io/dist/socket";

const dotenv = require('dotenv');
const http = require('http');
const socketIO = require('socket.io');

const app = express();
const server = http.createServer(app);
const io = socketIO(server);

dotenv.config();

const port = process.env.PORT || 4004;

app.get("/", (req: any, res: { send: (arg0: string) => void; }) => {
  res.send("Api is running");
});

app.use(messageRouter);

app.listen(port, () => console.log(`Serve is started on ${port}`));

io.on('connection', (socket: Socket) => {
  // Handle direct chat messages
  socket.on('directMessage', (data) => {
    // Process the direct chat message
    // You can use the data to determine the recipient and the message content
    // Emit the message to the recipient(s)
    io.to(data.recipientSocketId).emit('directMessage', data.message);
  });
});

io.on('connection', (socket: Socket) => {
  // Handle group chat messages
  socket.on('groupMessage', (data) => {
    // Process the group chat message
    // You can use the data to determine the group and the message content
    // Emit the message to all members of the group
    socket.to(data.groupId).emit('groupMessage', data.message);
  });
});

