{extends file="../layout.tpl"}
{block name=page}
<section>
	<h2>Bienvenue!</h2>
	<article>
		<h3>Bienvenue sur le site Cooking Berry!</h3>
		<p>Cooking Berry est un site de partage de recettes. <br/>En te connectant, tu peux poster tes propes recettes, et commenter celles des autres membres!<br/> En attendant, tu peux commencer la navigation en allant voir dans l'onglet "Les Recettes". Ou bien tu peux cliquer sur l'une des trois recettes en dessous.</p>
	</article>
	<article>
		<h3>Quelques recettes au hasard</h3>
		{foreach $data['rdm_rct'] as $recette}
			<article>
				<h3>{$recette['RCT_TITRE']}</h3>
				<div class="img">
					<img src="media/{$recette['UTI_LOGIN']}/{$recette['RCT_ILLUSTRATION']}" alt="recette {$recette['RCT_TITRE']}" class="img_list"></img>
				</div>
				<p class="desc">{$recette['RCT_DESCRIPTION']}</p><br/>
				<a href="index.php?page=recette_detail&idr={$recette['RCT_ID']}" class="acces">Accéder aux détails &gt</a>
				<i><br/>Recette postée par {$recette['UTI_LOGIN']}</i>
			</article>
		{/foreach}
	</article>
</section>
{/block}