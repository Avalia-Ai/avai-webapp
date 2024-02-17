import { SubjectReview } from "../entities/SubjectReview.ts";
import { SubjectReviewRepository } from "../repositories/SubjectReviewRepository.ts";

export class CreateSubjectReviewService {
  private subjectReviewRepository;
  constructor() {
    this.subjectReviewRepository = new SubjectReviewRepository();
  }
  async execute(reviews: SubjectReview[]) {
    return await this.subjectReviewRepository.save(reviews);
  }
}
