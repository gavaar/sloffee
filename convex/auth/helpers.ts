import { GenericActionCtx } from "convex/server";
import { api } from "../_generated/api";

const SALT = "el-tiburon-salt-2026";

export async function hashPassword(password: string): Promise<string> {
  const enc = new TextEncoder().encode(password + SALT);
  const buf = await crypto.subtle.digest("SHA-256", enc);
  return Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, "0")).join("");
}

export function generateToken(): string {
  const bytes = new Uint8Array(32);
  crypto.getRandomValues(bytes);
  return Array.from(bytes).map(b => b.toString(16).padStart(2, "0")).join("");
}

export const loginAction = async (ctx: GenericActionCtx<any>, request: Request) => {
  const { username, password } = await request.json();

  if (!username || !password) {
    return new Response(JSON.stringify({ error: "username and password required" }), {
      status: 400, headers: { "Content-Type": "application/json" },
    });
  }

  const user = await ctx.runQuery(api.users.byUsername, { username });
  if (!user) {
    return new Response(JSON.stringify({ error: "invalid credentials" }), {
      status: 401, headers: { "Content-Type": "application/json" },
    });
  }

  const passwordHash = await hashPassword(password);
  if (passwordHash !== user.passwordHash) {
    return new Response(JSON.stringify({ error: "invalid credentials" }), {
      status: 401, headers: { "Content-Type": "application/json" },
    });
  }

  const token = generateToken();
  await ctx.runMutation(api.sessions.create, { userId: user._id, token });
  return new Response(JSON.stringify({ token, userId: user._id }), {
    status: 200, headers: { "Content-Type": "application/json" },
  });
}
