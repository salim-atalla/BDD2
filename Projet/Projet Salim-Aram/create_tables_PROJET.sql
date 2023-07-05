-- @create_tables_PROJET.sql
spool create_tables_PROJET.log

prompt *************************************************************
prompt ******************** DROP TABLE *****************************
prompt *************************************************************

DROP TABLE STADE CASCADE CONSTRAINTS;
DROP TABLE ENTRENEUR CASCADE CONSTRAINTS;
DROP TABLE JOUEUR CASCADE CONSTRAINTS;
DROP TABLE MATCH CASCADE CONSTRAINTS;
DROP TABLE EQUIPE CASCADE CONSTRAINTS;
--DROP TABLE PRINCIPALE CASCADE CONSTRAINTS;

prompt *************************************************************
prompt ******************** CREATE TABLE ***************************
prompt *************************************************************


CREATE TABLE STADE (
	nomStade			VARCHAR2(50),
	nbSpectateur	    NUMBER,
	anneeConstruction	NUMBER(4),
	CONSTRAINT pk_stade PRIMARY KEY(nomStade)
);

CREATE TABLE ENTRENEUR (
	nomEquipe		VARCHAR2(50),
	idEntreneur	    VARCHAR2(6),
	anneeCreation	NUMBER(4),
	CONSTRAINT pk_entreneur PRIMARY KEY(nomEquipe)
);

CREATE TABLE JOUEUR (
	idJoueur	VARCHAR2(6),
	nomEquipe	VARCHAR2(50),
	numJoueur	NUMBER,
	prenomJ		VARCHAR2(20),
	nomJ		VARCHAR2(20),
	CONSTRAINT pk_joueur PRIMARY KEY(idJoueur),
	CONSTRAINT fk_entreneur FOREIGN KEY(nomEquipe) REFERENCES ENTRENEUR(nomEquipe),
	CHECK (numJoueur BETWEEN 1 AND 99) 
);

CREATE TABLE MATCH (
	idMatch		VARCHAR2(4),
	nomStade	VARCHAR2(50),
	idArbitre	VARCHAR2(4),
	dateMatch	DATE,
	heureMatch	VARCHAR2(5),
	CONSTRAINT pk_match PRIMARY KEY(idMatch),
	CONSTRAINT fk_satde FOREIGN KEY(nomStade) REFERENCES STADE(nomStade),
	CHECK (dateMatch BETWEEN to_date('14-06-2018','dd-mm-yyyy')
		AND to_date('15-07-2018','dd-mm-yyyy'))
);

CREATE TABLE EQUIPE (
	nomEquipe 	VARCHAR2(20),
	idMatch		VARCHAR2(4),
	maillot		VARCHAR2(15),
	CONSTRAINT fk_entreEquipe FOREIGN KEY(nomEquipe) REFERENCES ENTRENEUR(nomEquipe),
	CONSTRAINT fk_match FOREIGN KEY(idMatch) REFERENCES MATCH(idMatch)
);


spool off