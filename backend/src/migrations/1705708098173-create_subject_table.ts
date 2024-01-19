import { MigrationInterface, QueryRunner } from "typeorm";

export class CreateSubjectTable1705708098173 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
            CREATE TABLE "Subject" (
                id SERIAL PRIMARY KEY,
                name VARCHAR NOT NULL,
                semester VARCHAR,
                mandatory BOOLEAN NOT NULL
            );
        `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
            DROP TABLE "Subject";
        `);
  }
}
