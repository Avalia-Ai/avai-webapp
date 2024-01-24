import { MigrationInterface, QueryRunner } from "typeorm";

export class ChangesSubjectReviewFK1706130311073 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
            ALTER TABLE "subject_review"
            DROP CONSTRAINT IF EXISTS "FK_subject_review_subject";
            
            ALTER TABLE "subject_review"
            RENAME COLUMN "subject_id" TO "subject_professor_id";
            
            ALTER TABLE "subject_review"
            ADD CONSTRAINT "FK_subject_review_subject_professor"
            FOREIGN KEY ("subject_professor_id")
            REFERENCES "subject_professor"("id");`);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
            ALTER TABLE "subject_review"
            DROP CONSTRAINT IF EXISTS "FK_subject_review_subject_professor";
            
            ALTER TABLE "subject_review"
            RENAME COLUMN "subject_professor_id" TO "subject_id";
            
            ALTER TABLE "subject_review"
            ADD CONSTRAINT "FK_subject_review_subject"
            FOREIGN KEY ("subject_id")
            REFERENCES "subject"("id");
        `);
  }
}
