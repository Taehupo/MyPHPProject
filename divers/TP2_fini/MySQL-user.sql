CREATE DATABASE `acces` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
use `acces`;

CREATE USER 'u_acces'@'localhost' IDENTIFIED BY 'SJzEeqLb2HHeNYVV';
GRANT USAGE ON * . * TO 'u_acces'@'localhost' IDENTIFIED BY 'SJzEeqLb2HHeNYVV' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0 ;
GRANT ALL PRIVILEGES ON `acces` . * TO 'u_acces'@'localhost';
-- 
-- --------------------------------------------------------

-- 
-- Structure de la table 'T_UTILISATEUR_UTI'
-- 
-- Table des utilisateurs

CREATE TABLE IF NOT EXISTS `T_UTILISATEUR_UTI` (
  UTI_LOGIN varchar(255)  PRIMARY KEY ,
  UTI_PWD  varchar(255) NOT NULL,
  UTI_MAIL varchar(255) NOT NULL,
  UTI_TEL varchar(20) default NULL,
  UTI_NOM varchar(255) NOT NULL,
  UTI_PRENOM varchar(255) NOT NULL,
  UTI_ADMIN bool NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


insert into  T_UTILISATEUR_UTI  values('test_user',sha1('pwdtest'),'test_user@gmail.fr',default,'Carmi','Laurent',default)