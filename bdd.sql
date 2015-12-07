
CREATE DATABASE `recette` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
use `recette`;

CREATE USER 'u_recette'@'localhost' IDENTIFIED BY 'SJzEeqLb2HHeNYVV';
GRANT USAGE ON * . * TO 'u_recette'@'localhost' IDENTIFIED BY 'SJzEeqLb2HHeNYVV' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0 ;
GRANT ALL PRIVILEGES ON `recette` . * TO 'u_recette'@'localhost';

-- Table des utilisateurs
-- DROP TABLE IF EXISTS `T_UTILISATEUR_UTI`;

CREATE TABLE IF NOT EXISTS `t_utilisateur_uti` (
  `UTI_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `UTI_LOGIN` varchar(255) NOT NULL,
  `UTI_MAIL` varchar(255) NOT NULL,
  `UTI_NOM` varchar(255) NOT NULL,
  `UTI_PRENOM` varchar(255) NOT NULL,
  `UTI_PASS` varchar(40) NOT NULL,
  `UTI_ADMIN` tinyint(1) NOT NULL DEFAULT '0',
  `UTI_AVATAR` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`UTI_ID`),
  UNIQUE KEY `UTI_LOGIN` (`UTI_LOGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- Table des unités
-- DROP TABLE IF EXISTS T_UNITE_UNI;
CREATE TABLE  T_UNITE_UNI (
  UNI_LABEL varchar(30) NOT NULL,
  UNI_SHORT_LABEL varchar(15) NOT NULL,
  UNI_DESCRIPTION mediumtext NOT NULL,
  UNI_VALIDE bool NOT NULL DEFAULT 0,
  UTI_ID  bigint(20) unsigned NOT NULL,
  KEY (UTI_ID),
  PRIMARY KEY (UNI_LABEL)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


-- Table des recettes
-- DROP TABLE IF EXISTS T_RECETTE_RCT;
CREATE TABLE   T_RECETTE_RCT (
  RCT_ID  bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  RCT_DATE timestamp NOT NULL DEFAULT NOW(), 
  RCT_TITRE varchar(80) NOT NULL,
  RCT_DESCRIPTION longtext NOT NULL,
  RCT_TEMPS_PREPARATION time NOT NULL,
  RCT_TEMPS_CUISSON time NULL DEFAULT '00:00:00',
  RCT_TEMPS_REPOS time  NULL DEFAULT '00:00:00',
  RCT_DIFFICULTE ENUM("facile","moyen","difficile") NOT NULL DEFAULT 'facile',
  RCT_COUT ENUM("faible","moyen","eleve") NOT NULL DEFAULT 'faible',
  RCT_STATUT ENUM("brouillon","soumise","finale") NOT NULL DEFAULT 'brouillon',
  RCT_ILLUSTRATION varchar(80) NOT NULL,    
  UTI_ID bigint(20) unsigned NOT NULL,
  RCT_NBPERSONNE int NOT NULL,
  PRIMARY KEY (RCT_ID),
  KEY (UTI_ID) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


 
-- Table des catégories
-- DROP TABLE IF EXISTS T_CATEGORIE_CAT;
CREATE TABLE  T_CATEGORIE_CAT (
  CAT_ID bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  CAT_LABEL varchar(255) NOT NULL,
  CAT_DESCRIPTION mediumtext NOT NULL,
  CAT_ILLUSTRATION varchar(80) NOT NULL,  
  PRIMARY KEY (CAT_ID)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


-- Table d'association entre recettes et  catégories
-- DROP TABLE IF EXISTS TJ_CAT_RCT;
CREATE TABLE  TJ_CAT_RCT (
  CAT_ID bigint(20) unsigned NOT NULL,
  RCT_ID bigint(20) unsigned NOT NULL,  
  PRIMARY KEY (CAT_ID, RCT_ID),
  KEY (CAT_ID),
  KEY (RCT_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

-- Table des ingrédients
-- DROP TABLE IF EXISTS T_INGREDIENT_IGD;
CREATE TABLE  T_INGREDIENT_IGD (
  IGD_LABEL varchar(255) NOT NULL,
  IGD_DESCRIPTION mediumtext NOT NULL,
  IGD_ILLUSTRATION varchar(80) NULL DEFAULT NULL,
  IGD_VALIDE bool NOT NULL DEFAULT 0,
  UTI_ID bigint(20) unsigned NULL DEFAULT NULL,
  PRIMARY KEY (IGD_LABEL),
  KEY (IGD_LABEL)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;



-- Table d'association (composer)des recettes, ingédients et unités
-- DROP TABLE IF EXISTS TJ_IGD_RCT_UNI;
CREATE TABLE  TJ_IGD_RCT_UNI (
  RCT_ID bigint(20) unsigned NOT NULL,
  IGD_LABEL varchar(255)  NOT NULL,
  UNI_LABEL varchar(30) NOT NULL,
  IGD_RCT_UNI_QUANTITE int(11) NOT NULL,      
  PRIMARY KEY (RCT_ID, IGD_LABEL, UNI_LABEL)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


 
-- Table de commentaires
-- DROP TABLE IF EXISTS T_COMMENTAIRE_COM;
CREATE TABLE  T_COMMENTAIRE_COM (
  COM_ID bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  COM_TEXTE mediumtext NOT NULL,
  COM_DATE timestamp NOT NULL DEFAULT NOW(), 
  UTI_ID bigint(20) unsigned NULL,
  RCT_ID bigint(20) unsigned NOT NULL,
  PRIMARY KEY (COM_ID),
  KEY (RCT_ID),
  KEY (UTI_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

    
-- création des clés étrangéres
                                
ALTER TABLE TJ_CAT_RCT
 ADD CONSTRAINT C_FK_CAT_CAT_RCT FOREIGN KEY (CAT_ID) REFERENCES T_CATEGORIE_CAT (CAT_ID) ,
 ADD CONSTRAINT C_FK_RCT_CAT_RCT FOREIGN KEY (RCT_ID) REFERENCES T_RECETTE_RCT (RCT_ID) ;
 
ALTER TABLE  T_UNITE_UNI        
     ADD CONSTRAINT C_FK_UNI_UTI FOREIGN KEY (UTI_ID) REFERENCES T_UTILISATEUR_UTI (UTI_ID) ;
    
ALTER TABLE T_COMMENTAIRE_COM
 ADD CONSTRAINT C_FK_UTI_COM FOREIGN KEY (UTI_ID) REFERENCES T_UTILISATEUR_UTI (UTI_ID) ,
 ADD CONSTRAINT C_FK_RCT_COM FOREIGN KEY (RCT_ID) REFERENCES T_RECETTE_RCT (RCT_ID) ;

ALTER TABLE TJ_IGD_RCT_UNI
 ADD CONSTRAINT C_FK_RCT_IGD_RCT_UNI FOREIGN KEY (RCT_ID) REFERENCES T_RECETTE_RCT (RCT_ID) ,
 ADD CONSTRAINT C_FK_IGD_IGD_RCT_UNI FOREIGN KEY (IGD_LABEL) REFERENCES T_INGREDIENT_IGD(IGD_LABEL), 
 ADD CONSTRAINT C_FK_UNI_IGD_RCT_UNI FOREIGN KEY (UNI_LABEL) REFERENCES T_UNITE_UNI (UNI_LABEL) ;

ALTER TABLE T_INGREDIENT_IGD
 ADD CONSTRAINT C_FK_UTI_IGD FOREIGN KEY (UTI_ID) REFERENCES T_UTILISATEUR_UTI (UTI_ID) ;

ALTER TABLE T_RECETTE_RCT
 ADD CONSTRAINT C_FK_UTI_RCT FOREIGN KEY (UTI_ID) REFERENCES T_UTILISATEUR_UTI (UTI_ID) ;
  

  INSERT INTO `t_categorie_cat` (`CAT_ID`, `CAT_LABEL`, `CAT_DESCRIPTION`, `CAT_ILLUSTRATION`) VALUES
(1, 'Entree', 'Déliceuse entrée POUR BOUFFER VOTRE MERE EN SAUCE !', '/hamburger_m.jpg'),
(2, 'Plat', 'Délicieux plats POUR ALLER FARCIR VOTRE GRAND-MÈRE AVEC !', '/hamburger_m1.jpg'),
(3, 'Dessert', 'Délicieux desserts POUR FOURRER VOTRE PETITE COUSINE !', '/hamburger_m2.jpg');


INSERT INTO t_utilisateur_uti (`UTI_ID`, `UTI_LOGIN`, `UTI_MAIL`, `UTI_NOM`,`UTI_PRENOM`, `UTI_PASS`, `UTI_ADMIN`, `UTI_AVATAR`) VALUES
(1,'Taehupo', 'uzumakigip@gmail.com', 'Aubert','Gabriel', 'tamer', 1, 'vide'),
(2,'Panda', 'Panda@gmail.com', 'Panda','Pandisson', 'tamer', 0, 'vide'),
(3,'seb', 'seb@gmail.com', 'sebus','monsieurtus', 'tamer', 1, 'vide');

INSERT INTO `t_recette_rct` (`RCT_ID`, `RCT_DATE`, `RCT_TITRE`, `RCT_DESCRIPTION`, `RCT_TEMPS_PREPARATION`, `RCT_TEMPS_CUISSON`, `RCT_TEMPS_REPOS`, `RCT_DIFFICULTE`, `RCT_COUT`, `RCT_STATUT`, `RCT_ILLUSTRATION`, `UTI_ID`, `RCT_NBPERSONNE`) VALUES
(1, 0x323031352d31322d30312031303a32353a3532, 'Oeuf au plat', 'Comment faire ce plat exquis et raffiné qu''est l''oeuf au plat? Je vais vous expliquer cet art dans cette recette. Tout d''abord, vous avez besoin d''un oeuf, et d''un plat.Mettez l''oeuf dans le plat, et faites chauffer 3 min.Rajoutez des epices tel que du persilMangez.Bravo, vous êtes un cuisinier confirmé!', 0x30303a30343a3030, 0x30303a30333a3030, 0x30303a30303a3030, 'facile', 'faible', 'finale', 'oeuf_au_plat.jpg', 3, 1),
(2, 0x323031352d31322d30312031303a33323a3537, 'Pâtes à l''eau', 'Comment faire ce plat exquis et raffiné que sont les pâtes à l''eau? Je vais vous expliquer cet art dans cette recette.\r\n\r\nTout d''abord, vous avez besoin de pâtes, et d''eau. \r\nMettez les pâtes dans l''eau, et faites chauffer 3 min. \r\nRajoutez des ingrédients tels que le sel (mais pas trop, pour ne pas enlever le goût de l''eau)\r\nMangez.\r\nBravo, vous êtes un cuisinier confirmé!', 0x30303a30303a3031, 0x30303a30333a3030, 0x30303a30303a3030, 'difficile', 'faible', 'finale', 'pates_a_l_eau.jpg', 3, 1),
(3, 0x323031352d31322d30312031303a35323a3331, 'Salade de pousse de bambou et d''avocat sur son lit de pommes.', '\r\nLe bambou est la nourriture préférée des pandas. Il peut se consommer tel quel, mais on peut le braiser ou le faire revenir en accompagnement de viande (mais seulement la pousse pour vous les humains).\r\n\r\nAujourd''hui, je cuisine la salade de bambou, avocats et pommes.\r\n\r\nLes ingrédients pour cette recette:\r\n\r\n-pousses de bambou\r\n-avocats\r\n-pommes\r\n-crème fraîche\r\n-citron\r\n-moutarde, huile d''olive, curry\r\n-persil, ciboulette\r\n-amour\r\n\r\nÉgouttez et rincez les pousses de bambou.\r\nPelez les avocats et les pommes et coupez-les en lamelles ou en petits dés.\r\n\r\nHachez les herbes.\r\nPréparez la vinaigrette avec  la crème, la moutarde, le citron, l''huile d''olive et le curry.\r\n\r\nServez la salade bien fraîche, parsemée d''amour et des herbes finement ciselées.\r\n\r\nBon appétit!\r\n', 0x32333a30303a3030, 0x30303a30303a3030, 0x30303a30303a3030, 'facile', 'eleve', 'finale', 'salade_pousses_de_bambou.jpg', 2, 1),
(4, 0x323031352d31322d30312031303a35323a3331, 'Brick au poulet et citron confit', 'Ingrédients\r\n3 filets de volaille sans peau\r\n¼ botte de coriandre\r\n1 citron confit\r\n1 c à c de 5 épices\r\n1 c à c de cumin\r\n0,5 cl d''huile d''olive\r\n1 paquet de feuille de brick\r\n\r\nPréparation\r\nÉtape 1\r\nCouper le poulet en très petits morceaux. Enlever la pulpe du citron confit et couper l''écorce en petits morceaux, les ajouter au poulet. Hacher la coriandre et l''ajouter au poulet. Ajouter les épices et l''huile d''olive et bien mélanger le tout.\r\n\r\n\r\nÉtape 2\r\nCouper les feuilles de brick en bandes. Disposer un peu de farce sur le bord de chaque bande et plier en forme de triangle.\r\n\r\nCuire les bricks au four ou dans une poêle 2 à 3 minutes de chaque côté.', 0x30303a31303a3030, 0x30303a30363a3030, 0x30303a30313a3030, 'difficile', 'moyen', 'finale', 'brick_au_poulet.jpg', 2, 2);
(5, 0x323031352d31322d30372030373a34303a3431, 'Éclats de caramel aux cacahuètes', 'Ingrédients / pour 6 personnes\r\n\r\nPrendre une tasse à thé (mug) pour doser\r\n2 tasses de sucre roux ou cassonade\r\n2 tasses de sirop de glucose (ou miel liquide)\r\n1/2 tasse d''eau\r\n4 sachets de sucre vanillé\r\n1 bol de cacahuètes grillées non salées\r\nbeurre doux pour le moule\r\nMatériel : un thermomètre de cuisson ou pèse-sirop,\r\nun moule rectangulaire de 30x25 cm ou lèche-frites.\r\n\r\nÉclats de caramel aux cacahuètes : Etape 1 Si vous avez choisi des cacahuètes en coques comme moi, les écaler avant de commencer la cuisson du sirop. Beurrer votre moule ou plaque grassement à l''aide d''un pinceau à pâtisserie.\r\nMettre dans une casserole à fond épais, le sucre roux ou cassonade, le sirop de glucose (on en trouve au rayon fruits secs des GMS) et l''eau. Mélanger et faire chauffer ce sirop jusqu''au "grand cassé" soit 145°c.\r\nRetirer du feu. Ajouter le sucre vanillé et les cacahuètes. Prolonger la cuisson de 2 ou 3 minutes. Verser le caramel chaud dans le moule et laisser durcir à température ambiante, 1 heure environ.\r\nDès que le caramel est dur mais encore tiède, démouler la plaque en retournant le moule au-dessus d''une large feuille de papier sulfurisé. Le recouvrir d''une seconde feuille de papier sulfurisé et taper sur la plaque de caramel afin d''obtenir de grosses brisures de caramel aux cacahuètes.', 0x30303a32303a3030, 0x30303a32353a3030, 0x30313a30303a3030, 'facile', 'moyen', 'finale', 'eclats-de-caramel-aux-cacahuetes.jpg', 1, 6),
(6, 0x323031352d31322d30372030373a34303a3431, 'Hasselback potatoes', 'Ingredients\r\n\r\n6 Patates moyennes\r\n2 - 3 Gousses d''ail émincées\r\n2 cuillères d''huile d''olive\r\n30 g de beurre\r\nSel\r\nPoivre noir fraîchement moulu\r\n\r\nPréchauffer le four à 220 ° C (425F). Mettez les pommes de terre sur une planche à découper, côté plat vers le bas. Démarrer à partir d''une extrémité de la pomme de terre, couper presque tout le long, à environ 3 à 4 mm d''intervalle.\r\n\r\nDisposer les pommes de terre dans une plaque de cuisson et d''insérer l''ail dans entre les fentes. Disperser un peu de beurre sur le dessus de chaque pomme de terre. Puis arroser d''huile d''olive et saupoudrer un peu de sel de mer et de poivre noir.\r\n\r\nCuire les pommes de terre pendant environ 40 minutes ou jusqu''à ce que les pommes de terre deviennent croustillantes et la chair douce.', 0x30303a31353a3030, 0x30303a34303a3030, 0x30303a30353a3030, 'facile', 'faible', 'finale', 'patate.jpg', 1, 3);

INSERT INTO `tj_cat_rct` (`CAT_ID`, `RCT_ID`) VALUES
(1, 3),
(2, 1),
(2, 2),
(2, 4);
(2, 6),
(3, 5);
