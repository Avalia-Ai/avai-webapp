import fastify from "fastify";
import { env } from "process";
import "reflect-metadata";
import { DataSource, DataSourceOptions } from "typeorm";
import dotenv from "dotenv";

dotenv.config();

const dbConfig: DataSourceOptions = {
  type: "postgres",
  host: env.DB_HOST,
  port: Number(env.DB_PORT),
  username: env.DB_USERNAME,
  password: env.DB_PASSWORD,
  database: env.DB_NAME,
  synchronize: true,
  logging: false,
  entities: ["src/entities/**/*.ts"],
  migrations: ["src/migrations/**/*.ts"],
};

const dataSource = new DataSource(dbConfig);

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

server.listen({ port: 8080 }, (err, address) => {
  if (err) {
    console.error(err);
    process.exit(1);
  }
  console.log(`Server listening at ${address}`);
});
