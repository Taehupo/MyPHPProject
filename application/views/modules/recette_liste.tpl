{extends file="../layout.tpl"}
{block name=page}
<section>
	{if !isset($data['tab_rct'])}
		<h2>Catégories</h2>
		{foreach from=$data['tab_cat'] item=egorie}
			<article>
				<h3>{$egorie['CAT_LABEL']}</h3>
				<img src="media/categorie{$egorie['CAT_ILLUSTRATION']}" alt="categorie {$egorie['CAT_LABEL']}"></img>
				<p>{$egorie['CAT_DESCRIPTION']}</p>
				<a href="index.php?page=recette_liste&idc={$egorie['CAT_ID']}">Accéder aux recettes</a>
			</article>
		{/foreach}
	{else}
		<h2>Recettes</h2>
		{foreach from=$data['tab_rct'] item=recette}
			<article>
				<h3>{$recette['RCT_TITRE']}</h3>
				<img src="media/{$recette['UTI_LOGIN']}/{$recette['RCT_ILLUSTRATION']}" alt="categorie {$recette['RCT_TITRE']}"></img>
				<p>{$recette['RCT_DESCRIPTION']}</p>
				<a href="index.php?page=recette_detail&idr={$recette['RCT_ID']}">Accéder aux détails</a>
			</article>
		{/foreach}
	{/if}
</section>
{/block}