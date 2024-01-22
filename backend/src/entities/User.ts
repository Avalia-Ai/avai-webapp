import { Entity, Column, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ nullable: false, type: "varchar" })
  name: string;

  @Column({ nullable: false, type: "date", name: "entering_semester" })
  enteringSemester: Date;

  @Column({ nullable: false, type: "varchar" })
  email: string;

  @Column({ nullable: false, type: "varchar" })
  password: string;

  @Column({ nullable: false, type: "date", name: "created_at" })
  createdAt: Date;
}
