<?php
	if(isset($_REQUEST['idc']))
	{
		$tab_rct = $PDO_BDD->query("SELECT * FROM t_recette_rct NATURAL JOIN tj_cat_rct WHERE cat_id = $_REQUEST['idc']")->fetchAll(PDO::FETCH_ASSOC);
		$data['tab_rct'] = $tab_rct;
	}
	else
	{
		$tab_cat = $PDO_BDD->query("SELECT * FROM t_categorie_cat")->fetchAll(PDO::FETCH_ASSOC);
		$data['tab_cat'] = $tab_cat;
	}
?>