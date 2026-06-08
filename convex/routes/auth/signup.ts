import { api } from '../../_generated/api';
import { httpAction } from '../../_generated/server';
import { generateToken, hashPassword } from './helpers';

export const signup = httpAction(async (ctx, request) => {
  const { username, email, password, confirmPassword } = await request.json();

  if (password.length < 8) {
    return new Response(JSON.stringify({ error: "password must be at least 8 characters" }), {
      status: 400, headers: { "Content-Type": "application/json" },
    });
  }

  if (password !== confirmPassword) {
    return new Response(JSON.stringify({ error: "passwords do not match" }), {
      status: 400, headers: { "Content-Type": "application/json" },
    });
  }

  const existingUser = await ctx.runQuery(api.users.byUsername, { username });
  if (existingUser) {
    return new Response(JSON.stringify({ error: "username already taken" }), {
      status: 400, headers: { "Content-Type": "application/json" },
    });
  }

  const existingEmail = await ctx.runQuery(api.users.byEmail, { email });
  if (existingEmail) {
    return new Response(JSON.stringify({ error: "email already registered" }), {
      status: 400, headers: { "Content-Type": "application/json" },
    });
  }

  const passwordHash = await hashPassword(password);
  const userId = await ctx.runMutation(api.users.create, { username, email, passwordHash });
  const token = generateToken();
  await ctx.runMutation(api.sessions.create, { userId, token });

  return new Response(JSON.stringify({ token, userId }), {
    status: 201, headers: { "Content-Type": "application/json" },
  });
})