{extends file="../layout.tpl"}
{block name=page}
<section>
	<h2>Profil</h2>
	<article style="text-align:justify;vertical-align:center;">
		<h3 style="display:block;">Bienvenue sur votre profil, {$data['profil'][0]['UTI_PRENOM']} {$data['profil'][0]['UTI_NOM']} !</h3>
		<article style="text-align:justify;vertical-align:center;">
			<h4 style="text-align:left; margin-bottom:4px;">Vos informations</h4>
			<p style="width:49%; vertical-align:top;">
				Login: {$data['profil'][0]['UTI_LOGIN']}<br/>
				Nom: {$data['profil'][0]['UTI_NOM']}<br/>
				Prénom: {$data['profil'][0]['UTI_PRENOM']}<br/>
				Mail: {$data['profil'][0]['UTI_MAIL']}<br/>
			</p>
		<p style="width:50%; text-align:right;"><img src="media/{$data['profil'][0]['UTI_LOGIN']}/{$data['profil'][0]['UTI_AVATAR']}" alt="Photo de profil" style="width:22%;"></img></p>
		</article>
		<article>
			<h3>Vos recettes</h3>
			{if !empty($data['user_rct'])}
				<table style="width=100%;">
				{foreach $data['user_rct'] as $recette}
					<tr class="recette_profil">
						<td style="text-align:center;"><a href="index.php?page=recette_detail&idr={$recette['RCT_ID']}">{$recette['RCT_TITRE']} </a></td>
						<td><p>{$recette['RCT_DESCRIPTION']}</p></td>
						<td style="text-align:center;"><p>{$recette['CAT_LABEL']}</p></td>
						<form action="index.php?page=profil" method="post">
							<input type="hidden" name="rctid" value="{$recette['RCT_ID']}"/>
							<td>
								<input type="submit" name="modifier" value="&#9998" class="modif_button"/>
							</td>
							<td>
								<input type="submit" name="supprimer" value="&#10008" class="modif_button"/>
							</td>
						</form>		
					</tr>
				{/foreach}
				{if !isset($data['affiche_form'])}
					<tr class="recette_profil">
						<form action="index.php?page=profil" method="post">
							<td style="text-align:center;"><input type="submit" name="ajouter" value="&#10010" class="modif_button"/></td>
						</form>
					
						<td><p>Ajouter une recette</p></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					</table>
				{else}
					</table>
					<h4>Ajouter une recette</h4>
					<p>{$data['erreur']}</p>
					<form action="index.php?page=profil" method="post" enctype="multipart/form-data">
						Nom de la Recette </br>
						<input type ="text" name="nom_recette" required></br>
						Image<br/>
						<input type="hidden" name="MAX_FILE_SIZE" value="5120000">
						<input type="file" name="image_recette" required><br/>
						Catégorie <br/>
						<input type="radio" name="cat_recette" value ="Entree" checked> Entrée </br>
						<input type="radio" name="cat_recette" value ="Plat"> Plat </br>
						<input type="radio" name="cat_recette" value ="Dessert"> Dessert </br>
						Temps de preparation </br>
						<input type ="text" name="temps_prepa" required></br>
						Temps de cuisson </br>
						<input type ="text" name="temps_cuisson" required></br>
						Temps de repos </br>
						<input type ="text" name="temps_repos" required></br>
						Difficultee </br>
						<input type="radio" name="difficultee" value ="Facile" checked> Facile </br>
						<input type="radio" name="difficultee" value ="Moyenne"> Moyenne </br>
						<input type="radio" name="difficultee" value ="Difficile"> Difficile </br>
						Coût </br>
						<input type="radio" name="cout" value ="faible" checked> Faible </br>
						<input type="radio" name="cout" value ="moyen"> Moyen </br>
						<input type="radio" name="cout" value ="haut"> Haut </br>
						Nombre de personne </br>
						<input type="number" min="1" max="50" name="nb_pers" required></br>
						Description rapide</br>
						<input type="text" name="desc_mini"></br>
						Recette</br>
						<textarea name="texte_recette" rows="10" cols="50" required>Saisir votre recette ici.</textarea></br>
						<input type="submit" name="envoyer" value="Envoyer">
						<input type="reset" value="Reinitialiser">
					</form>
				{/if}
				
			{else}
				<p>Vous n'avez pas posté de recette!<p>
					<form action="index.php?page=profil" method="post">
						<input type="submit" name="supprimer" value="&#10010" class="modif_button"/> Créer ma première recette
					</form>
			{/if}
			
		</article>
	</article>
</section>
{/block}