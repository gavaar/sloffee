import { httpRouter } from 'convex/server';
import { auth } from './routes';

const router = httpRouter();

auth(router);

export default router;
