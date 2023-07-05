-- @solution_sujetF
spool solution_sujetF.log


prompt *************************************************************
prompt ******************** CREATE TABLE ***************************
prompt *************************************************************

-- drop tables
DROP TABLE TP_POKEDEX CASCADE CONSTRAINTS;
DROP TABLE TP_RACE CASCADE CONSTRAINTS;
DROP TABLE TP_POKEMON CASCADE CONSTRAINTS;
DROP TABLE TP_DRESSEUR CASCADE CONSTRAINTS;

-- create tables
CREATE TABLE TP_DRESSEUR (
  id_dresseur     NUMBER,
  pseudo          VARCHAR2(100) default 'toto',
  ville_depart    VARCHAR2(100),
  date_naissance  DATE,
  sexe            VARCHAR2(4),
  constraint pk_tp_dresseur PRIMARY KEY (id_dresseur),
  constraint tp_verif_sexe_dresseur CHECK (sexe IN ('F','M'))
);

CREATE TABLE TP_RACE (
  race        VARCHAR2(20),
  description VARCHAR2(800),
  constraint pk_tp_race PRIMARY KEY (race)
);

CREATE TABLE TP_POKEMON (
  id_pokemon        NUMBER,
  race              VARCHAR2(100) NOT NULL,
  nom               VARCHAR2(100),
  type_pokemon      VARCHAR2(100),
  niveau            NUMBER,
  id_dresseur 		NUMBER,
  vie				NUMBER,
  constraint pk_tp_pokemon PRIMARY KEY (id_pokemon),
  constraint fk_tp_pokemon_race FOREIGN KEY (race) REFERENCES TP_RACE(race),
  constraint tp_verif_type_pokemon CHECK (type_pokemon IN ('eau','plante','feu')),
  constraint tp_verif_vie_pokemon CHECK (vie >= 0 OR vie <= 100)
);

CREATE TABLE TP_POKEDEX (
  id_dresseur 	NUMBER,
  race 			VARCHAR2(100),
  constraint pk_tp_pokedex PRIMARY KEY (id_dresseur,race),
  constraint fk_tp_pokedex_dresseur FOREIGN KEY (id_dresseur) REFERENCES TP_DRESSEUR(id_dresseur),
  constraint fk_tp_pokedex_race FOREIGN KEY (race) REFERENCES TP_RACE(race)
);

prompt *************************************************************
prompt ******************** INSERT TABLE ***************************
prompt *************************************************************

insert into TP_DRESSEUR (id_dresseur,pseudo,ville_depart,date_naissance,sexe) 
VALUES (1,'Sacha','Bourg Palette',to_date('30-10-1989','DD-MM-YYYY'),'M');
insert into TP_DRESSEUR (id_dresseur,pseudo,ville_depart,date_naissance,sexe) 
VALUES (2,'Murielle','Bourg Geon',to_date('14-03-1986','DD-MM-YYYY'),'F');
insert into TP_DRESSEUR (id_dresseur,pseudo,ville_depart,date_naissance,sexe) 
VALUES (3,'Josianne','Bourg-en-Vol',to_date('24-02-2000','DD-MM-YYYY'),'F');
insert into TP_DRESSEUR (id_dresseur,pseudo,ville_depart,date_naissance,sexe) 
VALUES (4,'Patrick','Bourg Croquis',to_date('16-08-1998','DD-MM-YYYY'),'M');

insert into TP_RACE (race,description) 
VALUES ('carapuce','Carapuce est une petite tortue bipede de couleur bleue. Il possede une carapace majoritairement brune, jaune pale au niveau du ventre. Ses yeux sont grands et rouges.');
insert into TP_RACE (race,description) 
VALUES ('bulbizarre','Bulbizarre est un petit quadrupede vert avec une tete large. Il porte un bulbe sur son dos.');
insert into TP_RACE (race,description) 
VALUES ('salameche','Salameche est un petit reptile bipede orange semblable a une salamandre. Il possede quatre petits crocs, mais sa plus grande particularite est la petite flamme qui brule constamment au bout de sa queue.');

