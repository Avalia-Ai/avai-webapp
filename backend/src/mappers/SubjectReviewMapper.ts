import { SubjectReviewDTO } from "../DTOs/SubjectReviewDTO.ts";
import { SubjectReview } from "../entities/SubjectReview.ts";

export class SubjectReviewMapper {
  public static validateReviewCreateRequest(
    subjectReviewDTO: SubjectReviewDTO[]
  ) {
    const reviews = subjectReviewDTO.map((subjectDTO): SubjectReview => {
      const { subjectProfessorId, userId } = subjectDTO;

      if (!subjectProfessorId) {
        throw new Error("subjectProfessorId is required");
      }

      if (!userId) {
        throw new Error("userId is required");
      }
      const review = new SubjectReview();
      review.subjectProfessorId = subjectProfessorId;
      review.userId = userId;
      return review;
    });
    return reviews;
  }
}
