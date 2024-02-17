import { RouteOptions } from "fastify";
import { CreateSubjectProfessorService } from "../services/CreateSubjectProfessorService.ts";
import { GetSubjectProfessorService } from "../services/GetSubjectProfessorService.ts";
import { SubjectProfessorMapper } from "../mappers/SubjectProfessorMapper.ts";
import { SubjectProfessorRepository } from "../repositories/SubjectProfessorRepository.ts";
import { AddProfessorAndSubjectToSubjectProfessorService } from "../services/AddProfessorAndSubjectToSubjectProfessorService.ts";
import { SubjectRepository } from "../repositories/SubjectRepository.ts";
import { ProfessorRepository } from "../repositories/ProfessorRepository.ts";
export const subjectProfessorResource: RouteOptions[] = [
  {
    method: "POST",
    url: "/subject-professor/create",
    handler: async (req: any) => {
      if (!Array.isArray(req.body)) {
        req.body = [req.body];
      }
      SubjectProfessorMapper.validateRequestToCreateSubjectProfessor(req.body);

      const addProfessorAndSubjectToSubjectProfessorService =
        new AddProfessorAndSubjectToSubjectProfessorService(
          new SubjectRepository(),
          new ProfessorRepository()
        );

      const subjectsProfessors =
        await addProfessorAndSubjectToSubjectProfessorService.execute(req.body);

      const createSubjectProfessorService = new CreateSubjectProfessorService();
      return await createSubjectProfessorService.execute(subjectsProfessors);
    },
  },
  {
    method: "GET",
    url: "/subject-professor",
    handler: async () => {
      const getSubjectProfessorsService = new GetSubjectProfessorService(
        new SubjectProfessorRepository()
      );
      return await getSubjectProfessorsService.execute();
    },
  },
];
