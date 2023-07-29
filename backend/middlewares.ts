import { NextFunction, Request, Response } from 'express';
import ErrorResponse from './interfaces/ErrorResponse';
const jwt = require("jsonwebtoken");
const asyncHandler = require("express-async-handler");

export function notFound(req: Request, res: Response, next: NextFunction): void {
    res.status(404);
    const error = new Error(`🔍 - Not Found - ${req.originalUrl}`);
    next(error);
}

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export function errorHandler(err: Error, req: Request, res: Response<ErrorResponse>, next: NextFunction) {
    const statusCode = res.statusCode !== 200 ? res.statusCode : 500;
    res.status(statusCode);
    res.json({
        message: err.message,
        stack: process.env.NODE_ENV === 'production' ? '🥞' : err.stack,
    });
}

export const generateToken = async (email: string, hashedPassword: string) => {
    const token = jwt.sign(
        { email: email, password: hashedPassword },
        process.env.ACCESS_TOKEN_SECRET
    );
    return token;
};

export const generateAccessToken = (email: string, hashedPassword: string) => {
    const token = jwt.sign(
        { email: email, password: hashedPassword },
        process.env.JWT_SECRET,
        { expiresIn: process.env.ACCESS_TOKEN_EXPIRATION }
    );
    return token;
};

export const verifyToken = (req: any, res: any, next: any) => {
    const token = req.headers.authorization?.split(" ")[1];

    if (typeof token !== "undefined") {
        try {
            const payload = jwt.verify(token, process.env.JWT_SECRET);
            req.token = payload;
            next();
        } catch (err: any) {
            console.log("JWT Verification Error:", err);
            if (err.name === "TokenExpiredError") {
                res.status(401).send({ message: "Token has expired" });
            } else {
                res.status(401).send({ message: "Invalid token" });
            }
        }
    } else {
        console.log(token);
        res.status(401).send({ message: "Access denied. Token is missing" });
    }
};

export const generateRefreshToken = (email: string, hashedPassword: string) => {
    const refreshToken = jwt.sign(
        { email: email, password: hashedPassword },
        process.env.REFRESH_SECRET,
        { expiresIn: process.env.REFRESH_TOKEN_EXPIRATION }
    );
    return refreshToken;
};

export const verifyRefreshToken = async (refreshToken: string) => {
    try {
        const payload = await jwt.verify(refreshToken, process.env.REFRESH_SECRET);
        return payload.uid;
    } catch (error: any) {
        console.log(error.message);
    }
};

export const validateToken = asyncHandler((req: any, res: any, next: any) => {
    const authHeader = req.headers.authorization || req.headers.Authorization;
    if (authHeader && authHeader.startsWith("Bearer")) {
        const token = authHeader.split(" ")[1];
        try {
            const decoded = jwt.verify(token, process.env.ACCESS_TOKEN_SECRET);
            req.user = decoded.user;
            next();
        } catch (err) {
            res.status(401);
            throw new Error("User is not authorized");
        }
    } else {
        res.status(401);
        throw new Error("User is not authorized or token is missing");
    }
});