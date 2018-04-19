<?php

// Includes
require('../../lib/editeursManager.php');
require ("../include/config_defaut.php");

$nom = $_POST['nom'];
$erreur = "";

// Accès base de donnéees
$db = new PDO('mysql:host=localhost;dbname=jeuxvideo', 'root', '');
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$manager = new EditeursManager($db);
$editeurs = $manager->getList();

// On vérifie que le nom a été tapé par l'utilisateur
if(!empty($nom)){
	$new_editeur = new Editeur([
		'nom' => $nom
	]);

	foreach ($editeurs as $editeur) {
		// On vérifie que le nom n'est pas déjà créer
		if(strtolower($new_editeur->nom()) == strtolower($editeur->nom())){
			$erreur = "Ce nom est déjà créé";
			echo $erreur;
		}
	}

	if(!$erreur){

		$manager->add($new_editeur);
		echo "L'éditeur " . $nom . " a été ajouté avec succès";
	}


} else {
	echo "Le champ non n'a pas été rempli";
}

?>

<a href="../index.php">Revenir à la page d'accueil</a>
