import { SubjectProfessorRepository } from "../repositories/SubjectProfessorRepository.ts";

export class GetSubjectProfessorService {
  private subjectProfessorRepository: SubjectProfessorRepository;
  constructor(subjectProfessorRepository: SubjectProfessorRepository) {
    this.subjectProfessorRepository = subjectProfessorRepository;
  }
  public execute() {
    return this.subjectProfessorRepository.getSubjects();
  }
}
