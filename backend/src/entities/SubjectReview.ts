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
  subjectId: number;

  @OneToMany(() => User, (user) => user.id, { nullable: false })
  userId: number;

  @Column({ nullable: false, type: Date })
  createdAt: Date;

  @Column({ nullable: false, type: Date })
  updatedAt: Date;
}
