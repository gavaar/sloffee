import { RouteSpec } from "convex/server";
import { httpAction } from "../_generated/server";
import { api } from "../_generated/api";
import { generateToken, hashPassword, loginAction } from './helpers';

export const signUp: RouteSpec = {
  path: "/signup",
  method: "POST",
  handler: httpAction(async (ctx, request) => {
    const { username, password } = await request.json();
  
    if (!username || !password) {
      return new Response(JSON.stringify({ error: "username and password required" }), {
        status: 400, headers: { "Content-Type": "application/json" },
      });
    }

    if (password.length < 8) {
      return new Response(JSON.stringify({ error: "password too short" }), {
        status: 400, headers: { "Content-Type": "application/json" },
      });
    }
  
    const existing = await ctx.runQuery(api.users.byUsername, { username });
  
    if (existing) {
      return loginAction(ctx, request);
    }
  
    const passwordHash = await hashPassword(password);
    const userId = await ctx.runMutation(api.users.create, { username, passwordHash });
    const token = generateToken();
    await ctx.runMutation(api.sessions.create, { userId, token });
  
    return new Response(JSON.stringify({ token, userId }), {
      status: 201, headers: { "Content-Type": "application/json" },
    });
  }),
};

export const login: RouteSpec = {
  path: "/login",
  method: "POST",
  handler: httpAction(loginAction),
};

export const verify: RouteSpec = {
  path: "/verify",
  method: "POST",
  handler: httpAction(async (ctx, request) => {
    const { token } = await request.json();
    const session = await ctx.runQuery(api.sessions.byToken, { token });

    if (!token) {
      return new Response(JSON.stringify({ error: "token required" }), {
        status: 400, headers: { "Content-Type": "application/json" },
      });
    }

    if (!session) {
      return new Response(JSON.stringify({ valid: false }), {
        status: 200, headers: { "Content-Type": "application/json" },
      });
    }

    return new Response(JSON.stringify({ userId: session.userId, valid: true }), {
      status: 200, headers: { "Content-Type": "application/json" },
    });
  }),
};
