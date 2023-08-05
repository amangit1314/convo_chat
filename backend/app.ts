import cors from 'cors';
import express from 'express';
import helmet from 'helmet';
import { createServer } from 'http';
import { Server, Socket } from 'socket.io';
import MessageResponse from './interfaces/MessageResponse';
import { errorHandler, notFound } from './middlewares';
import userRouter from './api/user/user.routes';
import dotenv from 'dotenv';

dotenv.config();
const app = express();
const server = createServer(app);
const io = new Server(server, {
  cors: {
    origin: ['*'],
  },
});

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

app.get<{}, MessageResponse>('/convo/api/v1/', (req, res) => {
  res.json({
    message: 'Api available for 🗯 chatting ✨👋 globally 🌍',
  });
});

app.use('/convo/api/v1/', userRouter);
app.use(notFound);
app.use(errorHandler);

export default app;
