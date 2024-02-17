import {
  Column,
  Entity,
  JoinColumn,
  ManyToOne,
  OneToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { SubjectProfessor } from "./SubjectProfessor.ts";
import { User } from "./User.ts";

@Entity()
export class SubjectReview {
  @PrimaryGeneratedColumn()
  id: number;

  @OneToOne(() => SubjectProfessor, { nullable: false, eager: true })
  @JoinColumn({ name: "subject_professor_id" })
  subjectProfessor: SubjectProfessor;

  @ManyToOne(() => User, (user) => user.id, { nullable: false })
  @JoinColumn({ name: "user_id" })
  user: User;

  @Column({ nullable: false, type: "timestamp", name: "created_at" })
  createdAt: Date;

  @Column({ nullable: false, type: "timestamp", name: "updated_at" })
  updatedAt: Date;
}
