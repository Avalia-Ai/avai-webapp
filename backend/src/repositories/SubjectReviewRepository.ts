import { dataSource } from "../dataSource.ts";
import { SubjectReview } from "../entities/SubjectReview.ts";

export class SubjectReviewRepository {
  public async save(reviews: SubjectReview[]) {
    return dataSource.manager.save(reviews);
  }

  public async getReviews() {
    return dataSource.manager.find(SubjectReview);
  }
}
