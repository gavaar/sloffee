/* eslint-disable */
/**
 * Generated `api` utility.
 *
 * THIS CODE IS AUTOMATICALLY GENERATED.
 *
 * To regenerate, run `npx convex dev`.
 * @module
 */

import type * as http from "../http.js";
import type * as routes_auth_helpers_generateToken from "../routes/auth/helpers/generateToken.js";
import type * as routes_auth_helpers_hashPassword from "../routes/auth/helpers/hashPassword.js";
import type * as routes_auth_helpers_index from "../routes/auth/helpers/index.js";
import type * as routes_auth_index from "../routes/auth/index.js";
import type * as routes_auth_login from "../routes/auth/login.js";
import type * as routes_auth_signup from "../routes/auth/signup.js";
import type * as routes_auth_verify from "../routes/auth/verify.js";
import type * as routes_index from "../routes/index.js";
import type * as sessions from "../sessions.js";
import type * as users from "../users.js";

import type {
  ApiFromModules,
  FilterApi,
  FunctionReference,
} from "convex/server";

declare const fullApi: ApiFromModules<{
  http: typeof http;
  "routes/auth/helpers/generateToken": typeof routes_auth_helpers_generateToken;
  "routes/auth/helpers/hashPassword": typeof routes_auth_helpers_hashPassword;
  "routes/auth/helpers/index": typeof routes_auth_helpers_index;
  "routes/auth/index": typeof routes_auth_index;
  "routes/auth/login": typeof routes_auth_login;
  "routes/auth/signup": typeof routes_auth_signup;
  "routes/auth/verify": typeof routes_auth_verify;
  "routes/index": typeof routes_index;
  sessions: typeof sessions;
  users: typeof users;
}>;

/**
 * A utility for referencing Convex functions in your app's public API.
 *
 * Usage:
 * ```js
 * const myFunctionReference = api.myModule.myFunction;
 * ```
 */
export declare const api: FilterApi<
  typeof fullApi,
  FunctionReference<any, "public">
>;

/**
 * A utility for referencing Convex functions in your app's internal API.
 *
 * Usage:
 * ```js
 * const myFunctionReference = internal.myModule.myFunction;
 * ```
 */
export declare const internal: FilterApi<
  typeof fullApi,
  FunctionReference<any, "internal">
>;

export declare const components: {};
