import { NextRequest, NextResponse } from "next/server";
import { supabase } from "@/lib/supabase/client";

export const runtime = "nodejs";

type Sort = {
  column: string;
  ascending: boolean;
};

function parseSort(param: string | null): Sort | null {
  if (!param) return null;
  const [column, dir] = param.split(":");
  if (!column) return null;
  const ascending = dir?.toLowerCase() !== "desc";
  return { column, ascending };
}

export async function GET(req: NextRequest) {
  const { searchParams } = new URL(req.url);
  const q = searchParams.get("q");
  const prefecture = searchParams.get("prefecture");
  const limit = Math.min(parseInt(searchParams.get("limit") ?? "20", 10) || 20, 100);
  const offset = parseInt(searchParams.get("offset") ?? "0", 10) || 0;
  const sort = parseSort(searchParams.get("sort"));

  let query = supabase
    .from("mountains")
    .select("*", { count: "exact" })
    .range(offset, offset + limit - 1);

  if (q && q.trim()) {
    const pattern = `%${q.trim()}%`;
    // name または name_kana に部分一致
    query = query.or(`name.ilike.${pattern},name_kana.ilike.${pattern}`);
  }
  if (prefecture && prefecture.trim()) {
    query = query.eq("prefecture", prefecture.trim());
  }
  if (sort) {
    query = query.order(sort.column, { ascending: sort.ascending, nullsFirst: false });
  }

  const { data, error, count } = await query;
  if (error) {
    return NextResponse.json({ error: error.message }, { status: 400 });
  }
  return NextResponse.json({ items: data, total: count ?? 0 });
}
