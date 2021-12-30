const express = require("express");

//Constants
const PORT = 8080;
const HOST = "127.0.0.1";

//App
const app = express();
app.get("/", (req, res) => {
   res.send("Hello world!!1234"); 
});

app.listen(PORT);
console.log(`Running on http://${HOST}:${PORT}`);