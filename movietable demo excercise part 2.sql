UPDATE movie_table_demo
SET category =
CASE
WHEN drama = 'T'AND rating = 'R' THEN 'drama-r'
WHEN comedy = 'T' AND rating = 'R' THEN 'comedy-r'
WHEN action = 'T' AND rating = 'R' THEN 'action-r'
WHEN gore = 'T' AND rating = 'R' THEN 'horror-r'
WHEN scifi = 'T' AND rating = 'R' THEN 'scifi-r'
WHEN category = 'misc' AND rating = 'G' THEN 'family'
END;