/*
    File : dropTables.sql
    Brief : Fichier contenant les supressions des tables et sequences
    Author : ARMAND LYNE & HOCHBERGER DYLAN
*/

DROP TABLE Evaluation CASCADE CONSTRAINTS;
DROP TABLE Abonnement CASCADE CONSTRAINTS;
DROP TABLE Commentaire CASCADE CONSTRAINTS;
DROP TABLE Inscrit CASCADE CONSTRAINTS;
DROP TABLE Pause CASCADE CONSTRAINTS;
DROP TABLE Activite CASCADE CONSTRAINTS;
DROP TABLE Categorie CASCADE CONSTRAINTS;
DROP TABLE Agenda CASCADE CONSTRAINTS;
DROP TABLE Utilisateur CASCADE CONSTRAINTS;
DROP TABLE Archive_Activite CASCADE CONSTRAINTS;
DROP TABLE Archive_Agenda CASCADE CONSTRAINTS;

drop sequence seq_utilisateur;
drop sequence seq_agenda;
drop sequence seq_activite;
drop sequence seq_categorie;
drop sequence seq_pause;
drop sequence seq_comm;
drop sequence seq_agenda_a;
drop sequence seq_activite_a;
drop sequence seq_similaire;