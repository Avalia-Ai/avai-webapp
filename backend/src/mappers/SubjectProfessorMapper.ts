import { SubjectProfessorCreateDTO } from "../DTOs/SubjectProfessorCreateDTO.ts";

export class SubjectProfessorMapper {
  public static validateRequestToCreateSubjectProfessor(
    subjectProfessorCreateDTO: SubjectProfessorCreateDTO[]
  ) {
    subjectProfessorCreateDTO.forEach((subjectProfessorDTO) => {
      const { professorId, subjectId } = subjectProfessorDTO;

      if (!professorId) {
        throw new Error("professorId is required");
      }

      if (!subjectId) {
        throw new Error("subjectId is required");
      }
    });
  }
}
