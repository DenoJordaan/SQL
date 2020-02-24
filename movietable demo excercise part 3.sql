UPDATE movie_table_demo
SET category =
CASE
WHEN category = 'drama-r' THEN 'drama'
WHEN category = 'comedy-r' THEN 'comedy'
WHEN category = 'action-r' THEN 'action'
WHEN category = 'horror-r' THEN 'horror'
WHEN category = 'scifi-r' THEN 'scifi'
END;