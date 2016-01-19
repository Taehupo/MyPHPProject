<!DOCTYPE html>
<html lang="fr">
	<head>
		<title>Site de recettes</title>
		<meta charset="utf-8"/>
		<link href="asset/css/style.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div id="wrapper">
			<header>
				{include file='application/views/layout/layout_entete.inc.tpl'}
				{include file='application/views/nav/nav.inc.tpl'}
			</header>
			<main>
			{block name=page}
			{/block}
			</main>
			<footer>
				{include file='application/views/layout/layout_pied.inc.tpl'}
			</footer>
		</div>
	</body>
</html>