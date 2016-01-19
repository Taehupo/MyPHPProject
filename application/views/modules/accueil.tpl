{extends file="../layout.tpl"}
{block name=page}
<section>
	<h2>Bienvenue!</h2>
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
<section>
	<article>
		<h3>Le Tableau réellement random</h3>
		<table border=1>
		<tr>
			<th>Valeur 1</th>
			<th>Valeur 2</th>
			<th>Valeur 3</th>
		</tr>
		<tr>
		{foreach $data['alea'] as $el}
			<td>{$el}</td>
		{/foreach}
		</tr>
		</table>
	</article>
</section>
{/block}