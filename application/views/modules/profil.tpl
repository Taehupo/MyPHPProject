{extends file="../layout.tpl"}
{block name=page}
	<p>Bienvenue {$data['user[nom]']} {$data['user[prenom]']} !</p>
{/block}