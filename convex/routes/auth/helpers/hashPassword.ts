const SALT = "el-tiburon-salt-2026";

export async function hashPassword(password: string): Promise<string> {
  const enc = new TextEncoder().encode(password + SALT);
  const buf = await crypto.subtle.digest("SHA-256", enc);
  return Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, "0")).join("");
}
