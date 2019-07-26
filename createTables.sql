/*
    File : createTables.sql
    Brief : Fichier contenant les tables et les triggers
    Author : ARMAND LYNE & HOCHBERGER DYLAN
*/

/* Creation des tables */

CREATE TABLE Utilisateur(
    idUser NUMBER(8),
    nom VARCHAR2(30),
    prenom VARCHAR2(30),
    adresse VARCHAR2(50),
    pseudo VARCHAR2(30) UNIQUE,
    mdp VARCHAR2(50),
    email VARCHAR2(40) UNIQUE,
    dateInscription DATE DEFAULT SYSDATE,
    CONSTRAINT pk_User PRIMARY KEY (idUser)
);

CREATE TABLE Agenda(
    idAgenda NUMBER(8),
    idUser NUMBER(8),
    nom VARCHAR2(30),
    description VARCHAR2(300),
    dateCrea DATE DEFAULT SYSDATE,
    dateUp DATE DEFAULT SYSDATE,
    intersection NUMBER(1),
    prive NUMBER(1),
    partage NUMBER(1),
    CONSTRAINT pk_Agenda PRIMARY KEY (idAgenda),
    CONSTRAINT fk_Agenda_User FOREIGN KEY(idUser) REFERENCES Utilisateur(idUser) ON DELETE SET NULL
);

CREATE TABLE Categorie(
    idCategorie NUMBER(8),
    nom VARCHAR2(50),
    CONSTRAINT pk_Categorie PRIMARY KEY (idCategorie)
);

CREATE TABLE Activite(
    idActivite NUMBER(8),
    idAgenda NUMBER(8) CONSTRAINT nn_idAgenda_Activite NOT NULL,
    idCategorie NUMBER(8),
    idSimilaire NUMBER(8),
    titre VARCHAR2(50),
    descriptif VARCHAR2(300),
    positionGeo VARCHAR2(50),
    dateCrea DATE DEFAULT SYSDATE,
    dateUp DATE DEFAULT SYSDATE,
    dateDeb DATE,
    dateFin DATE,
    nWeek NUMBER(2),
    nDay NUMBER(1),
    periodicite NUMBER(1),
    occurrence NUMBER(8),
    priorite NUMBER(8),
    CONSTRAINT pk_Activite PRIMARY KEY (idActivite),
    CONSTRAINT fk_Activite_Agend FOREIGN KEY (idAgenda) REFERENCES Agenda ON DELETE CASCADE,
    CONSTRAINT fk_Activite_Categ FOREIGN KEY (idCategorie) REFERENCES Categorie ON DELETE SET NULL,
    CONSTRAINT ck_dateDeb_Activite CHECK (dateDeb < dateFin),
    CONSTRAINT ck_periodicite CHECK (periodicite IN (NULL,'J','S','M','A'))
);

CREATE TABLE Pause(
    idPause NUMBER(8),
    idActivite NUMBER(8) CONSTRAINT nn_idActivite NOT NULL,
    dateDeb DATE,
    dateFin DATE,
    periodicite NUMBER(1),
    occurrence NUMBER(8),
    CONSTRAINT pk_Pause PRIMARY KEY (idPause),
    CONSTRAINT fk_Pause_Activ FOREIGN KEY (idActivite) REFERENCES Activite(idActivite) ON DELETE CASCADE,
    CONSTRAINT ck_dateDeb_Pause CHECK (dateDeb < dateFin)
);

CREATE TABLE Commentaire(
    idCom NUMBER(8),
    idParent NUMBER(8),
    idUser NUMBER(8) CONSTRAINT nn_idUser_Com NOT NULL,
    idActivite NUMBER(8) CONSTRAINT nn_idActivite_Com NOT NULL,
    commentaire VARCHAR2(300),
    dateCom DATE DEFAULT SYSDATE,
    CONSTRAINT pk_Commentaire PRIMARY KEY (idCom),
    CONSTRAINT fk_Com_Com FOREIGN KEY (idParent) REFERENCES Commentaire(idCom),
    CONSTRAINT fk_Com_User FOREIGN KEY (idUser) REFERENCES Utilisateur(idUser) ON DELETE CASCADE,
    CONSTRAINT fk_Com_Activite FOREIGN KEY (idActivite) REFERENCES Activite(idActivite) ON DELETE CASCADE
);

