{extends file="../layout.tpl"}
{block name=page}
<section>
	<article>
		<h2>Article</h2>
		<p>Article random</p>
	</article>
</section>
<section>
	<article>
		<h2>Le Tableau réellement random</h2>
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