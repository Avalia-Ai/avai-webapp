import { MigrationInterface, QueryRunner } from "typeorm";

export class CreateEssentialTables1705953485141 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
        CREATE TABLE "user" (
          id SERIAL PRIMARY KEY,
          name VARCHAR(255) NOT NULL,
          entering_semester DATE NOT NULL,
          email VARCHAR(255) NOT NULL,
          password VARCHAR(255) NOT NULL,
          created_at TIMESTAMP NOT NULL
      );
      `);

    await queryRunner.query(`
      CREATE TABLE "professor" (
          id SERIAL PRIMARY KEY,
          name VARCHAR(255) NOT NULL);`);

    await queryRunner.query(`
          CREATE TABLE "subject" (
              id SERIAL PRIMARY KEY,
              name VARCHAR NOT NULL,
              semester VARCHAR,
              mandatory BOOLEAN NOT NULL
          );
      `);

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
    queryRunner.dropTable("subject_review");
    queryRunner.dropTable("subject_professor");
    queryRunner.dropTable("subject");
    queryRunner.dropTable("professor");
    queryRunner.dropTable("user");
  }
}
