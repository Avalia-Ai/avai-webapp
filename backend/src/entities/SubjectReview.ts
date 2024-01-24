import {
  Entity,
  PrimaryGeneratedColumn,
  OneToOne,
  OneToMany,
  Column,
} from "typeorm";
import { Subject } from "./Subject.ts";
import { User } from "./User.ts";

@Entity()
export class SubjectReview {
  @PrimaryGeneratedColumn()
  id: number;

  @OneToOne(() => Subject, (subject) => subject.id, { nullable: false })
  subjectProfessorId: number;

  @OneToMany(() => User, (user) => user.id, { nullable: false })
  userId: number;

  @Column({ nullable: false, type: Date, name: "created_at" })
  createdAt: Date;

  @Column({ nullable: false, type: Date, name: "updated_at" })
  updatedAt: Date;
}
