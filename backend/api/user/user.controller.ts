import { PrismaClient } from "@prisma/client";
import { NextFunction, Request, Response } from "express";
import AuthenticatedRequest from "../../interfaces/AuthenticatedRequest";
import { generateAccessToken, generateRefresh } from "../../middlewares";

const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");
const prisma = new PrismaClient();
// import { v4 as uuidv4 } from 'uuid';
const uuid = require("uuid");
function generateUUID() {
 // generate uuid 
  return uuid.v4().replace(/-/g,'');
}

const uid = generateUUID();

export const registerUser = async (req: Request, res: Response) => {
  const { email, password, number } = req.body;

  if (!email || !number || !password) {
    return res.status(400).json({ message: "All fields are mandatory!" });
  }

  try {
    const existingUser = await prisma.user.findUnique({ where: { email } });

    if (existingUser) {
      return res.status(409).json({ message: "Email already exists" });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const createdUser = await prisma.user.create({
      data: {
        email,
        password: hashedPassword,
        number,
      },
    });

    res.status(201).json({
      status: true,
      data: {
        email: createdUser.email,
        _id: createdUser.uid,
        message: "Registration is successful",
      }
      
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Failed to register user" });
  }
};

export const loginUser = async (req: Request, res: Response) => {
  const { email, password } = req.body;

  try {
    const user = await prisma.user.findUnique({ where: { email } });

    if (!user) {
      return res
        .status(401)
        .json({ message: "Authentication failed. User not found." });
    }

    const isMatch = await bcrypt.compare(password, user.password);

    if (!isMatch) {
      return res
        .status(401)
        .json({ message: "Authentication failed. Wrong password." });
    }

    const accessToken = generateAccessToken(email, user.password);
    // generateRefresh token also
    const refreshToken = generateRefresh();

    res.cookie("token", accessToken, { httpOnly: true, maxAge: 3600000 });

    res.status(200).json({
      status: true,
      message: "Authentication successful.",
      data: {
        id: user.uid,
        email: user.email,
        username: user.username,
        accessToken: accessToken,
        refreshToken,
      },
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Internal server error." });
  }
};

export const logoutUser = async (req: Request, res: Response) => {
  try {
    res.clearCookie("token");
    res.status(200).json({ message: "User logged out successfully" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Failed to logout user" });
  }
};

export const getUserById = async (req: Request, res: Response) => {
  const { userId } = req.params;

  try {
    const user = await prisma.user.findUnique({
      where: {
        uid: userId,
      },
    });

    if (!user) {
      res.status(404).json({ message: "User not found" });
    }

    res.status(200).json(user);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Failed to fetch user" });
  }
};

export const getAllUsers = async (req: Request, res: Response) => {
  try {
    const users = await prisma.user.findMany();

    res.status(200).json(users);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Failed to fetch users" });
  }
};

export const updateUserProfile = async (req: Request, res: Response) => {
  const { profileImage, username, number } = req.body;
  const { userId } = req.params;

  try {
    const updatedUser = await prisma.user.update({
      where: {
        uid: userId,
      },
      data: {
        profileImage: profileImage || undefined,
        username: username || undefined,
        number: number || undefined,
      },
    });

    res.status(200).json(updatedUser);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Failed to update user profile" });
  }
};   