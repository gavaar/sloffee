import { GenericActionCtx } from "convex/server";
import { httpAction } from "../../_generated/server";
import { api } from '../../_generated/api';
import { generateToken, hashPassword } from './helpers';

export const login = httpAction(async (ctx: GenericActionCtx<any>, request: Request) => {
  const { username, password } = await request.json();

  if (!username || !password) {
    return new Response(JSON.stringify({ error: "nombre de usuario y contraseña requeridos" }), {
      status: 400, headers: { "Content-Type": "application/json" },
    });
  }

  const user = await ctx.runQuery(api.users.byUsername, { username });
  if (!user) {
    return new Response(JSON.stringify({ error: "credenciales inválidas" }), {
      status: 401, headers: { "Content-Type": "application/json" },
    });
  }

  const passwordHash = await hashPassword(password);
  if (passwordHash !== user.passwordHash) {
    return new Response(JSON.stringify({ error: "credenciales inválidas" }), {
      status: 401, headers: { "Content-Type": "application/json" },
    });
  }

  const token = generateToken();
  await ctx.runMutation(api.sessions.create, { userId: user._id, token });
  return new Response(JSON.stringify({ token, userId: user._id }), {
    status: 200, headers: { "Content-Type": "application/json" },
  });
});