CREATE TABLE Abonnement(
    idUser NUMBER(8),
    idAgenda NUMBER(8),
    priorite NUMBER(1),
    CONSTRAINT pk_Abonnement PRIMARY KEY (idUser,idAgenda),
    CONSTRAINT fk_Abon_User FOREIGN KEY (idUser) REFERENCES Utilisateur(idUser) ON DELETE CASCADE,
    CONSTRAINT fk_Abon_Agenda FOREIGN KEY (idAgenda) REFERENCES Agenda(idAgenda) ON DELETE CASCADE
);

CREATE TABLE Inscrit(
    idUser NUMBER(8),
    idActivite NUMBER(8),
    CONSTRAINT pk_Inscrit PRIMARY KEY (idUser,idActivite),
    CONSTRAINT fk_Inscrit_User FOREIGN KEY (idUser) REFERENCES Utilisateur(idUser) ON DELETE CASCADE,
    CONSTRAINT fk_Inscrit_Activite FOREIGN KEY (idActivite) REFERENCES Activite(idActivite) ON DELETE CASCADE
);

CREATE TABLE Evaluation(
    idUser NUMBER(8),
    idActivite NUMBER(8),
    note NUMBER(1),
    dateEval DATE DEFAULT SYSDATE,
    CONSTRAINT pk_Eval PRIMARY KEY (idUser,idActivite),
    CONSTRAINT fk_Eval_User FOREIGN KEY (idUser) REFERENCES Utilisateur(idUser) ON DELETE CASCADE,
    CONSTRAINT fk_Eval_Activite FOREIGN KEY (idActivite) REFERENCES Activite(idActivite) ON DELETE CASCADE,
    CONSTRAINT ck_note_Eval CHECK (note >=1 AND note <= 5)
);

CREATE TABLE Archive_Agenda(
    idAgenda NUMBER(8),
    idUser NUMBER(8),
    nom VARCHAR2(30),
    description VARCHAR2(300),
    intersection NUMBER(1),
    prive NUMBER(1),
    partage NUMBER(1),
    CONSTRAINT pk_A_Agenda PRIMARY KEY (idAgenda)
);

CREATE TABLE Archive_Activite(
    idActivite NUMBER(8),
    idAgenda NUMBER(8) CONSTRAINT nn_idAgenda_A_Activite NOT NULL,
    idCategorie NUMBER(8),
    idSimilaire NUMBER(8),
    titre VARCHAR2(50),
    descriptif VARCHAR2(300),
    positionGeo VARCHAR2(50),
    dateCrea DATE DEFAULT SYSDATE,
    dateUp DATE DEFAULT SYSDATE,
    dateDeb DATE,
    dateFin DATE,
    nWeek NUMBER(2),
    nDay NUMBER(1),
    periodicite NUMBER(1),
    occurrence NUMBER(8),
    priorite NUMBER(8),
    CONSTRAINT pk_A_Activite PRIMARY KEY (idActivite)
);

/* Partie séquences */

create sequence seq_utilisateur start with 1 increment by 1;
create sequence seq_agenda start with 1 increment by 1;
create sequence seq_activite start with 1 increment by 1;
create sequence seq_categorie start with 1 increment by 1;
create sequence seq_pause start with 1 increment by 1;
create sequence seq_comm start with 1 increment by 1;
create sequence seq_agenda_a start with 1 increment by 1;
create sequence seq_activite_a start with 1 increment by 1;
create sequence seq_similaire start with 1 increment by 1;

/* Partie Triggers */ 

-- Archivage des tables lors de la suppression d'un élément de agenda ou activité

CREATE OR REPLACE TRIGGER archivageAgenda
	BEFORE DELETE ON AGENDA
	FOR EACH ROW
BEGIN
	INSERT INTO A_AGENDA
	VALUES (:old.idAgenda, :old.idUtilisateur, :old.nom, :old.description, :old.intersection, :old.prive, :old.partage);
END;
/

CREATE OR REPLACE TRIGGER archivageActivite
	BEFORE DELETE ON ACTIVITE
	FOR EACH ROW
BEGIN
	INSERT INTO A_ACTIVITE
	VALUES (:old.idActivite, :old.idAgenda, :old.titre, :old.descriptif, :old.posGeographique, :old.dateCreation, :old.dateDeb, :old.dateFin, :old.periodicite, :old.occurences, :old.priorite);
END;
/

