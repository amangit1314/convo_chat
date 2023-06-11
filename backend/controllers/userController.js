const asyncHandler = require("express-async-handler");

const registerUser = asyncHandler(async () => {
  if (!name || !email || !password) {
    res.status(400);
    throw new Error("Please Enter all the fields");
  }
});
