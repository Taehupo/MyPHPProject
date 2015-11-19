<?php
	$erreur='';
	if (isset($_REQUEST['connect']))
	{
		include('configBDD.inc.php');
		try
		{
			$req = $PDO_BDD->prepare("SELECT * from t_utilisateur_uti WHERE UTI_LOGIN = ? AND UTI_PWD = ?");
			$req->execute(array($_REQUEST['login'],hash('sha1',$_REQUEST['pass'])));
		}
		catch(Exception $e)
		{ 
			die('<div style="font-weight:bold; color:red>Erreur : ' . $e->getMessage() . '</div>');
		}
		if ($req->fetch(PDO::FETCH_OBJ)=='')
			$erreur.='Login ou mot de passe incorrect ! <br />';
		else 
		{		
			session_start();
			$_SESSION['pseudo'] = $_REQUEST['login'];
			if (!isset($_SESSION['count']))
				$_SESSION['count'] = 0;
			else
				$_SESSION['count']++;
			header('location: index_private.php');
		}
	}
?>

<!DOCTYPE html>
<html>
	<head>
		<title>Connexion</title>
		<meta charset="utf-8" />
	</head>
	<body>
		<h1>Connexion</h1>
		<form action="" method="POST">
		<p>
			<?php echo '<div style="color:red">' . $erreur . '</div>'; ?>
			Login :<br /><input type="text" name="login" required/><br /><br />
			Mot de passe :<br /><input type="password" name="pass" required/><br /><br />
			<input type="submit" name="connect" value="Connexion" /><br /><br />
			<a href="inscription.php">Pas encore inscrit ?</a>
		</p>
		</form>
	</body>
</html>