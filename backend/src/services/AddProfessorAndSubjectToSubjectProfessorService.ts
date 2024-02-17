import { SubjectProfessorCreateDTO } from "../DTOs/SubjectProfessorCreateDTO.ts";
import { SubjectProfessor } from "../entities/SubjectProfessor.ts";
import { ProfessorRepository } from "../repositories/ProfessorRepository.ts";
import { SubjectRepository } from "../repositories/SubjectRepository.ts";

export class AddProfessorAndSubjectToSubjectProfessorService {
  private subjectRepository: SubjectRepository;
  private professorRepository: ProfessorRepository;
  constructor(
    subjectRepository: SubjectRepository,
    professorRepository: ProfessorRepository
  ) {
    this.subjectRepository = subjectRepository;
    this.professorRepository = professorRepository;
  }

  public async execute(
    subjectProfessorsDTOs: SubjectProfessorCreateDTO[]
  ): Promise<SubjectProfessor[]> {
    const subjectsProfessors: SubjectProfessor[] = [];
    for (const subjectProfessorDTO of subjectProfessorsDTOs) {
      const subjectProfessorCreated = new SubjectProfessor();

      const subject = await this.subjectRepository.findById(
        subjectProfessorDTO.subjectId
      );

      const professor = await this.professorRepository.findById(
        subjectProfessorDTO.professorId
      );

      if (!subject || !professor) {
        throw new Error("Subject or Professor not found");
      }

      subjectProfessorCreated.subject = subject;
      subjectProfessorCreated.professor = professor;

      subjectsProfessors.push(subjectProfessorCreated);
    }

    return subjectsProfessors;
  }
}
