<?php
	$erreur='';
	if (isset($_REQUEST['submit']))
	{
		try
		{
			$req = $PDO_BDD->prepare("SELECT * from t_utilisateur_uti WHERE UTI_LOGIN = ? AND UTI_PASS = ?");
			$req->execute(array($_REQUEST['login'],hash('sha1',$_REQUEST['pass'])));
		}
		catch(Exception $e)
		{ 
			die('<div style="font-weight:bold; color:red>Erreur : ' . $e->getMessage() . '</div>');
		}
		if ($req->fetch(PDO::FETCH_OBJ)=='')
			$erreur.='Login ou mot de passe incorrect ! <br />'.hash('sha1',$_REQUEST['pass']);
		else 
		{		
			session_start();
			$_SESSION['pseudo'] = $_REQUEST['login'];
			if (!isset($_SESSION['count']))
				$_SESSION['count'] = 0;
			else
				$_SESSION['count']++;
			header('location: index.php?page=accueil');
		}
	}
	$data['erreur_connexion'] = $erreur;
?>