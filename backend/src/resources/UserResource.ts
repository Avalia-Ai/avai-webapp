import { UserRegisterDTO } from "../DTOs/UserRegisterDTO.ts";
import { UserRepository } from "../repositories/UserRepository.ts";
import { UserRegisterService } from "../services/UserRegisterService.ts";

import { RouteOptions } from "fastify/types/route";

export const UserResource: RouteOptions[] = [
  {
    method: "POST",
    url: "/register",
    handler: async (req: any) => {
      const userRegisterService = new UserRegisterService(new UserRepository());
      return await userRegisterService.execute(req.body as UserRegisterDTO);
    },
  },
];
