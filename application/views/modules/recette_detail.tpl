{extends file="../layout.tpl"}
{block name=page}
<section>
{if $data['det_rct']}
	{foreach from=$data['det_rct'] item=recette}
		<h2>{$recette['RCT_TITRE']}</h2>
		<article>
			<h3>Informations</h3>
			<ul>
				<li>Préparation: {$recette['RCT_TEMPS_PREPARATION']}</li>
				<li>Cuisson: {$recette['RCT_TEMPS_CUISSON']}</li>
				<li>Repos: {$recette['RCT_TEMPS_REPOS']}</li>
				<li>Coût: {$recette['RCT_COUT']}</li>
				<li>Difficulté: {$recette['RCT_DIFFICULTE']}</li>
				<li>Nombre de personnes: {$recette['RCT_NBPERSONNE']}</li>
			</ul>
			<div class="img">
				<img src="media/{$recette['UTI_LOGIN']}/{$recette['RCT_ILLUSTRATION']}" alt="categorie {$recette['RCT_TITRE']}" id="det_img"></img>
			</div>
			<p>{$recette['RCT_DESCRIPTION']}</p>
		</article>
		<article>
			<h3>Recette</h3>
			<div>
				{$recette['RCT_RECETTE']}
			</div>
		</article>
		<i>Recette postée par {$recette['UTI_LOGIN']}, le {$recette['RCT_DATE']}</i>
	{/foreach}
	<article>
		<h3>Commentaires:</h3>
		{if isset($smarty.session.login)}
			{if !empty($data['comments'])}
				{foreach $data['comments'] as $com}
					<article class = "commentaire">
						<h4>{$com['UTI_LOGIN']} - {$com['COM_DATE']} a dit:</h4>
						<p>{$com['COM_TEXTE']}</p>
						{if $com['UTI_LOGIN'] == $smarty.session.login}
							<form action="index.php?page=recette_detail&idr={$smarty.request.idr}" method="post">
								<input type="hidden" name="comid" value="{$com['COM_ID']}"/>
								<input type="submit" name="supprime" value="Supprimer le commentaire"/>
							</form>
						{/if}
					</article>
				{/foreach}
			{else}
				<p>Pas encore de commentaire sur cette recette. Soyez le premier à laisser votre avis!</p>
			{/if}
			{if isset($data['can_com'])}
			<article>
				<h4>Poster un commentaire:</h4>
				<form action="index.php?page=recette_detail&idr={$smarty.request.idr}" method="post">
					<textarea name="message" class="com_message" required></textarea><br/>
					<input type="submit" name="poste" value="Envoyer le commentaire"/>
				</form>
			</article>
			{/if}
		{else}
			<p>Veuillez vous connecter pour pouvoir lire ou poster des commentaires</p>
		{/if}
	</article>
{else}
	<p>La recette à laquelle vous tentez d'accéder n'existe pas</p>
{/if}
</section>
{/block}