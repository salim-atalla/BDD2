

DROP TABLE SALLE CASCADE CONSTRAINTS;
DROP TABLE EMPLOYE CASCADE CONSTRAINTS;
DROP TABLE PERSONNE CASCADE CONSTRAINTS;
DROP TABLE INTERVENTION CASCADE CONSTRAINTS;
DROP TABLE AFFECTATION CASCADE CONSTRAINTS;


CREATE TABLE SALLE (
	id_salle 		VARCHAR2(20),
	type_salle		VARCHAR2(40),
	capacite		NUMBER,
	CONSTRAINT pk_salle PRIMARY KEY(id_salle)
);
CREATE TABLE EMPLOYE (
	id_employe 		VARCHAR2(20),
	qualifications		VARCHAR2(40),
	CONSTRAINT pk_employe PRIMARY KEY(id_employe)
);
CREATE TABLE PERSONNE (
	no_secu		VARCHAR2(15),
	nom			VARCHAR2(40),
	prenom			VARCHAR2(40),
	adresse		VARCHAR2(40),
	date_naissance		DATE,
	id_employe		VARCHAR2(20),
	CONSTRAINT pk_personne PRIMARY KEY(no_secu),
	CONSTRAINT fk_personne_emplye FOREIGN KEY(id_employe) REFERENCES EMPLOYE(id_employe)ON DELETE CASCADE,
	CHECK (date_naissance BETWEEN to_date('01-01-1900','dd-mm-yyyy')
		AND to_date('01-06-2022','dd-mm-yyyy'))	
);
CREATE TABLE INTERVENTION (
	id_intervention		VARCHAR2(20),
	type_intervention		VARCHAR2(40),
	pathologie			VARCHAR2(40),
	date_debut_intervention	TIMESTAMP,
	date_fin_intervention		TIMESTAMP,
	id_salle 			VARCHAR2(20),
	no_secu			VARCHAR2(15),
	CONSTRAINT pk_intervention PRIMARY KEY(id_intervention),
	CONSTRAINT fk_intervention_salle FOREIGN KEY(id_salle) REFERENCES SALLE(id_salle)ON DELETE CASCADE,
	CONSTRAINT fk_intervention_personne FOREIGN KEY(no_secu) REFERENCES PERSONNE(no_secu)ON DELETE CASCADE
);
CREATE TABLE AFFECTATION (
	id_intervention	VARCHAR2(20),
	id_employe		VARCHAR2(20),
	CONSTRAINT pk_affectation PRIMARY KEY(id_intervention,id_employe),
	CONSTRAINT fk_affectation_intervention FOREIGN KEY(id_intervention)
		 REFERENCES INTERVENTION(id_intervention)ON DELETE CASCADE,
	CONSTRAINT fk_affectation_employe FOREIGN KEY(id_employe) REFERENCES EMPLOYE(id_employe)ON DELETE CASCADE
);
	


DELETE FROM SALLE;
DELETE FROM EMPLOYE;
DELETE FROM PERSONNE;
DELETE FROM INTERVENTION;
DELETE FROM AFFECTATION;


INSERT INTO SALLE (id_salle, type_salle, capacite) 
	VALUES ('C7', 'Salle de Chirurgie', 1)
	;
	
INSERT INTO SALLE (id_salle, type_salle, capacite) 
	VALUES ('B2', 'Salle de Réanimation', 4)
	;
	
INSERT INTO SALLE (id_salle, type_salle, capacite) 
	VALUES ('A7', 'Salle de Consultation', 10)
	;

INSERT INTO EMPLOYE (id_employe, qualifications) 
	VALUES ('astv88z', 'Cardiologue')
	;
	
INSERT INTO EMPLOYE (id_employe, qualifications) 
	VALUES ('xdta90f', 'Réanimation')
	;
	
INSERT INTO EMPLOYE (id_employe, qualifications) 
	VALUES ('xta129xz', 'Agent de Service')
	;
INSERT INTO EMPLOYE (id_employe, qualifications) 
	VALUES ('902set23', 'infèrmière')
	;
	INSERT INTO EMPLOYE (id_employe, qualifications) 
	VALUES ('dzr231xt', 'dentiste')
	;
	

