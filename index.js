const express = require("express");

const app = express();

app.get("/", (req, res) => {
  res.send("This is my first docker application");
});

app.get("/me", (req, res) => {
  res.send("Hi I am Laith");
});

app.listen(5000, () => {
  console.log("listening");
});
