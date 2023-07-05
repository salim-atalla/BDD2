DROP ROLE acces_libre;
CREATE ROLE acces_libre; 
GRANT ALL ON STADE to acces_libre;                                                  
GRANT ALL ON ENTRENEUR to acces_libre;                                                    
GRANT ALL ON JOUEUR to acces_libre;                                                  
GRANT ALL ON MATCH to acces_libre;                                               
GRANT ALL ON EQUIPE to acces_libre;  


--GRANT SELECT,UPDATE, INSERT ON MATCH to L3_14 WITH GRANT OPTION;
GRANT SELECT, INSERT ON EQUIPE to L3_29 WITH GRANT OPTION;
GRANT SELECT, DELETE ON STADE to L3_20;

GRANT acces_libre to L3_14;

--Avec le compte pour qui on a créé le rôle on fait 
--CREATE SYNONYM TAB_NAME FOR USER.TAB_NAME;