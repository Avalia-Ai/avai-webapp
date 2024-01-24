import { subjectResource } from "./resources/SubjectResource.ts";
import { UserResource } from "./resources/UserResource.ts";

const routes = [...UserResource, ...subjectResource];

export default routes;
