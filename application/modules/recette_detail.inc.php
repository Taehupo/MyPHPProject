<?php
	$det_rct = $PDO_BDD->query("SELECT * FROM t_recette_rct NATURAL JOIN t_utilisateur_uti WHERE rct_id =".$_REQUEST['idr'])->fetchAll(PDO::FETCH_ASSOC);
	$data['det_rct'] = $det_rct;
	if(isset($_SESSION['login']))
		$comments = $PDO_BDD->query("SELECT * FROM t_commentaire_com JOIN t_recette_rct ON t_commentaire_com.rct_id = t_recette_rct.rct_id JOIN t_utilisateur_uti ON t_commentaire_com.uti_id = t_utilisateur_uti.uti_id WHERE t_commentaire_com.rct_id =".$_REQUEST['idr'])->fetchAll(PDO::FETCH_ASSOC);
	else
		$comments= array();
	$data['comments'] = $comments

	//A utiliser plus tard
	//$log = $PDO_BDD->query("SELECT * FROM t_utilisateur_uti WHERE uti_login = '".$_SESSION['login']."'")->fetchAll(PDO::FETCH_ASSOC);
	//if(!empty($log))
?>