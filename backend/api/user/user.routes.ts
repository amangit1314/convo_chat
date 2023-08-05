import express from 'express';
import { validateToken } from "../../middlewares";
import { getAllUsers, getUserById, loginUser, logoutUser, registerUser, updateUserProfile } from "./user.controller";
const userRouter = express.Router();

userRouter.get("/users", getAllUsers);
userRouter.get("/users/profile:id", validateToken, getUserById);

userRouter.post("/users/login", loginUser);
userRouter.post("/users/register", registerUser);
userRouter.post("/users/logout", logoutUser);
userRouter.post("/users/profile:id", validateToken, updateUserProfile);

export default userRouter;
