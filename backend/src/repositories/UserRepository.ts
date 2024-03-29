import { dataSource } from "../dataSource.ts";
import { User } from "../entities/User.ts";

export class UserRepository {
  public async save(user: User) {
    try {
      await dataSource.manager.save(user);
      return "User inserted successfully!";
    } catch (error) {
      return "Error inserting user" + error;
    }
  }

  public async findById(id: number) {
    return dataSource.manager.findOne(User, {
      select: ["id", "name", "email"],
      where: { id },
    });
  }
}
