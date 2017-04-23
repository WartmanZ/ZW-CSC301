SELECT project_animal.animalid, animalname, animalpicture, project_dangerlevel.dangerid, level, comment
FROM db_spring17_wartmanz1.project_animal 
JOIN db_spring17_wartmanz1.project_animaldangerlvl ON db_spring17_wartmanz1.project_animal.animalid = db_spring17_wartmanz1.project_animaldangerlvl.animalid
JOIN db_spring17_wartmanz1.project_dangerlevel ON db_spring17_wartmanz1.project_dangerlevel.dangerid = db_spring17_wartmanz1.project_animaldangerlvl.dangerid
WHERE db_spring17_wartmanz1.project_animal.animalid = :animalid