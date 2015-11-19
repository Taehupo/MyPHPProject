<!DOCTYPE html>
<html lang="fr">
	<head>
		<title>Site de recettes</title>
		<meta charset="utf-8"/>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
	</head>
	<main>
		<header>
			{include file='application/views/layout/layout_entete.inc.tpl'}
			{include file='application/views/nav/nav.inc.tpl'}
		</header>
		<body>
		{block name=page}
		{/block}
		</body>
		<footer>
			{include file='application/views/layout/layout_pied.inc.tpl'}
		</footer>
	</main>
</html>