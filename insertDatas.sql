/*
    File : insertDatas.sql
    Brief : Fichier contenant les insertions de données dans les différentes tables 
    Author : ARMAND LYNE & HOCHBERGER DYLAN
*/


/* INsertion données dans la table Utilisateur */

INSERT INTO Utilisateur(idUser,nom,prenom,adresse,pseudo,mdp,email) VALUES (seq_utilisateur.nextval,'Martel','Jean','8 Rue des pâquerettes','martel.jean','mjean','martel.jean@gmail.com');
INSERT INTO Utilisateur(idUser,nom,prenom,adresse,pseudo,mdp,email) VALUES (seq_utilisateur.nextval,'Texier','Louane','6 Rue des anges','texier.louane','tlouane','texier.louane@gmail.com');
INSERT INTO Utilisateur(idUser,nom,prenom,adresse,pseudo,mdp,email) VALUES (seq_utilisateur.nextval,'Riou','Bernard','14 Rue des prés','riou.bernard','rbernard','riou.bernard@hotmail.com');
INSERT INTO Utilisateur(idUser,nom,prenom,adresse,pseudo,mdp,email) VALUES (seq_utilisateur.nextval,'Labbe','Paul','4 Rue du pré','labbe.paul','lpaul','labbe.paul@free.fr');
INSERT INTO Utilisateur(idUser,nom,prenom,adresse,pseudo,mdp,email) VALUES (seq_utilisateur.nextval,'Buisson','Andre','5 Rue du champ','buisson.andre','bandre','buisson.andre@orange.fr');
INSERT INTO Utilisateur(idUser,nom,prenom,adresse,pseudo,mdp,email) VALUES (seq_utilisateur.nextval,'Mallet','Amanda','31 Route des champs','mallet.amanda','mamanda','mallet.amanda@hotmail.com');
INSERT INTO Utilisateur(idUser,nom,prenom,adresse,pseudo,mdp,email) VALUES (seq_utilisateur.nextval,'Leblanc','Dom','1 Rue des pâquerettes','leblanc.dom','ldom','leblanc.dom@gmail.com');
INSERT INTO Utilisateur(idUser,nom,prenom,adresse,pseudo,mdp,email) VALUES (seq_utilisateur.nextval,'Dumont','Chris','5 Rue des anges','dumont.chris','dchris','dumont.chris@gmail.com');
INSERT INTO Utilisateur(idUser,nom,prenom,adresse,pseudo,mdp,email) VALUES (seq_utilisateur.nextval,'Pierre','Emmanuel','6 Rue des clés','pierre.emmanuel','pemmanuel','pierre.emmanuel@gmail.com');
INSERT INTO Utilisateur(idUser,nom,prenom,adresse,pseudo,mdp,email) VALUES (seq_utilisateur.nextval,'Legrand','Emma','11 Impasse des perles','legrand.emma','lemma','legrand.emma@gmail.com');

/* Insertion données dans la table Catégorie */

INSERT INTO Categorie VALUES (seq_categorie.nextval,'Art');
INSERT INTO Categorie VALUES (seq_categorie.nextval,'Comédie');
INSERT INTO Categorie VALUES (seq_categorie.nextval,'Jeux');
INSERT INTO Categorie VALUES (seq_categorie.nextval,'Jardinage');
INSERT INTO Categorie VALUES (seq_categorie.nextval,'Fête');

INSERT INTO Categorie VALUES (seq_categorie.nextval,'Film');
INSERT INTO Categorie VALUES (seq_categorie.nextval,'Fitness');
INSERT INTO Categorie VALUES (seq_categorie.nextval,'Danse');
INSERT INTO Categorie VALUES (seq_categorie.nextval,'Boisson');
INSERT INTO Categorie VALUES (seq_categorie.nextval,'Musique');

/* Insertion données dans la table Agenda */

