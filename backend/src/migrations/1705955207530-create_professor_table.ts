import { MigrationInterface, QueryRunner } from "typeorm";

export class CreateProfessorTable1705955207530 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
        CREATE TABLE "professor" (
            id SERIAL PRIMARY KEY,
            name VARCHAR(255) NOT NULL);`);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropTable("professor");
  }
}
