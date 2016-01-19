<?php
	if(!isset($_SESSION['login']))
		header('Location: index.php?page=accueil');
	$profil = $PDO_BDD->query("SELECT * FROM t_utilisateur_uti WHERE uti_login = '".$_SESSION['login']."'")->fetchAll(PDO::FETCH_ASSOC);
	$data['profil'] = $profil;
?>