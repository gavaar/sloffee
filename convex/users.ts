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

export const create = mutation({
  args: { username: v.string(), passwordHash: v.string() },
  handler: async (ctx, { username, passwordHash }) => {
    return await ctx.db.insert("users", { username, passwordHash, createdAt: Date.now() });
  },
});