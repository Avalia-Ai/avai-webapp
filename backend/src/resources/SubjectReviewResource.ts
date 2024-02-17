import { RouteOptions } from "fastify";
import { GetSubjectReviewService } from "../services/GetSubjectReviewService.ts";
import { SubjectReviewRepository } from "../repositories/SubjectReviewRepository.ts";
import { CreateSubjectReviewService } from "../services/CreateSubjectReviewService.ts";
import { SubjectReviewMapper } from "../mappers/SubjectReviewMapper.ts";

export const subjectReviewResource: RouteOptions[] = [
  {
    method: "POST",
    url: "/subject-review/create",
    handler: async (req: any) => {
      if (!Array.isArray(req.body)) {
        req.body = [req.body];
      }
      const subjectReviewsToCreate =
        SubjectReviewMapper.validateReviewCreateRequest(req.body);
      const createSubjectReviewService = new CreateSubjectReviewService();
      return await createSubjectReviewService.execute(subjectReviewsToCreate);
    },
  },
  {
    method: "GET",
    url: "/subject-review",
    handler: async () => {
      const getSubjectReviewsService = new GetSubjectReviewService(
        new SubjectReviewRepository()
      );
      return await getSubjectReviewsService.execute();
    },
  },
];