insert into TP_POKEMON (id_pokemon,race,nom,type_pokemon,niveau,id_dresseur,vie)
VALUES (1,'carapuce','cara','eau',4,1,50);
insert into TP_POKEMON (id_pokemon,race,nom,type_pokemon,niveau,id_dresseur,vie)
VALUES (2,'bulbizarre','bulbi','plante',2,2,100);
insert into TP_POKEMON (id_pokemon,race,nom,type_pokemon,niveau,id_dresseur,vie)
VALUES (3,'salameche','salami','feu',4,2,90);
insert into TP_POKEMON (id_pokemon,race,nom,type_pokemon,niveau,id_dresseur,vie)
VALUES (4,'carapuce','puce','eau',3,null,20);
insert into TP_POKEMON (id_pokemon,race,nom,type_pokemon,niveau,id_dresseur,vie)
VALUES (5,'bulbizarre','zaza','plante',4,4,15);
insert into TP_POKEMON (id_pokemon,race,nom,type_pokemon,niveau,id_dresseur,vie)
VALUES (6,'salameche','flami','feu',7,null,100);

insert into TP_POKEDEX (id_dresseur,race) VALUES (1,'carapuce');
insert into TP_POKEDEX (id_dresseur,race) VALUES (2,'bulbizarre');
insert into TP_POKEDEX (id_dresseur,race) VALUES (2,'salameche');
insert into TP_POKEDEX (id_dresseur,race) VALUES (4,'bulbizarre');

commit;

prompt *************************************************************
prompt ******************** AFFICHAGE TABLE ************************
prompt *************************************************************

set pages 1000
set lines 150
col race format a20
col pseudo format a20
col ville_depart format a20
col nom format a20
col type_pokemon format a20

SELECT * FROM TP_DRESSEUR;
SELECT * FROM TP_RACE;
SELECT * FROM TP_POKEMON;
SELECT * FROM TP_POKEDEX;

prompt *************************************************************
prompt ******************** QUESTION 1 *****************************
prompt *************************************************************

-- id_dresseur de la table TP_POKEMON doit référencer id_dresseur de la table TP_DRESSEUR

ALTER TABLE TP_POKEMON 
ADD constraint fk_tp_pokemon_dresseur FOREIGN KEY (id_dresseur) REFERENCES TP_DRESSEUR(id_dresseur);

-- test

insert into TP_POKEMON (id_pokemon,race,nom,type_pokemon,niveau,id_dresseur)
VALUES (7,'carapuce','cara','eau',4,18);

-- le niveau d'un pokemon doit être positif

ALTER TABLE TP_POKEMON ADD constraint tp_verif_niveau_positif CHECK (niveau > 0);

-- test

insert into TP_POKEMON (id_pokemon,race,nom,type_pokemon,niveau,id_dresseur)
VALUES (7,'carapuce','cara','eau',-4,1);

prompt
prompt
prompt *************************************************************
prompt ******************** QUESTION 2 *****************************
prompt *************************************************************

-- Pour chaque dresseur, affichez :
--	Son id
--	Son pseudo
--	Le nombre de pokemons qu'il possède ( 0 s'il n'en possède aucun)
-- Triez le résultat par id_dresseur.
-- pensez à utiliser la fonction NVL

select D.id_dresseur, pseudo, NVL(count(id_pokemon),0) "nb pokemon"
from TP_POKEMON P RIGHT OUTER JOIN TP_DRESSEUR D ON P.id_dresseur = D.id_dresseur
group by D.id_dresseur, pseudo
order by D.id_dresseur;

-- Affichez le dresseur ayant le plus d'entrée dans son pokedex
-- Affichez son id, son pseudo et le nombre de race de pokemon attrappé

select id_dresseur, pseudo, count(*) nb
from TP_DRESSEUR NATURAL JOIN TP_POKEDEX
group by id_dresseur, pseudo
having count(*) = (	select max(count(*))
					from TP_DRESSEUR NATURAL JOIN TP_POKEDEX
					group by id_dresseur, pseudo)
;

prompt
prompt
prompt *************************************************************
prompt ******************** QUESTION 3 *****************************
prompt *************************************************************

