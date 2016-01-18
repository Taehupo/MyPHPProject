<nav>
 <a href="index.php?page=accueil"> Accueil</a>
 <a href="index.php?page=recette_liste" > Les Recettes</a>
 {if !isset($smarty.session.login)}
 	<a href="index.php?page=connexion" > Se Connecter</a>
 {else}
 	{include file='application/views/nav/nav_membre.inc.tpl'}
 {/if}
 {include file='application/views/nav/nav_admin.inc.tpl'}
</nav>