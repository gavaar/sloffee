import { v } from "convex/values";
import { query, mutation } from "./_generated/server";

export const byUsername = query({
  args: { username: v.string() },
  handler: async (ctx, { username }) => {
    return await ctx.db
      .query("users")
      .withIndex("by_username", q => q.eq("username", username))
      .first();
  },
});

export const byEmail = query({
  args: { email: v.string() },
  handler: async (ctx, { email }) => {
    return await ctx.db
      .query("users")
      .withIndex("by_email", q => q.eq("email", email))
      .first();
  },
});

export const create = mutation({
  args: { username: v.string(), email: v.string(), passwordHash: v.string() },
  handler: async (ctx, { username, email, passwordHash }) => {
    return await ctx.db.insert("users", { username, email, passwordHash, createdAt: Date.now() });
  },
});
