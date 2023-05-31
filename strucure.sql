drop table if exists Compte cascade;
drop table if exists Genre cascade;
drop table if exists Jour cascade;
drop table if exists Type cascade;
drop table if exists Velo cascade;
drop table if exists Horaire cascade;
drop table if exists Reparation cascade;
drop table if exists Categorie cascade;
drop table if exists Cat cascade;

CREATE TABLE Type(
                     idType serial primary key,
                     nom text unique not null
);
CREATE TABLE Genre(
                      idGenre serial primary key,
                      nom text unique not null
);

CREATE TABLE Jour(
                     idJour serial primary key,
                     nom text unique not null
);

CREATE TABLE Categorie(
                          idCategorie serial primary key,
                          nom text unique not null
);

CREATE TABLE Compte(
                       idCompte serial primary key,
                       prenom text,
                       nom text,
                       password text,
                       mail text,
                       admin boolean default false,
                       codepostal text,
                       ville text,
                       check ( mail LIKE  '%@%'),
                       check (length(codepostal)=5)
);

CREATE TABLE Velo(
                     idVelo serial primary key ,
                     idCompte int references Compte(idCompte),
                     idType int references Type(idType),
                     idGenre int references Genre(idGenre),
                     marque text,
                     taille_roue int,
                     electrique int default 0,
                     pliant int default 0,
                     prix int,
                     neuf int default 0,
                     quantite int,
                     titre text,
                     description text
);

CREATE TABLE Horaire(
                        idHoraire serial primary key,
                        idCompte int references Compte(idCompte),
                        debutH int not null,
                        debutM int not null,
                        finH int not null,
                        finM int not null,
                        check (debutH>=0 and debutH<25),
                        check (debutM>=0 and debutM<60),
                        check (finH>=0 and finH<25),
                        check (finM>=0 and finH<60)
);

CREATE TABLE Reparation(
                           idReparation serial primary key,
                           idCompte int references Compte(idCompte),
                           titre text not null ,
                           decription text not null
);



CREATE TABLE Cat(
                    idReparation int references Reparation(idReparation),
                    idCategorie int references Categorie(idCategorie),
                    primary key (idReparation, idCategorie)
);



INSERT INTO compte(prenom, nom, password, mail, admin, codepostal, ville) VALUES ('Camille','Guillier', 'cg', 'camille@guillier.com',true,'59600','Maubeuge');
INSERT INTO compte(prenom, nom, password, mail, admin, codepostal, ville) VALUES ('Sofiane','Braik','sb','sofiane@brk.com',true,'59600','Maubeuge');
INSERT INTO compte(prenom, nom, password, mail, admin, codepostal, ville) VALUES ('Corentin','Thiery','ct','corentin@thiery.com',true,'59600','Maubeuge');
INSERT INTO compte(prenom, nom, password, mail, admin, codepostal, ville) VALUES ('Benjamin','Viandier Chochois','benji','benjamin@viandierchochois.com',true,'59600','Maubeuge');
INSERT INTO compte(prenom, nom, password, mail, admin, codepostal, ville) VALUES ('Matheo','Frappat','mat','matheo@frappat.com',true,'59600','Maubeuge');
INSERT INTO compte(prenom, nom, password, mail, admin, codepostal, ville) VALUES ('Jean','MVC','jojo','jean@mvc.com',false,'59600','Maubeuge');
INSERT INTO compte(prenom, nom, password, mail, admin, codepostal, ville) VALUES ('Madara','Uchiwa','sharingan','madara@uchiwa.com',false,'59300','Valenciennes');
INSERT INTO compte(prenom, nom, password, mail, admin, codepostal, ville) VALUES ('Light','Yagami','kira','light@yagami.com',false,'59800','Lille');
INSERT INTO compte(prenom, nom, password, mail, admin, codepostal, ville) VALUES ('Eren','Jaeger','snk','eren@jaeger.com',false,'59300','Valenciennes');
INSERT INTO compte(prenom, nom, password, mail, admin, codepostal, ville) VALUES ('Naruto','Uzumaki','hokage','naruto@uzumaki.com',false,'59100','Roubaix');
INSERT INTO compte(prenom, nom, password, mail, admin, codepostal, ville) VALUES ('Ichigo','Kurosaki','shinigami','ichigo@bleach.com',false,'59200','Tourcoing');
INSERT INTO compte(prenom, nom, password, mail, admin, codepostal, ville) VALUES ('Sangoku','Dbz','goat','goku@dbz.com',false,'59500','Douai');
INSERT INTO compte(prenom, nom, password, mail, admin, codepostal, ville) VALUES ('Tanjiro','Kamado','kny','tanjiro@kamado.com',false,'59400','Cambrai');
INSERT INTO compte(prenom, nom, password, mail, admin, codepostal, ville) VALUES ('Gon','Freecs','hxh','gon@freecs.com',false,'59230','Saint-Amand-les-Eaux');
INSERT INTO compte(prenom, nom, password, mail, admin, codepostal, ville) VALUES ('Izuku','Midoriya','mha','izuku@midoriya.com',false,'59290','Wasquehal');
INSERT INTO compte(prenom, nom, password, mail, admin, codepostal, ville) VALUES ('Thorfinn','Karlsefini','vinland','thorfinn@karlsefini.com',false,'59240','Dunkerque');
INSERT INTO compte(prenom, nom, password, mail, admin, codepostal, ville) VALUES ('Yuji','Itadori','jjk','yuji@itadori.com',false,'59120','Loos');
INSERT INTO compte(prenom, nom, password, mail, admin, codepostal, ville) VALUES ('Zoro','Roronoa','ashura','zoro@roronoa.com',false,'59300','Valenciennes');