INSERT INTO PERSONNE (no_secu, nom, prenom, adresse, date_naissance, id_employe)
	 VALUES ('189029915424166', 'Snow', 'John', '12 rue de Winterfell',to_date('1989-10-12', 'yyyy-mm-dd'), null)
	 ;
INSERT INTO PERSONNE (no_secu, nom, prenom, adresse, date_naissance, id_employe) 
	VALUES ('059921223421342', 'Tagaryen', 'Deanerys', '21 avenue de Lorath', to_date('1956-01-01', 'yyyy-mm-dd'), 'astv88z')
	;
INSERT INTO PERSONNE (no_secu, nom, prenom, adresse, date_naissance, id_employe) 
	VALUES ('223466462352341', 'Brown', 'Olivier', '90 boulevard de mars', to_date('1970-05-09', 'yyyy-mm-dd'), 'xdta90f')
	;
INSERT INTO PERSONNE (no_secu, nom, prenom, adresse, date_naissance, id_employe) 
	VALUES ('124042818419412', 'Jones', 'Jessica', '2 rue de Winterfell', to_date('1989-02-02', 'yyyy-mm-dd'), '902set23')
	;
INSERT INTO PERSONNE (no_secu, nom, prenom, adresse, date_naissance, id_employe) 
	VALUES ('251516272125721', 'Dunphy', 'Phil', '9 avenue de city', to_date('1990-09-16', 'yyyy-mm-dd'), 'xta129xz')
	;
INSERT INTO PERSONNE (no_secu, nom, prenom, adresse, date_naissance, id_employe)
	VALUES ('289629285262821', 'Lobez', 'Jennifer', '29 avene de l''aide', to_date( '1996-08-19', 'yyyy-mm-dd'), 'dzr231xt')
	;

INSERT INTO INTERVENTION (id_intervention, type_intervention, pathologie, no_secu, id_salle, date_debut_intervention, date_fin_intervention) 
	VALUES ('C7astv', 'Remplacement Valvutaire', 'Sténose Valvutaire','289629285262821', 'C7',
	to_date( '20220101 09:00:00','yyyymmdd hh24:mi:ss'), to_date( '20220101 12:00:00','yyyymmdd hh24:mi:ss') 
	);
	
INSERT INTO INTERVENTION (id_intervention, type_intervention, pathologie, no_secu, id_salle, date_debut_intervention, date_fin_intervention) 
	VALUES ('19902A7', 'Oxygénothérapie à FiO2', 'Intoxication Oxycarbonée','189029915424166', 'A7',
	 to_date('20211219 15:15:00','yyyymmdd hh24:mi:ss'), to_date('20211219 15:30:00','yyyymmdd hh24:mi:ss')
	 );
	 
INSERT INTO INTERVENTION (id_intervention, type_intervention, pathologie, no_secu, id_salle, date_debut_intervention, date_fin_intervention) 
	VALUES ('85423B2', 'Oxygénation extracorporelle', 'Covid-19', '189029915424166', 'B2'
	,to_date( '20220112 16:00:00','yyyymmdd hh24:mi:ss'), null
	);
	


INSERT INTO AFFECTATION (id_intervention, id_employe) 
	VALUES ('85423B2', 'xdta90f')
	;
INSERT INTO AFFECTATION (id_intervention, id_employe) 
	VALUES ('C7astv', '902set23')
	;
INSERT INTO AFFECTATION (id_intervention, id_employe) 
	VALUES ('19902A7', '902set23')
	;
	INSERT INTO AFFECTATION (id_intervention, id_employe) 
	VALUES ('C7astv', 'astv88z')
	;
	
	
	
--drop index
DROP INDEX salle_libre_avec_type;
DROP INDEX cherche_medecin_qualifications;
	
-- pour chercher les salles  avec son type, par exemple une salle d'urgence 
CREATE INDEX salle_libre_avec_type on SALLE  (type_salle);

-- pour chercher les medcins  avec leur qualifications
CREATE INDEX cherche_medecin_qualifications on EMPLOYE (qualifications);
	
	

	
-- tous date_debut_ineterventions <= date_fin_interventions
CREATE OR REPLACE TRIGGER intervention_deb_fin
BEFORE INSERT ON INTERVENTION
FOR EACH ROW
DECLARE
	date_deb TIMESTAMP;
	date_fin TIMESTAMP;
