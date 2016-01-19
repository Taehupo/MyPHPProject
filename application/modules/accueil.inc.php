<?php
	$alea = [rand(0,100), rand(0,100), rand(0,100)];
	$data['alea']= $alea;
	$tab = $PDO_BDD->query("SELECT COUNT(*) AS \"Count\"FROM t_recette_rct")->fetchAll(PDO::FETCH_ASSOC);
	$rct1 = $PDO_BDD->query("SELECT * FROM t_recette_rct NATURAL JOIN tj_cat_rct NATURAL JOIN t_utilisateur_uti WHERE rct_id =".rand(1,$tab[0]['Count']))->fetch(PDO::FETCH_ASSOC);
	$rct2 = $PDO_BDD->query("SELECT * FROM t_recette_rct NATURAL JOIN tj_cat_rct NATURAL JOIN t_utilisateur_uti WHERE rct_id =".rand(1,$tab[0]['Count']))->fetch(PDO::FETCH_ASSOC);
	$rct3 = $PDO_BDD->query("SELECT * FROM t_recette_rct NATURAL JOIN tj_cat_rct NATURAL JOIN t_utilisateur_uti WHERE rct_id =".rand(1,$tab[0]['Count']))->fetch(PDO::FETCH_ASSOC);
	$rdm_rct = [$rct1, $rct2, $rct3];
	$data['rdm_rct'] = $rdm_rct;

?>