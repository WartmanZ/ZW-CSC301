SELECT project_animal.animalid, animalname, animalpicture, poject_user.userid, poject_user.name
FROM db_spring17_wartmanz1.project_animal 
JOIN db_spring17_wartmanz1.project_useranimal ON db_spring17_wartmanz1.project_animal.animalid = db_spring17_wartmanz1.project_useranimal.animalid
JOIN db_spring17_wartmanz1.poject_user ON db_spring17_wartmanz1.poject_user.userid = db_spring17_wartmanz1.project_useranimal.userid
WHERE poject_user.userid = :userid