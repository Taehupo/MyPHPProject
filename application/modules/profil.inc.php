<?php

	function convertToHoursMins($time, $format = '%02d:%02d:%02d') 
	{
	    if ($time < 1) 
	    {
	        return date('H:i:s',mktime(00,00,00));
	    }
	    $hours = floor($time / 60);
	    $minutes = ($time % 60);
	    return date("H:i:s",mktime($hours, $minutes, 00));
	}
?>
<?php
	function verifyImageFile($image)
	{
		chmod($image['tmp_name'], 0644);
		$tmp = getimagesize($image["tmp_name"]);
		if (!empty($tmp))
		{
			return null;
		}
		else
			return 'Le format d\'image est incorrect.';
	}
?>
<?php


	if(!isset($_SESSION['login']))
		header('Location: index.php?page=connexion');
	$profil = $PDO_BDD->query("SELECT * FROM t_utilisateur_uti WHERE uti_login = '".$_SESSION['login']."'")->fetchAll(PDO::FETCH_ASSOC);
	$user_rct = $PDO_BDD->query("SELECT * FROM t_recette_rct r JOIN tj_cat_rct tj ON r.rct_id = tj.rct_id JOIN t_categorie_cat c ON tj.cat_id = c.cat_id JOIN t_utilisateur_uti u ON r.uti_id = u.uti_id WHERE uti_login = '".$_SESSION['login']."'")->fetchAll(PDO::FETCH_ASSOC);
	$data['erreur'] = '';
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
	if(isset($_REQUEST['ajouter']))
		$data['affiche_form'] = "";
	if(isset($_REQUEST['envoyer']))
	{
			$data['erreur'] = '';
			if ($_FILES['image_recette']['error'] == 0)
				$data['erreur'] .= verifyImageFile($_FILES['image_recette']);

			if ($_FILES['image_recette']['error'] == 0 && empty($data['erreur']))
			{
				$filename =  time() . '.png';
				move_uploaded_file($_FILES['image_recette']['tmp_name'], 'media/' . $_SESSION['login'] . '/' . $filename);
				$categorie = $PDO_BDD->query("SELECT * FROM t_categorie_cat WHERE cat_label = '".$_REQUEST['cat_recette']."'")->fetch(PDO::FETCH_ASSOC);
				$tst = $PDO_BDD->prepare("INSERT INTO t_recette_rct (`RCT_DATE`, `RCT_TITRE`, `RCT_DESCRIPTION`, `RCT_RECETTE`, `RCT_TEMPS_PREPARATION`, `RCT_TEMPS_CUISSON`, `RCT_TEMPS_REPOS`, `RCT_DIFFICULTE`, `RCT_COUT`, `RCT_STATUT`, `RCT_ILLUSTRATION`, `UTI_ID`, `RCT_NBPERSONNE`)
				 VALUES (CURRENT_TIMESTAMP, '".$_REQUEST['nom_recette']."', '".addslashes($_REQUEST['desc_mini'])."', '".addslashes($_REQUEST['texte_recette'])."', '".convertToHoursMins($_REQUEST['temps_prepa'])."', '".$_REQUEST['temps_cuisson']."', '".$_REQUEST['temps_repos']."', '".$_REQUEST['difficultee']."', '".$_REQUEST['cout']."', 'finale', '".$filename."', ".$profil[0]['UTI_ID'].", ".$_REQUEST['nb_pers'].")");
				$tst->execute();
				$PDO_BDD->query("INSERT INTO tj_cat_rct (`rct_id`, `cat_id`) VALUES (".$PDO_BDD->lastInsertId().",".$categorie['CAT_ID'].")");
				header('Location: index.php?page=profil');
			}

			else
				$data['erreur'] .= 'Problème de lecture : ' . $_FILES['image_recette']['error'];		
	}


	$data['profil'] = $profil;
	$data['user_rct'] = $user_rct;
?>