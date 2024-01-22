import { MigrationInterface, QueryRunner } from "typeorm";

export class SetAutoCreatedAtUser1705963341016 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
        ALTER TABLE "user"
        ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;`);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {}
}
