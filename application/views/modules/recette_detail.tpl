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
			<img src="media/{$recette['UTI_LOGIN']}/{$recette['RCT_ILLUSTRATION']}" alt="categorie {$recette['RCT_TITRE']}" id="det_img"></img>
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
{else}
	<p>La recette à laquelle vous tentez d'accéder n'existe pas</p>
{/if}
</section>
{/block}