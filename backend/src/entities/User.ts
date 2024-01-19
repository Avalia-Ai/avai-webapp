import { Entity, Column, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  entering_semester: Date;

  @Column()
  email: string;

  @Column()
  password: string;

  @Column()
  created_at: Date;
}