INSERT INTO type(idtype, nom) VALUES ('1','Tout-terrain');
INSERT INTO type(idtype, nom) VALUES ('2','Tout-chemin');
INSERT INTO type(idtype, nom) VALUES ('3','Route');
INSERT INTO type(idtype, nom) VALUES ('4','Ville');
INSERT INTO type(idtype, nom) VALUES ('5','Draisienne');
INSERT INTO type(idtype, nom) VALUES ('6','Gravel');
INSERT INTO type(idtype, nom) VALUES ('7','Ville longue distance');
INSERT INTO type(idtype, nom) VALUES ('8','Carbone');

INSERT INTO genre(nom) VALUES ('Homme');
INSERT INTO genre(nom) VALUES ('Femme');
INSERT INTO genre(nom) VALUES ('Enfant');

INSERT INTO velo(idcompte, idtype, idgenre, marque, taille_roue, electrique,pliant, prix,neuf, quantite, titre, description) VALUES (10,1,1,'BMC',26,0,0,150,0,1,'Velo à vendre','Bonjour, je vends mon vélo en bonne état.');
INSERT INTO velo(idcompte, idtype, idgenre, marque, taille_roue, electrique, pliant, prix, neuf,quantite, titre, description) VALUES (11,3,3,'Scott',28,0,0,400,0,1,'Velo Scott','Bonjour, je vends mon vélo de route.');
INSERT INTO velo(idcompte, idtype, idgenre, marque, taille_roue, electrique,pliant, prix,neuf, quantite, titre, description) VALUES (13,4,1,'Trek',25,1,0,350,1,1,'Velo électrique','Bonjour, je vends mon vélo électrique.');
INSERT INTO velo(idcompte, idtype, idgenre, marque, taille_roue, electrique,pliant, prix,neuf, quantite, titre, description) VALUES (15,2,1,'Ridley',27,0,1,500,0,1,'Velo pliant','Bonjour, je vends mon vélo pliant à un prix raisonnable.');
INSERT INTO velo(idcompte, idtype, idgenre, marque, taille_roue, electrique,pliant, prix,neuf, quantite, titre, description) VALUES (17,7,1,'Focus',26,0,0,420,1,2,'Velo confortable','Bonjour, je vends mes 2 vélos Focus en très bonne état aux prix de 420 euros unitaire.');
INSERT INTO velo(idcompte, idtype, idgenre, marque, taille_roue, electrique,pliant, prix,neuf, quantite, titre, description) VALUES (18,4,1,'Trek',25,1,0,350,1,1,'Velo électrique','Bonjour, je vends mon vélo électrique.');