INSERT INTO Agenda(idAgenda,idUser,nom,description,dateCrea,dateUp,prive,partage) VALUES (seq_agenda.nextval,1,'Programme Fitness','Cours de fitness et musculation',SYSDATE,SYSDATE,0,1);
INSERT INTO Agenda(idAgenda,idUser,nom,description,dateCrea,dateUp,prive,partage) VALUES (seq_agenda.nextval,8,'Programme Film','Soiree cinema et grands films',SYSDATE,SYSDATE,0,1);
INSERT INTO Agenda(idAgenda,idUser,nom,description,dateCrea,dateUp,prive,partage) VALUES (seq_agenda.nextval,4,'Programme Danse','Cours de danse, zumba, hiphop',SYSDATE,SYSDATE,0,1);
INSERT INTO Agenda(idAgenda,idUser,nom,description,dateCrea,dateUp,prive,partage) VALUES (seq_agenda.nextval,9,'Mon programme jardinage','Plantes, cueillette prevues',SYSDATE,SYSDATE,1,0);
INSERT INTO Agenda(idAgenda,idUser,nom,description,dateCrea,dateUp,prive,partage) VALUES (seq_agenda.nextval,1,'Soirée organisée','Soiree pour un anniversaire',SYSDATE,SYSDATE,1,1);

INSERT INTO Agenda(idAgenda,idUser,nom,description,dateCrea,dateUp,prive,partage) VALUES (seq_agenda.nextval,8,'A ne pas louper','Les evenements auxquels participer',SYSDATE,SYSDATE,0,1);
INSERT INTO Agenda(idAgenda,idUser,nom,description,dateCrea,dateUp,prive,partage) VALUES (seq_agenda.nextval,7,'Comédie à voir','Seances des meilleurs films',SYSDATE,SYSDATE,0,1);
INSERT INTO Agenda(idAgenda,idUser,nom,description,dateCrea,dateUp,prive,partage) VALUES (seq_agenda.nextval,5,'Mon agenda','Mes rendez-vous prévus',SYSDATE,SYSDATE,1,0);
INSERT INTO Agenda(idAgenda,idUser,nom,description,dateCrea,dateUp,prive,partage) VALUES (seq_agenda.nextval,4,'Agenda','Mes evenements personnels',SYSDATE,SYSDATE,1,0);
INSERT INTO Agenda(idAgenda,idUser,nom,description,dateCrea,dateUp,prive,partage) VALUES (seq_agenda.nextval,6,'Agenda bis','Mes evenements',SYSDATE,SYSDATE,1,1);

INSERT INTO Agenda(idAgenda,idUser,nom,description,dateCrea,dateUp,prive,partage) VALUES (seq_agenda.nextval,3,'Programme Musique','Concerts a venir',SYSDATE,SYSDATE,0,1);
INSERT INTO Agenda(idAgenda,idUser,nom,description,dateCrea,dateUp,prive,partage) VALUES (seq_agenda.nextval,7,'Programme Theatre','Pieces de theatre, comedies a venir',SYSDATE,SYSDATE,0,1);
INSERT INTO Agenda(idAgenda,idUser,nom,description,dateCrea,dateUp,prive,partage) VALUES (seq_agenda.nextval,4,'Piques-nique','Pique-nique en famille',SYSDATE,SYSDATE,1,1);
INSERT INTO Agenda(idAgenda,idUser,nom,description,dateCrea,dateUp,prive,partage) VALUES (seq_agenda.nextval,8,'Rendez-vous professionnels','Mes rendez-vous professionnels a venir',SYSDATE,SYSDATE,1,0);
INSERT INTO Agenda(idAgenda,idUser,nom,description,dateCrea,dateUp,prive,partage) VALUES (seq_agenda.nextval,1,'Fêtes foraines','Les fêtes foraines à venir',SYSDATE,SYSDATE,0,1);
    
/* Insertion données dans la table Activite */

INSERT INTO Activite(idActivite,idAgenda,idCategorie,titre,descriptif,dateDeb,dateFin)
    VALUES (seq_activite.nextval,4,4,'Tomates','Plantage tomates',TO_DATE('26/03/2018','DD/MM/YYYY'),TO_DATE('27/03/2018','DD/MM/YYYY'));
