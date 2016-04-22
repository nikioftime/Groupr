/** as per the slides**/
/*CREATE TRIGGER GroupTrig 
AFTER DELETE ON PartOf
  REFERENCING
    OLD ROW AS oldMember
  FOR EACH ROW
  WHEN (oldMember.groupId NOT IN 
    (SELECT id FROM Groups))
  DELETE FROM Groups
    WHERE (Groups.id = oldMember.groupId);
*/

/**CREATE TRIGGER GroupTrig AFTER DELETE ON PartOf
  FOR EACH ROW
  BEGIN
    DELETE FROM Groups
    WHERE 



    WHEN (OLD.groupId NOT IN (SELECT id FROM Groups;))
    DELETE FROM Groups 
      WHERE (EXISTS (SELECT id FROM Groups WHERE id = OLD.groupId));
  END;*/

/**DELIMITER //
CREATE 
  TRIGGER GroupTrig 
  AFTER DELETE
    ON PartOf FOR EACH ROW
  BEGIN
      (IF (OLD.groupId NOT IN (SELECT id FROM Groups;))
      THEN 
        (DELETE FROM Groups WHERE (Groups.id = OLD.groupId)));
  END;

DELIMITER;**/

CREATE TRIGGER GroupTrig AFTER DELETE ON PartOf
FOR EACH ROW
BEGIN
  IF (OLD.groupId NOT IN 
    (SELECT id FROM Groups)) THEN
    DELETE FROM Groups
    WHERE Groups.id = OLD.groupId;
    END IF;
END;