CREATE OR REPLACE VIEW Match_Angleterre_avant_19h AS
    SELECT idMatch
    FROM MATCH NATURAL JOIN EQUIPE
    WHERE nomEquipe='Angleterre' AND heureMatch>'19:00';
    
CREATE OR REPLACE VIEW match_en_stade_cons_avant_2000 AS
    SELECT idMatch,dateMatch,heureMatch
    FROM MATCH NATURAL JOIN STADE
    WHERE (anneeConstruction<2000);
    
CREATE OR REPLACE VIEW joueur_en_match_MA12 AS
    SELECT DISTINCT idJoueur, nomJ, prenomJ 
    FROM JOUEUR NATURAL JOIN EQUIPE
    WHERE idMatch = 'MA12';
    
     
