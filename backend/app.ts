// import { createClient } from '@supabase/supabase-js';
import cors from 'cors';
import express from 'express';
import helmet from 'helmet';
import { createServer } from 'http';
import { Server, Socket } from 'socket.io';
// import api from './api/index';
import { getAllUsers, getUserById, loginUser, logoutUser, registerUser } from './api/user/user.controller';
import MessageResponse from './interfaces/MessageResponse';
import { errorHandler, notFound, validateToken } from './middlewares';

require('dotenv').config();

const app = express();
const server = createServer(app);
const io = new Server(server, {
  cors: {
    origin: ['*'],
  },
});
// const supabase = createClient("https://xfhjgjtviyqcmsvvmbas.supabase.co",
//   process.env.SUPABASE_ANON_KEY as string
// );

app.use(helmet());
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

io.sockets.on('connection', (socket: Socket) => {
  io.sockets.on('directMessage', (data: any) => {
    io.to(data.recipientSocketId).emit('directMessage', data.message);
  });

  io.sockets.on('groupMessage', (data: any) => {
    socket.to(data.groupId).emit('groupMessage', data.message);
  });
});

app.get<{}, MessageResponse>('/', (req, res) => {
  res.json({
    message: 'Api available for 🗯 chatting ✨👋 globally 🌍',
  });
});

app.get("/users/", getAllUsers);
app.get("/users/:id", getUserById);
app.post("/users/login", loginUser);
app.post("/users/register", registerUser);
app.post("/users/logout/:id", logoutUser);
app.post("/users/current", validateToken, loginUser);
app.put('/users/:id/profile');

// app.use('/api/v1', api);

app.use(notFound);
app.use(errorHandler);

export default app;
