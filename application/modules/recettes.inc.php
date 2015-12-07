<?php
	$tab_cat = $PDO_BDD->query("SELECT * FROM t_categorie_cat")->fetchAll(PDO::FETCH_ASSOC);
	$data['tab_cat'] = $tab_cat;
?>