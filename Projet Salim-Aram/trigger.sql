CREATE OR REPLACE TRIGGER meme_couleur_maillot
BEFORE INSERT ON EQUIPE
FOR EACH ROW
DECLARE
	couleur1 VARCHAR2(20);
	couleur2 VARCHAR2(20);
BEGIN
	SELECT DISTINCT maillot INTO couleur1
	FROM EQUIPE ;
	
	SELECT DISTINCT maillot INTO couleur2
	FROM EQUIPE 
	WHERE maillot = :NEW.maillot;
	
	IF (couleur1 = couleur2) THEN
		RAISE_APPLICATION_ERROR(-20101, 'on peut pas avoir deux maillots de même couleur');
	END IF;
END;
/


CREATE OR REPLACE TRIGGER meme_jour_match
BEFORE INSERT ON MATCH
FOR EACH ROW
DECLARE
	match1 VARCHAR2(20);
	match2 VARCHAR2(20);
BEGIN
	SELECT DISTINCT dateMatch INTO match1
	FROM MATCH ;
	
	SELECT DISTINCT dateMatch INTO match2
	FROM MATCH 
	WHERE dateMatch = :NEW.dateMatch;
	
	IF (match1 = match2) THEN
		RAISE_APPLICATION_ERROR(-20101, 'on peut pas avoir deux matchs le même jour');
	END IF;
END;
/




