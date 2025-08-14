-- Example seed data
insert into public.mountains (
  name, name_kana, elevation, location, prefecture, description, best_season, difficulty_level, latitude, longitude, photo_url
) values
  ('富士山', 'フジサン', 3776, '静岡・山梨の県境', '静岡県', '日本最高峰の活火山。世界文化遺産。', '夏', '中級', 35.3606, 138.7274, null)
  on conflict (name, prefecture) do nothing;
