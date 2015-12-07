{extends file="../layout.tpl"}
{block name=page}
<section>
	<h2>Catégories</h2>
	{foreach from=$data['tab_cat'] item=egorie}
		<article>
			<h3>{$egorie['CAT_LABEL']}</h3>
			<img src="media/categorie{$egorie['CAT_ILLUSTRATION']}" alt="categorie {$egorie['CAT_LABEL']}"></img>
			<p>{$egorie['CAT_DESCRIPTION']}</p>
		</article>
	{/foreach}
</section>
{/block}