INSERT INTO Activite(idActivite,idAgenda,idCategorie,titre,descriptif,positionGeo,dateDeb,dateFin)
    VALUES (seq_activite.nextval,5,5,'Anniversaire Remi','26e Anniversaire de Remi','Paris',TO_DATE('26/03/2018','DD/MM/YYYY'),TO_DATE('27/03/2018','DD/MM/YYYY'));
INSERT INTO Activite(idActivite,idAgenda,idCategorie,titre,descriptif,positionGeo,dateDeb,dateFin)
    VALUES (seq_activite.nextval,7,6,'La cite de la peur','Film des Nuls au festival des films comiques chaque soir','Roubaix',TO_DATE('28/03/2018','DD/MM/YYYY'),TO_DATE('29/03/2018','DD/MM/YYYY'));
	
INSERT INTO Activite(idActivite,idAgenda,idCategorie,titre,descriptif,positionGeo,dateDeb) VALUES (seq_activite.nextval,3,8,'Cours Zumba','Cours pour débutants et expérimentés','Grenoble',TO_DATE('31/08/2018','DD/MM/YYYY'));
INSERT INTO Activite(idActivite,idAgenda,idCategorie,titre,descriptif,positionGeo,dateDeb) VALUES (seq_activite.nextval,9,8,'Restaurant','Restaurant avec la famille','Lille',TO_DATE('25/07/2018','DD/MM/YYYY'));

INSERT INTO Activite(idActivite,idAgenda,idCategorie,titre,descriptif,dateDeb) VALUES (seq_activite.nextval,9,3,'Jeux amis','Soiree jeux de societe chez Clement',TO_DATE('28/09/2018','DD/MM/YYYY' ));
INSERT INTO Activite(idActivite,idAgenda,idCategorie,titre,descriptif,dateDeb,dateFin)
    VALUES (seq_activite.nextval,4,4,'Cerises','Cueillettes cerises',TO_DATE('26/03/2018','DD/MM/YYYY'),TO_DATE('27/03/2018','DD/MM/YYYY'));
INSERT INTO Activite(idActivite,idAgenda,idCategorie,titre,descriptif,dateDeb,dateFin)
    VALUES (seq_activite.nextval,4,4,'Fraises','Cueillettes fraises',TO_DATE('28/03/2018','DD/MM/YYYY'),TO_DATE('29/03/2018','DD/MM/YYYY'));
INSERT INTO Activite(idActivite,idAgenda,idCategorie,titre,descriptif,dateDeb) VALUES (seq_activite.nextval,12,2,'Le malade imaginaire','Piece de theatre au CREPS',TO_DATE('29/03/2018','DD/MM/YYYY'));

INSERT INTO Activite(idActivite,idAgenda,idCategorie,titre,descriptif,positionGeo,dateDeb) VALUES (seq_activite.nextval,7,2,'La verite si je mens','Séance en plein air pour le festival de l entreprise','Monaco',TO_DATE('27/04/2018','DD/MM/YYYY'));

INSERT INTO Activite(idActivite,idAgenda,idCategorie,titre,descriptif,positionGeo,dateDeb) VALUES (seq_activite.nextval,7,2,'Gad Elmaleh one man show','Séance en pleine air pour le festival du rire','Roubaix',TO_DATE('25/04/2018','DD/MM/YYYY'));
INSERT INTO Activite(idActivite,idAgenda,idCategorie,titre,descriptif,positionGeo,dateDeb) VALUES (seq_activite.nextval,3,8,'Cours HipHop','Cours tout niveau','Nancy',TO_DATE('18/08/2018','DD/MM/YYYY'));
INSERT INTO Activite(idActivite,idAgenda,idCategorie,titre,descriptif,positionGeo,dateDeb) VALUES (seq_activite.nextval,11,9,'Degustations','Degustation region de chaque membre','Strasbourg',TO_DATE('25/04/2018','DD/MM/YYYY'));
INSERT INTO Activite(idActivite,idAgenda,idCategorie,titre,descriptif,dateDeb) VALUES (seq_activite.nextval,5,9,'Cocktails party','Soiree decouvertes cocktails chez Lucie',TO_DATE('29/03/2018','DD/MM/YYYY'));
INSERT INTO Activite(idActivite,idAgenda,idCategorie,titre,descriptif,positionGeo,dateDeb,dateFin)
    VALUES (seq_activite.nextval,1,7,'Soiree zouk','Soiree decouverte zouk et danse africaines','Poitiers',TO_DATE('26/03/2018','DD/MM/YYYY'),TO_DATE('27/03/2018','DD/MM/YYYY'));
	
