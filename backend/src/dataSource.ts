import { DataSource } from "typeorm";
import { dbConfig } from "./dbconfig.ts";

export const dataSource = new DataSource(dbConfig);
