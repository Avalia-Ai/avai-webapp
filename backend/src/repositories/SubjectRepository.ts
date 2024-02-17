import { dataSource } from "../dataSource.ts";
import { Subject } from "../entities/Subject.ts";

export class SubjectRepository {
  public async save(subjects: Subject[]) {
    return dataSource.manager.save(subjects);
  }

  public async getAllSubjects() {
    return dataSource.manager.find(Subject);
  }

  public async findById(id: number) {
    return dataSource.manager.findOne(Subject, {
      where: { id },
    });
  }
}
