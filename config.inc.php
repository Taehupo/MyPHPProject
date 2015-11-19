<?php
$_PAGES=[''=>'accueil.inc','accueil'=>'accueil.inc','connexion'=>'connexion.inc','profil'=>'profil.inc','recette_detail'=>'recette_detail.inc','recette_liste'=>'recette_liste.inc', 'inscription'=>'inscription.inc.php'];
define('HOME_PAGE',$_PAGES[''], true);
define('ERROR_404',$_PAGES[''], true);

define('DB_HOST', 'localhost');
	define('DB_DATABASE','acces');
	define('DB_USERNAME','u_acces');
	define('DB_PASSWORD','SJzEeqLb2HHeNYVV');
	try
	{
		$PDO_BDD = new PDO('mysql:host='.DB_HOST.';dbname='.DB_DATABASE, DB_USERNAME, DB_PASSWORD);
		$PDO_BDD->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$PDO_BDD->exec("SET NAMES 'utf8'");
	}
	catch(Exception $e)
	{
		echo 'Erreur : ' . $e->getMessage() . '<br />';
		echo 'N° : ' . $e->getCode();
		exit();
	}

?>