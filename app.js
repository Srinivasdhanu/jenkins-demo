const express = require("express");

const app = express();

app.get('/', (req, res) => {
  res.send("This is my First Docker based web application")
})

app.listen(5000, () => {
  console.log("listening");
});
