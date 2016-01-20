<?php
	if(!isset($_SESSION['login']))
		header('Location: index.php?page=accueil');
	$profil = $PDO_BDD->query("SELECT * FROM t_utilisateur_uti WHERE uti_login = '".$_SESSION['login']."'")->fetchAll(PDO::FETCH_ASSOC);
	$data['profil'] = $profil;
	$user_rct = $PDO_BDD->query("SELECT * FROM t_recette_rct r JOIN tj_cat_rct tj ON r.rct_id = tj.rct_id JOIN t_categorie_cat c ON tj.cat_id = c.cat_id JOIN t_utilisateur_uti u ON r.uti_id = u.uti_id WHERE uti_login = '".$_SESSION['login']."'")->fetchAll(PDO::FETCH_ASSOC);
	$data['user_rct'] = $user_rct;
?>