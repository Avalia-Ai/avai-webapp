import { RouteOptions } from "fastify";
import { ProfessorRepository } from "../repositories/ProfessorRepository.ts";
import { CreateProfessorService } from "../services/CreateProfessorService.ts";
import { GetProfessorService } from "../services/GetProfessorService.ts";
import { ProfessorMapper } from "../mappers/ProfessorMapper.ts";

export const professorResource: RouteOptions[] = [
  {
    method: "POST",
    url: "/professor/create",
    handler: async (req: any) => {
      if (!Array.isArray(req.body)) {
        req.body = [req.body];
      }

      const professorsToCreate = ProfessorMapper.validateProfessorCreateRequest(
        req.body
      );

      const createProfessorService = new CreateProfessorService();
      return await createProfessorService.execute(professorsToCreate);
    },
  },
  {
    method: "GET",
    url: "/professor",
    handler: async () => {
      const getProfessorsService = new GetProfessorService(
        new ProfessorRepository()
      );
      return await getProfessorsService.execute();
    },
  },
];
