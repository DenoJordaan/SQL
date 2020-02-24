SELECT mc.last_name,
mc.first_name,
p.profession
FROM my_contacts AS mc
INNER JOIN
profession AS p
ON mc.fx_prof_id = fx_prof_id;