import { MigrationInterface, QueryRunner } from "typeorm";

export class ChangesSubjectSemesterToNumber1706134003199
  implements MigrationInterface
{
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(` 
            ALTER TABLE subject
            ALTER COLUMN semester TYPE integer USING semester::integer;`);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(` 
        ALTER TABLE subject
        ALTER COLUMN semester TYPE VARCHAR`);
  }
}
