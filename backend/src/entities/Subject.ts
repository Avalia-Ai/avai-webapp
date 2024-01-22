import { Entity, Column, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Subject {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ nullable: false, type: "varchar" })
  name: string;

  @Column({ nullable: true, type: "varchar" })
  semester: string;

  @Column({ nullable: false, type: "varchar" })
  mandatory: boolean;
}
