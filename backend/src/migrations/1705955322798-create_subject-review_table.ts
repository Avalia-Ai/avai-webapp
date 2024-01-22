import { MigrationInterface, QueryRunner } from "typeorm";

export class CreateSubjectReviewTable1705955322798
  implements MigrationInterface
{
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`           
    CREATE TABLE "subject_review" (
        "id" SERIAL PRIMARY KEY,
        "subject_id" INTEGER NOT NULL,
        "user_id" INTEGER NOT NULL,
        "created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        "updated_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    );

    ALTER TABLE "subject_review"
        ADD CONSTRAINT "FK_subject_review_subject" FOREIGN KEY ("subject_id") REFERENCES "subject"("id");

    ALTER TABLE "subject_review"
        ADD CONSTRAINT "FK_subject_review_user" FOREIGN KEY ("user_id") REFERENCES "user"("id");
`);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropTable("subject_review");
  }
}
