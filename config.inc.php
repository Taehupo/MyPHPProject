<?php
$_PAGES=[''=>'accueil.inc','accueil'=>'accueil.inc','connexion'=>'connexion.inc','profil'=>'profil.inc','recette_detail'=>'recette_detail.inc','recette_liste'=>'recette_liste.inc'];
define('HOME_PAGE',$_PAGES[''], true);
define('ERROR_404',$_PAGES[''], true);

if (mysql_connect("localhost", "u_recette" , "SJzEeqLb2HHeNYVV"))
{
	if (mysql_select_db('recette')) 
	{
		//DEBUG echo "Connexion réussie";
		/*Du code ici ? maybe...*/
	}
	else
	{
		die('Connexion échouée à la BDD : '. mysql_error());
	}
}
else
{
	die('Connexion au serveur de BDD échouée : '.mysql_error());
}


?>