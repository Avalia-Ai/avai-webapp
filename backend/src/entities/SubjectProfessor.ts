import { Entity, PrimaryGeneratedColumn, OneToOne, OneToMany } from "typeorm";
import { Subject } from "./Subject.ts";
import { Professor } from "./Professor.ts";

@Entity()
export class SubjectProfessor {
  @PrimaryGeneratedColumn()
  id: number;

  @OneToOne(() => Subject, (subject) => subject.id, { nullable: false })
  subjectId: number;

  @OneToMany(() => Professor, (professor) => professor.id, { nullable: false })
  professorId: number;
}
