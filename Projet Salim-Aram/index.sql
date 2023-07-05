DROP INDEX les_joueurs_de_une_equipe;
DROP INDEX nom_stade_de_un_match;

CREATE INDEX les_joueurs_de_une_equipe on JOUEUR (nomEquipe, idJoueur);

CREATE INDEX nom_stade_de_un_match on MATCH (nomStade);