-- trigger update_pokedex qui se lancera à chaque insertion et update de la table TP_POKEMON
-- si le pokedex ne contient pas déjà le duo id_dresseur,race :
-- 	le trigger ajoute le duo à la table TP_POKEDEX
--  il affiche un message de bravo pour avoir attrappé le pokemon qui mentionne la race
--  puis il affiche la description de la race du pokemon

set serveroutput on

CREATE OR REPLACE TRIGGER UPDATE_POKEDEX
AFTER INSERT OR UPDATE ON TP_POKEMON
FOR EACH ROW
DECLARE
	dans_pokedex NUMBER;
	descr		 VARCHAR2(800);
BEGIN
	SELECT COUNT(*) INTO dans_pokedex 
	FROM TP_POKEDEX 
	WHERE race = :new.race and id_dresseur = :new.id_dresseur;
	IF dans_pokedex = 0 THEN
		IF :new.id_dresseur IS NOT NULL THEN
			INSERT INTO TP_POKEDEX VALUES (:new.id_dresseur, :new.race);
			SELECT description INTO descr FROM TP_RACE WHERE race = :new.race;
			dbms_output.put_line('Bravo ! Vous avez attrappe un '||:new.race||' : ');
			dbms_output.put_line(descr);
		END IF;
	END IF;
END;
/

show err

-- montrez que le trigger fonctionne par le biais d'au moins un update et un insert

select * from TP_POKEDEX order by id_dresseur;
update tp_pokemon set id_dresseur=3 where id_pokemon=4;
update tp_pokemon set id_dresseur=null where id_pokemon=4;
insert into TP_POKEMON (id_pokemon,race,nom,type_pokemon,niveau,id_dresseur)
VALUES (14,'salameche','salami','eau',4,3);
insert into TP_POKEMON (id_pokemon,race,nom,type_pokemon,niveau,id_dresseur)
VALUES (15,'salameche','salami','eau',4,3);
select * from TP_POKEDEX order by id_dresseur;

prompt
prompt
prompt *************************************************************
prompt ******************** QUESTION 4 *****************************
prompt *************************************************************

-- créez une procedure qui soigne tous les pokemons d'un dresseur
-- elle prendra en entrée l'id_dresseur
-- une fois les pokemons soignés, elle affichera un message disant qu'ils le sont

set serveroutput on

CREATE OR REPLACE PROCEDURE SOIGNE_POKEMON(id_dress NUMBER)
IS
BEGIN
	FOR pok IN (SELECT id_pokemon FROM TP_POKEMON WHERE id_dresseur = id_dress) LOOP
		update TP_POKEMON set vie = 100 where id_pokemon = pok.id_pokemon;
	END LOOP;
	dbms_output.put_line('Vos pokemons sont en pleine forme !');
END;
/
show err

-- testez la procedure 
select * from TP_POKEMON order by id_dresseur;
execute SOIGNE_POKEMON(2);
select * from TP_POKEMON order by id_dresseur;

prompt
prompt
prompt *************************************************************
prompt ******************** QUESTION 5 *****************************
prompt *************************************************************

-- donnez les droits en select sur la table TP_POKEMON à l'utilisateur TP_USER_POKEMON
grant select on TP_POKEMON to TP_USER_POKEMON;

-- donnez les droits d'insert, update et delete sur la table TP_POKEDEX à l'utilisateur TP_USER_POKEMON
grant insert, update, delete on TP_POKEDEX to TP_USER_POKEMON;


prompt
prompt
prompt *************************************************************
prompt ******************** QUESTION BONUS *************************
prompt *************************************************************

explain plan for select * from TP_DRESSEUR where sexe = 'F';
SELECT * FROM table(DBMS_XPLAN.DISPLAY);

-- comment améliorer le plan d'execution

-- Réponse : on peut ajouter un index bitmap sur sexe dans la table TP_DRESSEUR

-- implémentation de la solution

create bitmap index tp_index_sexe on TP_DRESSEUR(sexe);

explain plan for select * from TP_DRESSEUR where sexe = 'F';
SELECT * FROM table(DBMS_XPLAN.DISPLAY);

spool off
