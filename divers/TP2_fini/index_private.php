<?php
	session_start();
	if (!isset($_SESSION['pseudo']))
		header('location: authent.php');
	include('configBDD.inc.php');
	try
	{
		$req = $PDO_BDD->prepare("SELECT * from t_utilisateur_uti WHERE UTI_LOGIN = ?");
		$req->execute(array($_SESSION['pseudo']));
	}
	catch(Exception $e)
	{ 
		die('<div style="font-weight:bold; color:red>Erreur : ' . $e->getMessage() . '</div>');
	}
	$sTab = $req->fetchAll(PDO::FETCH_ASSOC);
	$titre = $sTab[0]['UTI_NOM'].' '.$sTab[0]['UTI_PRENOM'];
	$login = $sTab[0]['UTI_LOGIN'];
	$mail = $sTab[0]['UTI_MAIL'];
	$tel = $sTab[0]['UTI_TEL'];
	$slogin = $_SESSION['pseudo'];

?>

<!DOCTYPE html>
<html>
	<head>
		<title>Espace Membre</title>
		<meta charset="utf-8" />
	</head>
	<body>
		<?php echo '<h1>'.$titre.'</h1>';?>
		<p>
			<i>
			<?php
				echo 'Login : ' . $login . '<br />';
				echo 'Mail : ' . $mail . '<br />';
				echo 'Téléphone : ' . $tel . '<br />';
				echo 'Login : ' . $slogin . '<br />';
			?>
			</i>
		</p>
	</body>
</html>