<?php
	if(!isset($_SESSION['login']))
		header('Location: index.php?page=accueil');
	$profil = $PDO_BDD->query("SELECT * FROM t_utilisateur_uti WHERE uti_login = '".$_SESSION['login']."'")->fetchAll(PDO::FETCH_ASSOC);
	$user_rct = $PDO_BDD->query("SELECT * FROM t_recette_rct r JOIN tj_cat_rct tj ON r.rct_id = tj.rct_id JOIN t_categorie_cat c ON tj.cat_id = c.cat_id JOIN t_utilisateur_uti u ON r.uti_id = u.uti_id WHERE uti_login = '".$_SESSION['login']."'")->fetchAll(PDO::FETCH_ASSOC);
	
	if(isset($_REQUEST['modifier']))
	{

	}
	if(isset($_REQUEST['supprimer']))
	{
		$user = $PDO_BDD->query("SELECT * FROM t_recette_rct NATURAL JOIN t_utilisateur_uti WHERE rct_id = ".$_REQUEST['rctid'])->fetch(PDO::FETCH_ASSOC);
		if($_SESSION['login'] == $user['UTI_LOGIN'])
		{
			$PDO_BDD->query("DELETE FROM `t_commentaire_com` WHERE rct_id=".$_REQUEST['rctid']);
			$PDO_BDD->query("DELETE FROM `tj_cat_rct` WHERE rct_id=".$_REQUEST['rctid']);
			$PDO_BDD->query("DELETE FROM `t_recette_rct` WHERE rct_id=".$_REQUEST['rctid']);
		}
		header('Location: index.php?page=profil');
	}

	$data['profil'] = $profil;
	$data['user_rct'] = $user_rct;
?>