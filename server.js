import { fastify } from "fastify"
import cors from "@fastify/cors";
import { getsRoutes } from "./routes/gets.js";
import { postRoutes } from "./routes/posts.js";
import fastifyMysql from '@fastify/mysql';
import dotenv from 'dotenv';
import fastifyCookie from "@fastify/cookie";
import fastifyMultipart from 'fastify-multipart';

dotenv.config();

const secretKey = process.env.JWT_SECRET || "a92e57d1!23f65@12cad4b8714%e45^a67b3c&f974*6e2b5d7a41c2f65f7b8f1d944a3";
const server = fastify()

server.register(fastifyMultipart);

server.register(cors, {
  origin: "http://localhost:3000",
  methods: ["GET", "POST", "PUT", "DELETE"],
  credentials: true
});

server.register(fastifyCookie, {
  secret: secretKey,
  parseOptions: {}
});

server.register(fastifyMysql, {
  connectionString: 'mysql://root@localhost/servidornode'
});

server.register(getsRoutes);
server.register(postRoutes);

server.listen({ port: 3333 }, (err, address) => {
  if (err) {
    console.error(err);
  }
  console.log(`Server listening at ${address}`);
});
