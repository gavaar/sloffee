import { api } from '../../_generated/api';
import { httpAction } from '../../_generated/server';

export const verify = httpAction(async (ctx, request) => {
  const { token } = await request.json();

  if (!token) {
    return new Response(JSON.stringify({ error: "token required" }), {
      status: 400, headers: { "Content-Type": "application/json" },
    });
  }

  const session = await ctx.runQuery(api.sessions.byToken, { token });

  if (!session) {
    return new Response(JSON.stringify({ valid: false }), {
      status: 200, headers: { "Content-Type": "application/json" },
    });
  }

  return new Response(JSON.stringify({ userId: session.userId, valid: true }), {
    status: 200, headers: { "Content-Type": "application/json" },
  });
});

export const verifyUsername =  httpAction(async (ctx, request) => {
  const { username } = await request.json();

  if (!username) {
    return new Response(JSON.stringify({ error: "username required" }), {
      status: 400, headers: { "Content-Type": "application/json" },
    });
  }

  const user = await ctx.runQuery(api.users.byUsername, { username });

  if (user) {
    return new Response(JSON.stringify({ error: "username taken" }), {
      status: 400, headers: { "Content-Type": "application/json" },
    });
  }

  return new Response(JSON.stringify({}), {
    status: 200, headers: { "Content-Type": "application/json" },
  });
});
