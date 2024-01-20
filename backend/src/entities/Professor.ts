import { Entity, Column, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Professor {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;
}
