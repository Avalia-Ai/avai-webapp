import { SubjectReviewDTO } from "../DTOs/SubjectReviewDTO.ts";

export class SubjectReviewMapper {
  public static validateReviewCreateRequest(
    subjectReviewDTO: SubjectReviewDTO[]
  ) {
    subjectReviewDTO.forEach((subjectDTO) => {
      const { subjectProfessorId, userId } = subjectDTO;

      if (!subjectProfessorId) {
        throw new Error("subjectProfessorId is required");
      }

      if (!userId) {
        throw new Error("userId is required");
      }
    });
  }
}
