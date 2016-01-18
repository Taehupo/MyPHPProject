{extends file="../layout.tpl"}
{block name=page}
<section>
	<form action="index.php?page=connexion" method="post">
		<div style="color:red"> {$data['erreur_connexion']} </div>
		<label>Login:<br/></label>
		<input type="text" name ="login" required/><br/>
		<label>Mot de passe:<br/></label>
		<input type="password" name ="pass" required/><br/><br/>
		<input type="submit" name="submit" value="Se connecter"/>
	</form>
</section>
{/block}