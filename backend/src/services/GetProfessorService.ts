import { ProfessorRepository } from "../repositories/ProfessorRepository";

export class GetProfessorService {
  private professorRepository: ProfessorRepository;
  constructor(professorRepository: ProfessorRepository) {
    this.professorRepository = professorRepository;
  }
  public execute() {
    return this.professorRepository.getProfessors();
  }
}
