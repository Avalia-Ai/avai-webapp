import { SubjectRepository } from "../repositories/SubjectRepository";

export class GetSubjectsService {
  private subjectRepository: SubjectRepository;
  constructor(subjectRepository: SubjectRepository) {
    this.subjectRepository = subjectRepository;
  }
  public execute() {
    return this.subjectRepository.getAllSubjects();
  }
}
