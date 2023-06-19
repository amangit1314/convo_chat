import express, { Request, Response } from 'express';
import MessageResponse from '../interfaces/MessageResponse';

const router = express.Router();

router.get<{}, MessageResponse>('/', (req: Request, res: Response) => {
    res.json({
        message: 'Chat API - 👋🌎🗯',
    });
});

router.use('/user',);
router.use('/user:id/profile',);
router.use('/message',);
router.use('/call',);

export default router;

// import { logOut, loginUser, registerUser } from './user/user.controller';
// router.use('/companies',);
// router.use('/courses/course:id/',);
// router.post('/users/register', registerUser);
// router.post('/users/login', loginUser);
// router.post('/users/logout', logOut,);
// router.get("/current", middlewares.validateToken, loginUser);