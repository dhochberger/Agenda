/*
    File : procédures.sql
    Brief : Fichier contenant les procédures et fonctions PL/SQL
    Author : ARMAND LYNE & HOCHBERGER DYLAN
*/

-- 1) Définir une fonction qui convertit au format csv (colonnes csv dans le même ordre que celles de la table) ou au format iCalendar une activité d'un calendrier

CREATE OR REPLACE FUNCTION sqltocsv(csv_p boolean, idAct_p number) 
return varchar2 
IS
DECLARE
	row ACTIVITE%ROWTYPE;
	return_string_p varchar2;
	categorie varchar2;
BEGIN
	SELECT * INTO row
	FROM ACTIVITE
	WHERE idActivite = idAct_p;

	SELECT nom INTO categorie
	FROM CATEGORIE
	WHERE idCategorie = row.idCategorie;

	IF (csv_p = 1) THEN
		return_string_p := '\"' || row.titre ||'\"','\"'|| 
						row.descriptif ||'\"','\"'|| 
						row.positionGeo ||'\"','\"'||
						categorie ||'\"',||
						to_char(row.dateDeb,'DD/MM/YYYY HH:MM:SS') ||,|| 
						to_char(row.dateFin,'DD/MM/YYYY HH:MM:SS');
	ELSE
		return_string_p := 'BEGIN:VEVENT' || char(13) ||
						'DTSTART:' || to_char(row.dateDeb, 'YYYYMMDD') || 'T' || to_char(row.dateDeb, 'HHMMSS') || 'Z' || char(13) ||
						'DTEND:' || to_char(row.dateFin, 'YYYYMMDD') || 'T' || to_char(row.dateFin, 'HHMMSS') || 'Z' || char(13) ||
						'SUMMARY:' || row.titre || char(13) ||
						'DESCRIPTION:' || row.descriptif || char(13) ||
						'LOCATION:' || row.positionGeo || char(13) ||
						'CATEGORIES:' || categorie || char(13) ||
						'END:VEVENT';
	END IF;

	return return_string_p;
END;
/

-- 2) Créer une fonction permettant d’exporter au format csv ou iCalendar les activités d’un agenda pour une semaine de l’année donnée. Le résultat sera renvoyé sous la forme d’une chaîne de caractère


CREATE OR REPLACE FUNCTION sqltocsv_week(csv_p boolean, idAg_p number, nWeek_p number) 
return varchar2 
IS
DECLARE
	CURSOR curs IS
		SELECT idActivite
		FROM ACTIVITE
		WHERE idAgenda = idAg_p AND nWeek = nWeek_p;
	return_string_p varchar2;
BEGIN
	IF (csv_p = 1) THEN
		return_string_p := 'titre,description,localisation,categorie,dateDebut,dateFin' || char(13)

		FOR act IN curs
		LOOP
			return_string_p := return_string_p || sqltocsv(1,act) || char(13);
		END LOOP;
	ELSE
		return_string_p := 'BEGIN:VCALENDAR' || char(13);

		FOR act IN curs
		LOOP
			return_string_p := return_string_p || sqltocsv(0,act) || char(13);
		END LOOP;

		return_string_p := return_string_p || 'END:VCALENDAR';
	END IF;

	return return_string_p;
E

-- 3) Définir une procédure qui permet de fusionner plusieurs agendas, c’est à dire à partir de N agendas, créer un nouvel agenda

CREATE OR REPLACE PROCEDURE fusionAgendas(agendas_p VARRAY OF NUMBER, name VARCHAR2) IS
DECLARE
	new_idAgenda number := seq_agenda;
BEGIN
	INSERT INTO AGENDA (idAgenda, nom)
	VALUES (new_idAgenda, name);

	FOR i IN 0..agendas_p.count
	LOOP
		FOR row IN (SELECT * FROM ACTIVITE WHERE idAgenda = agendas_p(i))
		LOOP
			INSERT INTO ACTIVITE
			VALUES (seq_activite, new_idAgenda, row.idCategorie, row.titre, row.descriptif, row.positionGeo, sysdate, sysdate, row.dateDeb, row.dateFin, row.periodicite, row.occurence, row.priorite);
		END LOOP;
	END LOOP;
END;
/

-- 4) Définir une procédure qui créé une activité inférée à partir d’agendas existants pour réaliser les cas présents dans l’énoncé comme par exemple, reporter au week-end l’achat d’objets sortis aux cours de la semaine ou reporter au soir le visionnage d’une émission sortie au cours de la journée

CREATE OR REPLACE PROCEDURE deplacementActivite(idAct_p NUMBER, new_date_deb date) IS
DECLARE
	old_date_deb date;
	old_date_fin date;
	new_date_fin date;
	temps_inter date;
BEGIN
	SELECT dateDeb, dateFin INTO old_date_deb, old_date_fin
	FROM ACTIVITE
	WHERE idActivite = idAct_p;

	temps_inter := new_date_deb - old_date_deb;
	new_date_fin := old_date_fin + temps_inter;

	UPDATE ACTIVITE
	SET dateDeb = new_date_deb AND dateFin = new_date_fin
	WHERE idActivite = idAct_p;
END;
/