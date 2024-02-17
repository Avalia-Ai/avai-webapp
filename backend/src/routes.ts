import { professorResource } from "./resources/ProfessorResource.ts";
import { subjectResource } from "./resources/SubjectResource.ts";
import { UserResource } from "./resources/UserResource.ts";

const routes = [...UserResource, ...subjectResource, ...professorResource];

export default routes;
