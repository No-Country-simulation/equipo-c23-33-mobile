// Express

import { express } from "express";
import { morgan } from "morgan";
const app = express();

app.use(morgan('dev'))

// import router from "../routes/users.js";
// app.use(router);


export default app;
