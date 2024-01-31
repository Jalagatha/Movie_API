const express = require("express");
const userRouter = require("./routes/usersRouter");
const moviesRouter = require("./routes/moviesRouter");
const reviewsRouter = require("./routes/reviewsRouter");
 const ordersRouter = require("./routes/orderRouter");

const morgan = require("morgan");
const server = express();

// middlewares

server.use(morgan('dev'));
server.use(express.json())
server.use("/api/v1/movies",moviesRouter);
server.use("/api/v1/users", userRouter);
server.use("/api/v1/reviews", reviewsRouter);
server.use("/api/v1/orders", ordersRouter);

server.get("/api/v1/", (req, res) => {
  // res.send("Hello World");
});

const PORT = process.env.PORT || 1339;
server.listen(PORT, () => {
  console.log(`Server is listening on Port:${PORT}`);
});