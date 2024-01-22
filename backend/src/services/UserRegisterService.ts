import { UserRegisterDTO } from "../DTOs/UserRegisterDTO.ts";
import { UserMapper } from "../mappers/UserMapper.ts";
import { UserRepository } from "../repositories/UserRepository.ts";

export class UserRegisterService {
  private userRepository: UserRepository;
  constructor(userRepository: UserRepository) {
    this.userRepository = userRepository;
  }

  public async execute(userRegisterDTO: UserRegisterDTO): Promise<string> {
    const user = UserMapper.validateUserRegisterRequest(userRegisterDTO);
    return await this.userRepository.save(user);
  }
}
