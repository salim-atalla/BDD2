-- @insert_tables_PROJET.sql
spool insert_tables_PROJET.log

prompt *************************************************************
prompt ******************** DELETE TABLE *****************************
prompt *************************************************************

DELETE FROM STADE;
DELETE FROM ENTRENEUR;
DELETE FROM JOUEUR;
DELETE FROM MATCH;
DELETE FROM EQUIPE;

prompt *************************************************************
prompt ******************** INSERT TUPLES **************************
prompt *************************************************************


INSERT INTO STADE VALUES ('Stade de France',81338,1995);
INSERT INTO STADE VALUES ('Stade Loujniki',103000,1955);
INSERT INTO STADE VALUES ('Stade de Saint-Petersbourg',68134,2017);
INSERT INTO STADE VALUES ('Rostov Arena',43472,2014);


INSERT INTO ENTRENEUR VALUES ('France','EN1011',1904);
INSERT INTO ENTRENEUR VALUES ('Allemagne','EN1012',1908);
INSERT INTO ENTRENEUR VALUES ('Croatie','EN1013',1912);
INSERT INTO ENTRENEUR VALUES ('Angleterre','EN1014',1900);
INSERT INTO ENTRENEUR VALUES ('Belgique','EN1015',1921);
INSERT INTO ENTRENEUR VALUES ('Japon','EN1016',1919);

INSERT INTO JOUEUR VALUES ('JO1001','France',1,'Lioris','Hugo');
INSERT INTO JOUEUR VALUES ('JO1007','France',7,'Antoine','Griezmann');
INSERT INTO JOUEUR VALUES ('JO1021','Allemagne',1,'Manuel','Neuer');
INSERT INTO JOUEUR VALUES ('JO1015','Allemagne',8,'Toni','Kross');
INSERT INTO JOUEUR VALUES ('JO1010','Croatie',10,'Luka','Modric');
INSERT INTO JOUEUR VALUES ('JO1004','Croatie',4,'Ivan','Perisic');
INSERT INTO JOUEUR VALUES ('JO1009','Angleterre',9,'Harry','Kane');
INSERT INTO JOUEUR VALUES ('JO1020','Angleterre',20,'Alli','Dele');
INSERT INTO JOUEUR VALUES ('JO1003','Angleterre',3,'Danny','Rose');
INSERT INTO JOUEUR VALUES ('JO1070','Belgique',7,'Kevin','De Bruyen');
INSERT INTO JOUEUR VALUES ('JO1090','Belgique',9,'Romelu','Lukaku');
INSERT INTO JOUEUR VALUES ('JO1019','Japon',19,'Yuya','Osako');
INSERT INTO JOUEUR VALUES ('JO1000','Japon',10,'Shinji','Kagawa');


INSERT INTO MATCH VALUES ('MA21','Stade de France',           'AR10',to_date('15-07-2018','dd-mm-yyyy'),'16:00');
INSERT INTO MATCH VALUES ('MA12','Stade Loujniki',            'AR11',to_date('11-07-2018','dd-mm-yyyy'),'20:15');
INSERT INTO MATCH VALUES ('MA02','Stade de Saint-Petersbourg','AR12',to_date('14-07-2018','dd-mm-yyyy'),'15:00');
INSERT INTO MATCH VALUES ('MA23','Rostov Arena',              'AR10',to_date('02-07-2018','dd-mm-yyyy'),'21:00');

INSERT INTO EQUIPE VALUES ('France','MA21','Bleu');
INSERT INTO EQUIPE VALUES ('Allemagne','MA21','Noir');
INSERT INTO EQUIPE VALUES ('Croatie','MA12','Rouge');
INSERT INTO EQUIPE VALUES ('Angleterre','MA12','Blanc');
INSERT INTO EQUIPE VALUES ('Angleterre','MA02','Blanc');
INSERT INTO EQUIPE VALUES ('Belgique','MA02','Jaune');
INSERT INTO EQUIPE VALUES ('Belgique','MA23','Jaune');
INSERT INTO EQUIPE VALUES ('Japon','MA23','Marine');

spool off