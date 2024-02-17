import { dataSource } from "../dataSource.ts";
import { Professor } from "../entities/Professor.ts";

export class ProfessorRepository {
  public async save(professors: Professor[]) {
    return dataSource.manager.save(professors);
  }

  public async getProfessors() {
    return dataSource.manager.find(Professor);
  }
}
