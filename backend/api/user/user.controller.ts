const asyncHandler = require("express-async-handler");

const registerUser = asyncHandler(async (req: any, res: any) => {
  const { name, email, password } = req.params;
  if (!name || !email || !password) {
    res.status(400);
    throw new Error("Please Enter all the fields");
  }
});

const loginUser = asyncHandler(async (req: any, res: any) => {
  const { name, email, password } = req.params;
  if (!name || !email || !password) {
    res.status(400);
    throw new Error("Please Enter all the fields");
  }
});
