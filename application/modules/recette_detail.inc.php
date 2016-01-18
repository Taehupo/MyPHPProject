<?php
	$det_rct = $PDO_BDD->query("SELECT * FROM t_recette_rct NATURAL JOIN t_utilisateur_uti WHERE rct_id =".$_REQUEST['idr'])->fetchAll(PDO::FETCH_ASSOC);
	$data['det_rct'] = $det_rct;
?>