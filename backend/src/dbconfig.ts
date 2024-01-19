import { env } from "process";
import dotenv from "dotenv";
import { PostgresConnectionOptions } from "typeorm/driver/postgres/PostgresConnectionOptions";

dotenv.config();

export const dbConfig: PostgresConnectionOptions = {
  type: "postgres",
  host: env.DB_HOST,
  port: Number(env.DB_PORT),
  username: env.DB_USERNAME,
  password: env.DB_PASSWORD,
  database: env.DB_NAME,
  synchronize: false,
  logging: false,
  entities: ["src/entities/*.ts"],
  migrations: ["src/migrations/*.ts"],
};