INSERT INTO Activite(idActivite,idAgenda,idCategorie,titre,descriptif,positionGeo,dateDeb,dateFin)
    VALUES (seq_activite.nextval,1,7,'Cours de jazz moderne','Cours tout niveau à la salle des fêtes','Strasbourg',TO_DATE('28/03/2018','DD/MM/YYYY'),TO_DATE('29/03/2018','DD/MM/YYYY'));
    
/* Insertion données dans la table Commentaire */

INSERT INTO Commentaire(idCom,idParent,idUser,idActivite,commentaire,dateCom) VALUES (seq_comm.nextval,1,8,10,'Très bon film',TO_DATE('05/03/2018','DD/MM/YYYY'));
INSERT INTO Commentaire(idCom,idParent,idUser,idActivite,commentaire,dateCom) VALUES (seq_comm.nextval,1,5,10,'Très drôle, un bon moment',TO_DATE('28/03/2018','DD/MM/YYYY'));
INSERT INTO Commentaire(idCom,idParent,idUser,idActivite,commentaire,dateCom) VALUES (seq_comm.nextval,3,7,9,'Très belle salle',TO_DATE('29/04/2018','DD/MM/YYYY'));
INSERT INTO Commentaire(idCom,idParent,idUser,idActivite,commentaire,dateCom) VALUES (seq_comm.nextval,4,4,7,'1kg',TO_DATE('27/03/2018','DD/MM/YYYY'));
INSERT INTO Commentaire(idCom,idParent,idUser,idActivite,commentaire,dateCom) VALUES (seq_comm.nextval,5,1,3,'Film très marrant',TO_DATE('27/03/2018','DD/MM/YYYY'));
INSERT INTO Commentaire(idCom,idParent,idUser,idActivite,commentaire,dateCom) VALUES (seq_comm.nextval,5,3,3,'Les Nuls sont géniaux',TO_DATE('07/05/2018','DD/MM/YYYY'));
INSERT INTO Commentaire(idCom,idParent,idUser,idActivite,commentaire,dateCom) VALUES (seq_comm.nextval,6,1,5,'Très bon resto',TO_DATE('29/07/2018','DD/MM/YYYY'));
INSERT INTO Commentaire(idCom,idParent,idUser,idActivite,commentaire,dateCom) VALUES (seq_comm.nextval,7,10,11,'Toujours au top',TO_DATE('04/08/2018','DD/MM/YYYY'));
INSERT INTO Commentaire(idCom,idParent,idUser,idActivite,commentaire,dateCom) VALUES (seq_comm.nextval,6,9,12,'Super professeur',TO_DATE('14/08/2018','DD/MM/YYYY'));
INSERT INTO Commentaire(idCom,idParent,idUser,idActivite,commentaire,dateCom) VALUES (seq_comm.nextval,3,9,16,'Très bon cours',TO_DATE('13/08/2018','DD/MM/YYYY'));
INSERT INTO Commentaire(idCom,idParent,idUser,idActivite,commentaire,dateCom) VALUES (seq_comm.nextval,4,2,10,'Toujours aussi drôle',TO_DATE('12/08/2018','DD/MM/YYYY'));
INSERT INTO Commentaire(idCom,idParent,idUser,idActivite,commentaire,dateCom) VALUES (seq_comm.nextval,5,7,4,'Cours très bien organisé',TO_DATE('11/09/2018','DD/MM/YYYY'));
INSERT INTO Commentaire(idCom,idParent,idUser,idActivite,commentaire,dateCom) VALUES (seq_comm.nextval,5,8,5,'Très beau restaurant',TO_DATE('24/10/2018','DD/MM/YYYY'));
INSERT INTO Commentaire(idCom,idParent,idUser,idActivite,commentaire,dateCom) VALUES (seq_comm.nextval,6,9,5,'Vraiment super ce restaurant',TO_DATE('27/11/2018','DD/MM/YYYY'));