BEGIN
	SELECT DISTINCT date_debut_intervention INTO date_deb
	FROM INTERVENTION
	WHERE id_intervention = :NEW.id_intervention;
	
	SELECT DISTINCT date_fin_intervention INTO date_fin
	FROM INTERVENTION
	WHERE id_intervention = :NEW.id_intervention;
	
	IF (date_deb > date_fin) THEN
		RAISE_APPLICATION_ERROR(-20101, 'La debut ne peut pas être infèriere à la fin');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER 
    not_already_in_intervention
    BEFORE INSERT OR UPDATE 
    ON INTERVENTION
    FOR EACH ROW
    BEGIN

        IF (no_secu = :NEW.no_secu AND (date_debut_intervention <= :NEW.date_debut_intervention AND date_fin_intervention >= :NEW.date_debut_intervention) OR (date_debut_intervention <= :NEW.date_fin_intervention AND date_fin_intervention >= :NEW.date_fin_intervention))
        THEN
           SELECT RAISE(ABORT, 'no_secu is already on an intervention') FROM Intervention;
           
        END IF;
    END;
/


-- role Adm
DROP role all_acces_role;
CREATE role all_acces_role; 
GRANT ALL ON SALLE to all_acces_role;                                                  
GRANT ALL ON EMPLOYE to all_acces_role;                                                    
GRANT ALL ON PERSONNE to all_acces_role;                                                  
GRANT ALL ON INTERVENTION to all_acces_role;                                               
GRANT ALL ON AFFECTATION to all_acces_role;                                              
/*
--role Mod
DROP role role_Mod;
CREATE role role_Mod;

GRANT SELECT ON SALLE to role_Mod;                                            
GRANT INSERT ON SALLE to role_Mod;                                            
GRANT UPDATE ON SALLE to role_Mod;                                            
GRANT DELETE ON SALLE to role_Mod;                                            

GRANT SELECT ON EMPLOYE to role_Mod;                                              
GRANT INSERT ON EMPLOYE to role_Mod;                                              
GRANT UPDATE ON EMPLOYE to role_Mod;                                              
GRANT DELETE ON EMPLOYE to role_Mod;                                              

GRANT SELECT ON PERSONNE to role_Mod;                                            
GRANT INSERT ON PERSONNE to role_Mod;                                            
GRANT UPDATE ON PERSONNE to role_Mod;                                            
GRANT DELETE ON PERSONNE to role_Mod;

GRANT SELECT ON INTERVENTION to role_Mod;                                            
GRANT INSERT ON INTERVENTION to role_Mod;                                            
GRANT UPDATE ON INTERVENTION to role_Mod;                                            
GRANT DELETE ON INTERVENTION to role_Mod;

GRANT SELECT ON AFFECTATION to role_Mod;                                            
GRANT INSERT ON AFFECTATION to role_Mod;                                            
GRANT UPDATE ON AFFECTATION to role_Mod;                                          s  
GRANT DELETE ON AFFECTATION to role_Mod;    
*/s 
--role Utilisateur
DROP role select_acces_role;
CREATE role select_acces_role;
GRANT SELECT ON SALLE to select_acces_role;                                   
GRANT SELECT ON EMPLOYE to select_acces_role;                                     
GRANT SELECT ON PERSONNE to select_acces_role;                                   
GRANT SELECT ON INTERVENTION to select_acces_role;
GRANT SELECT ON AFFECTATION to select_acces_role;       


                     
CREATE OR REPLACE VIEW V_SALLE
AS SELECT id_salle, type_salle , capacite
FROM SALLE;

CREATE OR REPLACE VIEW V_EMPLOYE
AS SELECT id_employe, qualifications
FROM EMPLOYE;

CREATE OR REPLACE VIEW V_PERSONNE
AS SELECT no_secu, nom , prenom , adresse , date_naissance, id_employe
FROM PERSONNE;

CREATE OR REPLACE VIEW V_INTERVENTION
AS SELECT id_intervention , type_intervention , pathologie , date_debut_intervention, date_fin_intervention , id_salle , no_secu 
FROM INTERVENTION;
 
 CREATE OR REPLACE VIEW V_AFFECTATION
AS SELECT id_intervention , id_employe
FROM AFFECTATION;






