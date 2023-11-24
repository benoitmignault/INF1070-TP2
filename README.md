# INF1070 Automne 2023 - Travail pratique 2

## Énoncé

Ce court document contient l'énoncé du travail pratique 2 donné dans le cadre du cours INF1070 Utilisation et administration des systèmes informatiques au trimestre d'automne 2023. **Ce TP est commun aux 5 groupes**.

L'objectif du second travail pratique est de vous familiariser avec l'écriture de scripts Shell en utilisant les différentes commandes disponibles dans une distribution Debian standard.

Le travail est à réaliser **individuellement (pas d'équipe)**.

## Travail à réaliser

Vous devez compléter chacun des 6 exercices décrits plus loin (l'exercice 0 étant déjà résolu). 
Lors de la remise, vous devrez rendre une archive nommée `tp2.tgz` contenant l'ensemble des fichiers de ce projet.

- Un fichier `tp2.md` (le gabarit est disponible dans ce répertoire) qui identifie l'étudiant qui a réalisé le travail pratique, puis qui décrit en détails chacune de vos solutions, ainsi que leur état lors de la remise (*résolu*, *partiellement résolu*, *non résolu*). 
    - Ce fichier doit respecter le format Markdown.
- Vos scripts de solution. 
    - Chacun d'entre eux doit se trouver dans le répertoire correspondant à la mission.
- L'exercice `mystere` ne nécissitant aucun script, vous pouvez juste mettre vos réponses dans le fichier `tp2.md`.

## Consignes générales

Chacun des scripts que vous fournirez doivent être des scripts Shell ou Bash.
En d'autres termes, selon les exerccies, les seuls choix permis pour le *shebang* sont `#!/bin/sh` ou `#!/bin/bash`.

Par ailleurs, ne choisissez Bash que lorsque vous utilisez des *bashismes* à l'intérieur de votre script.

## Exercices

Les énoncés des exercices s'obtiennent en suivant les liens ci-bas:

0. [remise](./remise) (exercice résolu à titre d'exemple)
1. [mystere](./mystere)
2. [regex](./regex)
3. [lsexec](./lsexec)
4. [docker](./docker)
5. [recent](./recent)
6. [backup](./backup)

## Modalités de remise

- Votre travail doit être remis au plus tard le **dimanche 10 décembre 2023** à **23h55** par l'intermédiaire de la plateforme [Moodle](https://www.moodle.uqam.ca).
- Vous ne devez remettre qu'un seul fichier nommé exactement `tp2.tgz`.  
- Une pénalité de **2 points** par heure de retard sera appliquée.  
- Notez que vous pouvez faire autant de dépôt que vous le souhaitez, seule la dernière version sera prise en considération.
- **Aucune remise par courriel ne sera acceptée**, peu importe le motif. 
    - Plus précisément, si vous envoyez votre travail par courriel, il sera considéré comme non remis. 
    - Il est donc de votre responsabilité de vous assurer d'être capable de faire une remise par l'intermédiaire de Moodle quelques jours avant la remise.

## Le format Markdown

Le gabarit `tp2.md` que vous allez remettre doit respecter le format Markdown, qui est un format texte à balisage léger. 
Le site officiel qui décrit ce format se trouve [ici](https://daringfireball.net/projects/markdown/).

## Barème de correction

Les points suivants seront considérés lors de l'évaluation:

- Votre travail sera calculé sur un total de **100 points**.
- Il y a 6 exercices à compléter avec le barème suivant,
    - `mystere` 5 points
    - `regex` 10 points
    - `lsexec` 15 points
    - `docker` 20 points
    - `recent` 25 points
        - 5 points de plus si vous ajoutez une implémentation fonctionnelle de l'option `-c`
    - `backup` 25 points
- Une partie de la note de chaque exercice portera sur la qualité de votre remise.
    - Incluant notamment celle du fichier Markdown remis, la qualité du français, le soin apporté au format de fichier, mais également celle des scripts eux-mêmes.
- Tel que mentionné plus haut, une pénalité de **2 points** par heure de retard sera appliquée.
- L'élégance et la simplicité des solutions fonctionnelles seront prises en compte dans la notation. 
    - Des solutions inutilement complexes pourront être en partie pénalisées. 
    - Des points *boni* pourront être attribués à des solutions particulièrement élégantes.

## Précisions sur la description de la démarche

On vous demande d'expliquer votre démarche pour chaque question. 
Cela signifie montrer pourquoi vous avez choisi chaque commande et ses options.

Par exemple pour la commande :
```sh
tar -xzvf cassé.tar.gz
```

- :x: commentaire pas pertinent :x:
>j'ai utilisé la commande `tar` trouvée sur google/dans les slides/qui m'a donné le bon résultat. J'ai utilisé telle commande qui m'a ensuite permi de réaliser la derniere étape car la précédente n'a pas fonctionné. etc...

- :white_check_mark: commentaire pertinent :white_check_mark:
>J'ai reconnu une archive compressée avec `gzip` grace à l'extension `tar.gz` alors j'ai utilisé la commande `tar` qui permet de manipuler et créer des archives. L'option `-v`, mode verbose, optionnelle ici, me permet d'afficher tous les fichiers extraits et surveiller l'exécution et l'option `-z` permet de décompresser les tarballs compressés avec `gzip`.
