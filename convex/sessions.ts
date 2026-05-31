import { v } from "convex/values";
import { mutation, query } from "./_generated/server";

export const create = mutation({
  args: { userId: v.id("users"), token: v.string() },
  handler: async (ctx, { userId, token }) => {
    await ctx.db.insert("sessions", { userId, token, createdAt: Date.now() });
  },
});

export const byToken = query({
  args: { token: v.string() },
  handler: async (ctx, { token }) => {
    return await ctx.db
      .query("sessions")
      .withIndex("by_token", q => q.eq("token", token))
      .first();
  },
});
