<?php
	$det_rct = $PDO_BDD->query("SELECT * FROM t_recette_rct NATURAL JOIN t_utilisateur_uti WHERE rct_id =".$_REQUEST['idr'])->fetchAll(PDO::FETCH_ASSOC);
	$data['det_rct'] = $det_rct;
	if(isset($_SESSION['login']))
	{
		$comments = $PDO_BDD->query("SELECT * FROM t_commentaire_com JOIN t_recette_rct ON t_commentaire_com.rct_id = t_recette_rct.rct_id JOIN t_utilisateur_uti ON t_commentaire_com.uti_id = t_utilisateur_uti.uti_id WHERE t_commentaire_com.rct_id =".$_REQUEST['idr'])->fetchAll(PDO::FETCH_ASSOC);
		$log = $PDO_BDD->query("SELECT * FROM t_utilisateur_uti WHERE uti_login = '".$_SESSION['login']."'")->fetch(PDO::FETCH_ASSOC);
		$try = $PDO_BDD->query("SELECT * FROM t_utilisateur_uti NATURAL JOIN t_recette_rct WHERE rct_id=".$_REQUEST['idr'])->fetch(PDO::FETCH_ASSOC);
		if($try['UTI_ID'] != $log['UTI_ID'])
			$data['can_com'] = "";
		if(isset($_REQUEST['poste']))
		{
			$PDO_BDD->query("INSERT INTO `t_commentaire_com` (`COM_TEXTE`, `COM_DATE`, `UTI_ID`, `RCT_ID`) VALUES ('".addslashes($_REQUEST['message'])."', '".date("Y-m-d H:i:s")."', ".$log['UTI_ID'].", ".$_REQUEST['idr'].")");
			header('Location:index.php?page=recette_detail&idr='.$_REQUEST['idr']);
		}
		if(isset($_REQUEST['supprime']))
		{
			$user = $PDO_BDD->query("SELECT * FROM t_commentaire_com NATURAL JOIN t_utilisateur_uti WHERE com_id = ".$_REQUEST['comid'])->fetch(PDO::FETCH_ASSOC);
			if($_SESSION['login'] == $user['UTI_LOGIN']) // Vérifie qu'on supprime bien un message appartenant à l'utilisateur connecté. (pour éviter de supprimer n'importe quoi si la valeur hidden du formulaire a été changée manuellement)
			$PDO_BDD->query("DELETE FROM `t_commentaire_com` WHERE COM_ID =".$_REQUEST['comid']);
			header('Location:index.php?page=recette_detail&idr='.$_REQUEST['idr']);
		}
	}
	else
	{
		$comments= array();
	}

	$data['comments'] = $comments

	
	//if(!empty($log))
?>