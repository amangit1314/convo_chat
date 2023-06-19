import { createClient } from '@supabase/supabase-js';
import cors from 'cors';
import express from 'express';
import helmet from 'helmet';
import { createServer } from 'http';
import { Server, Socket } from 'socket.io';
import router from './api/api';
import MessageResponse from './interfaces/MessageResponse';
import { errorHandler, notFound } from './middlewares';

require('dotenv').config();

const app = express();
const server = createServer(app);
const io = new Server(server, {
  cors: {
    origin: ['*'],
  },
});
const supabase = createClient("https://xfhjgjtviyqcmsvvmbas.supabase.co", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhmaGpnanR2aXlxY21zdnZtYmFzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI3MzI5NTUsImV4cCI6MTk4ODMwODk1NX0.cynDuO9vxKM6Yzo_UQJJ-5ePeATIY84ee2A3GmqvM8c");

app.use(helmet());
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

(io as any).on('connection', (socket: Socket) => {
  (socket as any).on('directMessage', (data: any) => {
    io.to(data.recipientSocketId).emit('directMessage', data.message);
  });
});

(io as any).on('connection', (socket: Socket) => {
  (socket as any).on('groupMessage', (data: any) => {
    socket.to(data.groupId).emit('groupMessage', data.message);
  });
});

app.get<{}, MessageResponse>('/', (req, res) => {
  res.json({
    message: 'Api available for 🗯 chatting ✨👋 globally 🌍',
  });
});

app.use('/api/v1', router);

app.use(notFound);
app.use(errorHandler);

export default app;
