{extends file="../layout.tpl"}
{block name=page}
<section>
	<article style="text-align:justify;vertical-align:center;">
		<p style="display:block;">Bienvenue sur votre profil, {$data['profil'][0]['UTI_PRENOM']} {$data['profil'][0]['UTI_NOM']} !</p>
		<p style="width:49%; vertical-align:top;">
			Login: {$data['profil'][0]['UTI_LOGIN']}<br/>
			Nom: {$data['profil'][0]['UTI_NOM']}<br/>
			Prénom: {$data['profil'][0]['UTI_PRENOM']}<br/>
			Mail: {$data['profil'][0]['UTI_MAIL']}<br/>
		</p>
		<p style="width:50%; text-align:right;"><img src="media/{$data['profil'][0]['UTI_LOGIN']}/{$data['profil'][0]['UTI_AVATAR']}" alt="Photo de profil" style="width:22%;"></img></p>
</article>
</section>
{/block}