/* Insertion données dans la table Abonnement */
    
INSERT INTO Abonnement VALUES (1,2,1);
INSERT INTO Abonnement VALUES (1,1,2);
INSERT INTO Abonnement VALUES (2,4,3);
INSERT INTO Abonnement VALUES (3,3,NULL);

INSERT INTO Abonnement VALUES (2,2,1);
INSERT INTO Abonnement VALUES (3,1,2);
INSERT INTO Abonnement VALUES (4,4,3);
INSERT INTO Abonnement VALUES (5,3,NULL);

INSERT INTO Abonnement VALUES (6,2,1);
INSERT INTO Abonnement VALUES (1,5,2);
INSERT INTO Abonnement VALUES (2,1,3);
INSERT INTO Abonnement VALUES (3,8,NULL);

/* Insertion données dans la table Inscrit */

INSERT INTO Inscrit VALUES (8,10);
INSERT INTO Inscrit VALUES (5,10);
INSERT INTO Inscrit VALUES (7,9);
INSERT INTO Inscrit VALUES (4,7);
INSERT INTO Inscrit VALUES (1,3);
INSERT INTO Inscrit VALUES (3,3);
INSERT INTO Inscrit VALUES (1,5);
INSERT INTO Inscrit VALUES (10,11);
INSERT INTO Inscrit VALUES (9,12);
INSERT INTO Inscrit VALUES (9,16);
INSERT INTO Inscrit VALUES (2,10);
INSERT INTO Inscrit VALUES (7,4);
INSERT INTO Inscrit VALUES (8,5);
INSERT INTO Inscrit VALUES (9,5);

/* Insertion données dans la table Evaluation */

INSERT INTO Evaluation(idUser,idActivite,note,dateEval) VALUES (1,1,1,SYSDATE);
INSERT INTO Evaluation(idUser,idActivite,note,dateEval) VALUES (2,1,2,SYSDATE);
INSERT INTO Evaluation(idUser,idActivite,note,dateEval) VALUES (3,1,3,SYSDATE);
INSERT INTO Evaluation(idUser,idActivite,note,dateEval) VALUES (4,1,2,SYSDATE);
INSERT INTO Evaluation(idUser,idActivite,note,dateEval) VALUES (5,1,1,SYSDATE);
INSERT INTO Evaluation(idUser,idActivite,note,dateEval) VALUES (6,1,1,SYSDATE);
INSERT INTO Evaluation(idUser,idActivite,note,dateEval) VALUES (7,2,5,SYSDATE);
INSERT INTO Evaluation(idUser,idActivite,note,dateEval) VALUES (8,2,4,SYSDATE);
INSERT INTO Evaluation(idUser,idActivite,note,dateEval) VALUES (9,2,5,SYSDATE);
INSERT INTO Evaluation(idUser,idActivite,note,dateEval) VALUES (7,10,2,SYSDATE);
INSERT INTO Evaluation(idUser,idActivite,note,dateEval) VALUES (9,10,1,SYSDATE);
INSERT INTO Evaluation(idUser,idActivite,note,dateEval) VALUES (1,10,3,SYSDATE);
INSERT INTO Evaluation(idUser,idActivite,note,dateEval) VALUES (10,10,2,SYSDATE);
INSERT INTO Evaluation(idUser,idActivite,note,dateEval) VALUES (6,10,1,SYSDATE);
INSERT INTO Evaluation(idUser,idActivite,note,dateEval) VALUES (5,10,1,SYSDATE);
