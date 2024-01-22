import { MigrationInterface, QueryRunner } from "typeorm";

export class CreateSubjectProfessorTable1705955284699
  implements MigrationInterface
{
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
        CREATE TABLE "subject_professor" (
            "id" SERIAL PRIMARY KEY,
            "subject_id" INTEGER NOT NULL,
            "professor_id" INTEGER NOT NULL
        );
  
        ALTER TABLE "subject_professor"
            ADD CONSTRAINT "FK_user_subject" FOREIGN KEY ("subject_id") REFERENCES "subject"("id");
  
        ALTER TABLE "subject_professor"
            ADD CONSTRAINT "FK_user_professor" FOREIGN KEY ("professor_id") REFERENCES "professor"("id");
  `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropTable("subject_professor");
  }
}
