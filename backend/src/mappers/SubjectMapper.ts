import { SubjectCreateDTO } from "../DTOs/SubjectCreateDTO.ts";
import { Subject } from "../entities/Subject.ts";

export class SubjectMapper {
  public static validateRequestToCreateSubject(
    subjectCreateDTO: SubjectCreateDTO[]
  ) {
    const subjects = subjectCreateDTO.map((subjectDTO): Subject => {
      const { name, semester, mandatory } = subjectDTO;
      if (!name) {
        throw new Error("name is required");
      }

      if (!semester) {
        throw new Error("semester is required");
      }

      if (mandatory === undefined) {
        throw new Error("mandatory is required");
      }

      const subjectCreated = new Subject();
      subjectCreated.name = name;
      subjectCreated.semester = semester;
      subjectCreated.mandatory = mandatory;

      return subjectCreated;
    });

    return subjects;
  }
}
