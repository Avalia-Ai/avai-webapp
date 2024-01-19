import { MigrationInterface, QueryRunner } from "typeorm";

export class CreateProfessorTable1705707429480 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
            CREATE TABLE "Professor" (
                id SERIAL PRIMARY KEY,
                name VARCHAR(255) NOT NULL);`);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropTable("Professor");
  }
}
