
const express = require('express')
const helmet = require('helmet')
const cors = require('cors')
const dotenv = require('dotenv')
const morgan = require('morgan')

const router = './routes/product.route.js';

dotenv.config();

const app=express();

app.use(express.json());

app.use(helmet());

app.use(cors());

app.use(morgan("common"));

app.use("/products",router);


app.get("/",(req,res)=>res.send("Home"));

app.listen(process.env.PORT||3001);