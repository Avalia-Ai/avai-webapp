import { Entity, Column, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Subject {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ nullable: false, type: "varchar" })
  name: string;

  @Column({ nullable: true, type: "integer" })
  semester: number;

  @Column({ nullable: false, type: "varchar" })
  mandatory: boolean;
}
