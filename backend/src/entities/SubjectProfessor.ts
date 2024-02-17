import { Entity, PrimaryGeneratedColumn, OneToOne, JoinColumn } from "typeorm";
import { Subject } from "./Subject.ts";
import { Professor } from "./Professor.ts";

@Entity()
export class SubjectProfessor {
  @PrimaryGeneratedColumn()
  id: number;

  @OneToOne(() => Subject, { nullable: false, eager: true })
  @JoinColumn({ name: "subject_id" })
  subject: Subject;

  @OneToOne(() => Professor, { nullable: false, eager: true })
  @JoinColumn({ name: "professor_id" })
  professor: Professor;
}
