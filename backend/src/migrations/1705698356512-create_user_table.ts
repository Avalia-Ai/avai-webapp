import { MigrationInterface, QueryBuilder, QueryRunner } from "typeorm";

export class CreateUserTable1705698356512 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
          CREATE TABLE "User" (
            id SERIAL PRIMARY KEY,
            name VARCHAR(255) NOT NULL,
            entering_semester DATE NOT NULL,
            email VARCHAR(255) NOT NULL,
            password VARCHAR(255) NOT NULL,
            created_at TIMESTAMP NOT NULL
        );
        `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropTable("User");
  }
}
