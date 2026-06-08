import { HttpRouter } from 'convex/server';
import { signup } from './signup';
import { login } from './login';
import { verify, verifyUsername } from './verify';

export const auth = (router: HttpRouter) => {
  router.route({ path: '/auth/login', method: 'POST', handler: login });
  router.route({ path: '/auth/signup', method: 'POST', handler: signup });
  router.route({ path: '/auth/verify', method: 'POST', handler: verify });
  router.route({ path: '/auth/verify-username', method: 'POST', handler: verifyUsername });
};
