const express = require("express");
const { chats } = require("./data/data");
const dotenv = require("dotenv");
const { userRoutes } = require("./routes/userRoutes");

const app = express();
dotenv.config();

var port = process.env.PORT || 4004;

//* endpoints
app.get("/", (req, res) => {
  res.send("Api is running");
});

app.use("/api/user", userRoutes);

app.listen(port, console.log(`Serve is started on ${port}`));
