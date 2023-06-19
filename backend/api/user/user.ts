const express = require("express");
const router = express.Router();

router.route("/login").post(loginUser);
router.route("/register").post(registerUser);

module.exports = router;
