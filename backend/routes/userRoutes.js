const express = require("express");
const router = express.Router();

router.route("/login").post(registerUser);
router.post("/register", authUser);

module.exports = router;
