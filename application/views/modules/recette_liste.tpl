{extends file="../layout.tpl"}
{block name=page}
<section>
	{if !isset($data['tab_rct'])}
		<h2>Catégories</h2>
		{foreach from=$data['tab_cat'] item=egorie}
			<article>
				<h3>{$egorie['CAT_LABEL']}</h3>
				<div class="img">
					<img src="media/categorie/{$egorie['CAT_ILLUSTRATION']}" alt="categorie {$egorie['CAT_LABEL']}" class="img_list"></img>
				</div>
				<p class="desc">{$egorie['CAT_DESCRIPTION']}</p><br/>
				<a href="index.php?page=recette_liste&idc={$egorie['CAT_ID']}" class="acces">Accéder aux recettes &gt</a>
			</article>
		{/foreach}
	{else}
		<h2>Recettes</h2>
		{foreach from=$data['tab_rct'] item=recette}
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
	{/if}
</section>
{/block}