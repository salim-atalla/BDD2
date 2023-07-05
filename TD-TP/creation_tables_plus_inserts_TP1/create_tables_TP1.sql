-- @create_tables_TP1.sql
spool create_tables_TP1.log

prompt *************************************************************
prompt ******************** DROP TABLE *****************************
prompt *************************************************************

DROP TABLE AVIS CASCADE CONSTRAINTS;
DROP TABLE ACHATS CASCADE CONSTRAINTS;
DROP TABLE LIVRES CASCADE CONSTRAINTS;
DROP TABLE CLIENTS CASCADE CONSTRAINTS;

prompt *************************************************************
prompt ******************** CREATE TABLE ***************************
prompt *************************************************************

CREATE TABLE CLIENTS (
	idcl 	NUMBER,
	nom		VARCHAR2(20),
	pren	VARCHAR2(15),
	adr		VARCHAR2(30),
	tel		VARCHAR2(12),
	CONSTRAINT pk_clients PRIMARY KEY(idcl)
);

CREATE TABLE LIVRES (
	refl	VARCHAR2(10),
	titre	VARCHAR2(50),
	auteur	VARCHAR2(20),
	genre	VARCHAR2(15),
	CONSTRAINT pk_livres PRIMARY KEY(refl)
);

CREATE TABLE ACHATS (
	idcl		NUMBER,
	refl		VARCHAR2(10),
	dateachat	DATE,
	CONSTRAINT pk_achats PRIMARY KEY(idcl,refl,dateachat),
	CONSTRAINT fk_achats_clients FOREIGN KEY(idcl) REFERENCES CLIENTS(idcl),
	CONSTRAINT fk_achats_livres FOREIGN KEY(refl) REFERENCES LIVRES(refl),
	CONSTRAINT check_dateachat 
		CHECK (dateachat BETWEEN to_date('01-01-2008','dd-mm-yyyy')
			AND to_date('31-12-2013','dd-mm-yyyy'))
);

-- ICI le code de création de la table AVIS

spool off