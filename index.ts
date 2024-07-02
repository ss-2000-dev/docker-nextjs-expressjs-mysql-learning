import express from "express";
import type { Express, Request, Response } from "express";

// import * as express from "express";
// const express = require("express");

// import だと Express 型
// require だと any 型+
const app: Express = express();
const port = 3000;

app.get("/", (req: Request, res: Response) => res.send("Hello World!!!"));

app.use("/express", express.static("public"));

app.listen(port, () => console.log(`Example app listening on port ${port}!`));
