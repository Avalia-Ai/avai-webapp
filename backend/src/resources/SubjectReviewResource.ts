import { RouteOptions } from "fastify";
import { GetSubjectReviewService } from "../services/GetSubjectReviewService.ts";
import { SubjectReviewRepository } from "../repositories/SubjectReviewRepository.ts";
import { CreateSubjectReviewService } from "../services/CreateSubjectReviewService.ts";
import { SubjectReviewMapper } from "../mappers/SubjectReviewMapper.ts";
import { AddUserAndSubjectProfessorToReviewService } from "../services/AddUserAndSubjectProfessorToReviewService.ts";
import { SubjectProfessorRepository } from "../repositories/SubjectProfessorRepository.ts";
import { UserRepository } from "../repositories/UserRepository.ts";
export const subjectReviewResource: RouteOptions[] = [
  {
    method: "POST",
    url: "/subject-review/create",
    handler: async (req: any) => {
      if (!Array.isArray(req.body)) {
        req.body = [req.body];
      }
      SubjectReviewMapper.validateReviewCreateRequest(req.body);
      const addProfessorAndSubjectToSubjectProfessorService =
        new AddUserAndSubjectProfessorToReviewService(
          new SubjectProfessorRepository(),
          new UserRepository()
        );
      const subjectReviewsToCreate =
        await addProfessorAndSubjectToSubjectProfessorService.execute(req.body);

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
