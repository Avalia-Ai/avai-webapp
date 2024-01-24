import { RouteOptions } from "fastify";
import { GetSubjectsService } from "../services/GetSubjectsService.ts";
import { SubjectRepository } from "../repositories/SubjectRepository.ts";
import { CreateSubjectService } from "../services/CreateSubjectService.ts";
import { SubjectMapper } from "../mappers/SubjectMapper.ts";

export const subjectResource: RouteOptions[] = [
  {
    method: "POST",
    url: "/subject/create",
    handler: async (req: any) => {
      if (!Array.isArray(req.body)) {
        req.body = [req.body];
      }
      const subjectsToCreate = SubjectMapper.validateRequestToCreateSubject(
        req.body
      );
      const createSubjectService = new CreateSubjectService();
      return await createSubjectService.execute(subjectsToCreate);
    },
  },
  {
    method: "GET",
    url: "/subject",
    handler: async () => {
      const getSubjectsService = new GetSubjectsService(
        new SubjectRepository()
      );
      return await getSubjectsService.execute();
    },
  },
];
