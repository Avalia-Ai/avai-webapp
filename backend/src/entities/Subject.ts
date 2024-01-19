import { Entity, Column, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Subject {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  semester: string;

  @Column()
  mandatory: boolean;
}
