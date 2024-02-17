import { dataSource } from "../dataSource.ts";
import { SubjectProfessor } from "../entities/SubjectProfessor.ts";

export class SubjectProfessorRepository {
  public async save(subjectsProfessors: SubjectProfessor[]) {
    return dataSource.manager.save(subjectsProfessors);
  }

  public async getSubjects() {
    return dataSource.manager.find(SubjectProfessor);
  }

  public async findById(id: number) {
    return dataSource.manager.findOne(SubjectProfessor, { where: { id } });
  }
}
