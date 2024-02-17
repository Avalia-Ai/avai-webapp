import { professorResource } from "./resources/ProfessorResource.ts";
import { subjectResource } from "./resources/SubjectResource.ts";
import { subjectReviewResource } from "./resources/SubjectReviewResource.ts";
import { UserResource } from "./resources/UserResource.ts";

const routes = [
  ...UserResource,
  ...subjectResource,
  ...professorResource,
  ...subjectReviewResource,
];

export default routes;
