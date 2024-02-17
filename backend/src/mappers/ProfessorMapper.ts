import { ProfessorCreateDTO } from "../DTOs/ProfessorCreateDTO.ts";
import { Professor } from "../entities/Professor.ts";

export class ProfessorMapper {
  public static validateProfessorCreateRequest(
    professorCreateDTO: ProfessorCreateDTO[]
  ) {
    const professors = professorCreateDTO.map((professorDTO) => {
      const { name } = professorDTO;
      const professor = new Professor();
      professor.name = name;
      return professor;
    });

    return professors;
  }
}
