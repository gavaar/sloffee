import { httpRouter } from 'convex/server';
import { login, signUp, verify } from './auth';

const router = httpRouter();

// auth
router.route(signUp);
router.route(login);
router.route(verify);

export default router;
