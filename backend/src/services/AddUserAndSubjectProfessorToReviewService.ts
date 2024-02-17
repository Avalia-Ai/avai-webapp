import { SubjectReviewDTO } from "../DTOs/SubjectReviewDTO";
import { SubjectReview } from "../entities/SubjectReview.ts";
import { SubjectProfessorRepository } from "../repositories/SubjectProfessorRepository.ts";
import { UserRepository } from "../repositories/UserRepository.ts";

export class AddUserAndSubjectProfessorToReviewService {
  private subjectProfessorRepository: SubjectProfessorRepository;
  private userRepository: UserRepository;
  constructor(
    subjectProfessorRepository: SubjectProfessorRepository,
    userRepository: UserRepository
  ) {
    this.subjectProfessorRepository = subjectProfessorRepository;
    this.userRepository = userRepository;
  }
  public async execute(
    subjectReviewDTOs: SubjectReviewDTO[]
  ): Promise<SubjectReview[]> {
    const subjectReviews: SubjectReview[] = [];

    for (const subjectReviewDTO of subjectReviewDTOs) {
      const subjectReview = new SubjectReview();

      const subjectProfessor = await this.subjectProfessorRepository.findById(
        subjectReviewDTO.subjectProfessorId
      );

      const user = await this.userRepository.findById(subjectReviewDTO.userId);

      if (!subjectProfessor || !user) {
        throw new Error("SubjectProfessor or User not found");
      }

      subjectReview.subjectProfessor = subjectProfessor;
      subjectReview.user = user;

      subjectReviews.push(subjectReview);
    }

    return subjectReviews;
  }
}
