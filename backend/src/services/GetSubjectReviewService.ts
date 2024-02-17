import { SubjectReviewRepository } from "../repositories/SubjectReviewRepository.ts";

export class GetSubjectReviewService {
  private subjectReviewRepository: SubjectReviewRepository;
  constructor(subjectReviewRepository: SubjectReviewRepository) {
    this.subjectReviewRepository = subjectReviewRepository;
  }
  public execute() {
    return this.subjectReviewRepository.getReviews();
  }
}
