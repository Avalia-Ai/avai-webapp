import { SubjectProfessor } from "../entities/SubjectProfessor.ts";
import { SubjectProfessorRepository } from "../repositories/SubjectProfessorRepository.ts";

export class CreateSubjectProfessorService {
  private subjectProfessorRepository;
  constructor() {
    this.subjectProfessorRepository = new SubjectProfessorRepository();
  }
  async execute(subjectProfessor: SubjectProfessor[]) {
    return await this.subjectProfessorRepository.save(subjectProfessor);
  }
}
