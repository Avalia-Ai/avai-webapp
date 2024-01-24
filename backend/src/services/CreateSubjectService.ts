import { Subject } from "../entities/Subject.ts";
import { SubjectRepository } from "../repositories/SubjectRepository.ts";

export class CreateSubjectService {
  private subjectRepository;
  constructor() {
    this.subjectRepository = new SubjectRepository();
  }
  async execute(subject: Subject[]) {
    return await this.subjectRepository.save(subject);
  }
}
