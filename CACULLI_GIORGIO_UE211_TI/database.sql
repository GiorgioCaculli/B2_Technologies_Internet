DROP DATABASE IF EXISTS CaculliGiorgioJuin2021;

CREATE DATABASE IF NOT EXISTS CaculliGiorgioJuin2021;

USE CaculliGiorgioJuin2021;

DROP USER IF EXISTS 'la196672'@'localhost';

CREATE USER IF NOT EXISTS 'la196672'@'localhost' IDENTIFIED BY 'mdpLA196672';

GRANT ALL ON CaculliGiorgioJuin2021.* TO 'la196672'@'localhost';

DROP TABLE IF EXISTS panneau;
CREATE TABLE IF NOT EXISTS panneau (
    id_panneau INT AUTO_INCREMENT,
    texte_panneau VARCHAR(100) UNIQUE NOT NULL,
    photo_panneau VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_panneau, texte_panneau)
);

DROP TABLE IF EXISTS question;
CREATE TABLE IF NOT EXISTS question (
    id_question INT PRIMARY KEY AUTO_INCREMENT,
    texte_question VARCHAR(100) NOT NULL,
    id_panneau INT,
    texte_reponse_1 VARCHAR(100) NOT NULL,
    texte_reponse_2 VARCHAR(100) NOT NULL,
    texte_reponse_3 VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_panneau) REFERENCES panneau(id_panneau)
);