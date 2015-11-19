<?php
	$erreur = '';
	if (isset($_REQUEST['valid']))
	{
		include('configBDD.inc.php');
		if ($_REQUEST['pass']!=$_REQUEST['conf'])
			$erreur.='Les mots de passe ne sont pas identiques ! <br />';
		try
		{
			$req = $PDO_BDD->prepare("SELECT * from t_utilisateur_uti WHERE UTI_LOGIN = ?");
			$req->execute(array($_REQUEST['login']));
		}
		catch(Exception $e)
		{ 
			die('<div style="font-weight:bold; color:red>Erreur : ' . $e->getMessage() . '</div>');
		}

		if ($req->fetch(PDO::FETCH_OBJ)!='')
			$erreur.='Le login existe déjà ! <br />';

		if ($erreur=='')
		{
			try
			{
				$sha2pass = hash('sha1',$_REQUEST['pass']);
				$req = $PDO_BDD->prepare("INSERT INTO t_utilisateur_uti VALUES(?,?,?,?,?,?,DEFAULT)");
				$req->execute(array($_REQUEST['login'],$sha2pass,$_REQUEST['mail'],$_REQUEST['telnum'],$_REQUEST['nom'],$_REQUEST['prenom']));
			}
			catch(Exception $e)
			{ 
				die('<div style="font-weight:bold; color:red>Erreur : ' . $e->getMessage() . '</div>');
			}
			header('Location: ');
		}
	}
?>

<!DOCTYPE html>
<html>
	<head>
		<title>Inscription</title>
		<meta charset="utf-8" />
	</head>
	<body>
		<h1>Inscription</h1>
		<form action="" method="POST">
		<p>
			<?php echo '<div style="color:red">' . $erreur . '</div>'; ?>
			*login:<br /><input type="text" name="login" required/><br /><br />
			*nom:<br /><input type="text" name="nom" required/><br /><br />
			*prenom:<br /><input type="text" name="prenom" required/><br /><br />
			*mail:<br /><input type="email" name="mail" required/><br /><br />
			*mot de passe:<br /><input type="password" name="pass" required/><br /><br />
			*confirmation:<br /><input type="password" name="conf" required/><br /><br />
			téléphone:<br /><input type="tel" name="telnum" pattern="^((\+\d{1,3}(-| )?\(?\d\)?(-| )?\d{1,5})|(\(?\d{2,6}\)?))(-| )?(\d{3,4})(-| )?(\d{4})(( x| ext)\d{1,5}){0,1}$"/><br /><br />
			<input type="submit" name="valid" value="Valider" />
			<input type="reset" name="reset" value="Reset" /><br /><br />
			<i>*champ obligatoire</i>
		</p>
		</form>
	</body>
</html>