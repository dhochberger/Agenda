/*  
    File : requetes.sql
    Brief : Fichier contenant les requêtes SQL
    Author : ARMAND LYNE & HOCHBERGER DYLAN
*/

-- 1) Nombre d'activité des agendas par catégorie et par utilisateur

SELECT c.idCategorie, g.idUser, count(c.idActivite) as nbActivité
FROM Activite c, Agenda g
WHERE c.idAgenda = g.idAgenda
GROUP BY c.idCategorie, g.idUser;

-- 2) Nombre de commentaires total pour les utilisateurs actifs (utilisateurs ayant édité un agenda au cours des trois derniers mois)

SELECT count(*)
FROM COMMENTAIRE
WHERE idUser IN 
    (SELECT idUser
     FROM Agenda
     WHERE idAgenda IN (SELECT idAgenda
				        FROM Activite
				        WHERE TO_char(dateUp,'DD')-TO_char(sysdate,'DD') <90));

-- 3) Les activités ayant eu au moins cinq évaluations et dont la note moyenne est inférieure à trois


SELECT idActivite
FROM Activite
WHERE idActivite IN (SELECT idActivite
				     FROM Evaluation
					 GROUP BY idActivite
					 HAVING count(*) > 5 AND avg(note) < 3);

-- 4) L'agenda ayant le plus de commentaire moyens (commentaires ouverts et restreints) par activités

CREATE VIEW countCom
AS
	SELECT a.idActivite, a.idAgenda , COUNT(uca.idCom) AS count_com
	FROM Activite a
	INNER JOIN Agenda aca
		ON aca.idAgenda = a.idAgenda
	INNER JOIN Commentaire uca
		ON uca.idActivite = a.idActivite
	GROUP BY a.idActivite,a.idAgenda;

SELECT *
FROM (SELECT idAgenda, AVG(count_com) AS "Max Average Comment"
			FROM countCom
			GROUP BY idAgenda
			ORDER BY "Max Average Comment" DESC)
WHERE ROWNUM = 1;

DROP VIEW countCom;

-- 5) Pour chaque utilisateur, son login, son nom, son prénom, son adresse, son nombre d’agendas, son nombre d’activités, le nombre de commentaires qu’il a rédigés et le nombre d’activités qu’il a évaluées

SELECT u.idUser AS "ID", u.pseudo AS "Login", u.nom AS "Name", u.prenom AS "First name", u.adresse,
    COUNT(ag.idAgenda) AS "Nb agenda", COUNT(uca.idActivite) AS "Nb activite",
    COUNT(uca.idCom) AS "Nb com"
FROM Utilisateur u
    INNER JOIN Agenda ag
        ON u.idUser = ag.idUser
    INNER JOIN Commentaire uca
        ON u.idUser = uca.idUser
GROUP BY u.idUser, u.pseudo, u.nom, u.prenom, u.adresse;