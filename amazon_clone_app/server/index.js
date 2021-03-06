const express = require('express');
const mongoose = require('mongoose');
const authRouter = require('./routes/auth');

const PORT = 3000;
const app = express();
const DB =
  'mongodb+srv://mahesh:mahesh95@cluster0.mgjdfuq.mongodb.net/?retryWrites=true&w=majority';

app.use(authRouter);
app.use(express.json());
mongoose
  .connect(DB)
  .then(() => {
    console.log('Connection Successful');
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, () => {
  console.log(`connected  at port  ${PORT}`);
});
