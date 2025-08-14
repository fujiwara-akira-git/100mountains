export type Mountain = {
  id: string;
  name: string;
  name_kana: string | null;
  elevation: number;
  location: string;
  prefecture: string;
  description: string | null;
  best_season: string | null;
  difficulty_level: string | null;
  created_at: string; // ISO8601
  updated_at: string; // ISO8601
  latitude: number | null;
  longitude: number | null;
  photo_url: string | null;
};
