import fastify from "fastify";
import "reflect-metadata";
import { dataSource } from "./dataSource.ts";
import { dbConfig } from "./dbconfig.ts";
import routes from "./routes.ts";

await dataSource
  .initialize()
  .then(() => {
    console.log(
      `Database connected at http://${dbConfig.host}:${dbConfig.port}`
    );
  })
  .catch((err: unknown) => {
    console.error(
      `Database connection failed at http://${dbConfig.host}:${dbConfig.port}`,
      err
    );
  });

const server = fastify();

routes.forEach((route) => server.route(route));

server.listen({ port: 8080 }, (err, address) => {
  if (err) {
    console.error(err);
    process.exit(1);
  }
  console.log(`Server listening at ${address}`);
});
