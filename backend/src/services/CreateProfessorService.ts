import { Professor } from "../entities/Professor.ts";
import { ProfessorRepository } from "../repositories/ProfessorRepository.ts";

export class CreateProfessorService {
  private professorRepository;
  constructor() {
    this.professorRepository = new ProfessorRepository();
  }
  async execute(professors: Professor[]) {
    return await this.professorRepository.save(professors);
  }
}
