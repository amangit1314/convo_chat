import dotenv from "dotenv";
// import { userRoutes } from "./routes/userRoutes";

const app = express();
dotenv.config();

const port = process.env.PORT || 4004;

//* endpoints
app.get("/", (req: any, res: { send: (arg0: string) => void; }) => {
  res.send("Api is running");
});

// app.use("/api/user", userRoutes);

app.listen(port, () => console.log(`Serve is started on ${port}`));
