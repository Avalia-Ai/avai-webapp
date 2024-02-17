import { professorResource } from "./resources/ProfessorResource.ts";
import { subjectProfessorResource } from "./resources/SubjectProfessorResource.ts";
import { subjectResource } from "./resources/SubjectResource.ts";
import { subjectReviewResource } from "./resources/SubjectReviewResource.ts";
import { UserResource } from "./resources/UserResource.ts";

const routes = [
  ...UserResource,
  ...subjectResource,
  ...professorResource,
  ...subjectReviewResource,
  ...subjectProfessorResource,
];

export default routes;
