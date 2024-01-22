import moment from "moment";
import { User } from "../entities/User.ts";
import { UserRegisterDTO } from "../DTOs/UserRegisterDTO.ts";

export class UserMapper {
  public static validateUserRegisterRequest(userRegisterDTO: UserRegisterDTO) {
    const { name, enteringSemester, email, password, confirmPassword } =
      userRegisterDTO;
    if (!name) {
      throw new Error("name is required");
    }

    if (!enteringSemester) {
      throw new Error("enteringSemester is required");
    }

    if (!email) {
      throw new Error("email is required");
    }

    if (!password) {
      throw new Error("password is required");
    }

    if (!confirmPassword) {
      throw new Error("confirmPassword is required");
    }

    if (password !== confirmPassword) {
      throw new Error("Passwords do not match");
    }

    const user = new User();
    user.name = name;
    user.enteringSemester = moment(enteringSemester).toDate();
    user.email = email;
    user.password = password;
    return user;
  }
}
