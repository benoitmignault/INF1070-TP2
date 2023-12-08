# Travail pratique 2

## Identification

- Cours      : Utilisation et administration des systèmes informatiques
- Sigle      : INF1070
- Session    : Automne 2023
- Groupe     : `20`
- Enseignant : `Moussa Abdenbi`
- Auteur     : `Benoît Mignault` (`MIGB09078205`)


## Solution de l'exercice 0

### État de l'exercice: résolu

La solution de l'exercice 0 se trouve dans le script `remise/archiver_tp`.

Pour archiver le travail pratique, on se place à la racine du projet et on entre la commande

```sh
remise/archiver_tp
```

qui produit l'archive `tp2.tgz`. 
Ensuite, il suffit de déposer le fichier `tp2.tgz` sur Moodle!


## Solution de l'exercice 1

### État de l'exercice: résolu

### Démarche

#### Explication du script mystere/mystere.sh

La premiere ligne du script permet d'utiliser le bon interpreteur de commande, ici on utilisera bash.
Le script est divisé en deux parties. La première partie avec un bloc `if...fi`, suivi d'un 2e bloc `if...else...fi`.

Le premier bloc `if...fi` possède une condition `$# -ne 1`, qui valide si le nombre d'arguments passés en paramètre est différent de 1. 
On rappel que le nom du script ne figure pas dans la somme des paramètres. Si on passe 0 paramètre ou 2 paramètres et plus, 
la condition sera vraie donc le message `Fournir un nom en parametre` sera affiché via la commande `echo` 
et un code de retour 1 sera associé à la sortie du script via la commande `exit`. Le code de retour 1 représente généralement une erreur d'exécution. 

Si on a un paramètre, on passe au prochain bloc `if...else...fi`. On commence par valider si le paramètre `$1` est un répertoire avec l'option `-d`. 
Ici, l'option est associé au test de la condition. Si le répertoire existe, on sortira du script avec un code de retour 0, qui veut dire `succès`. 
Sinon, le répertoire n'existe pas et on va rentrer dans une récursivité.

Cette récursivité va rappeller le script ainsi que le paramètre `"$0" dirname $1`. 
Le nombre de récursivités va être égale au nombre de répertoires parents + le répertoire qu'on veut créer.
Au moment de la dernière récursivité, la commande `"$0" dirname $1` va retirer le répertoire et garder le répertoire courant `.`, lorsqu'il ne trouvera plus de `/`. 

Biensûr, le répertoire courant `.` existe, donc la condition du 2e `if` sera vraie donc fera un exit avec un code de retour 0. 
On remontera chacunes des autres récursivités en créant le répertoire désigné avec la commande `mkdir $1`, 
sauf si le répertoire voulu existe déjà et, dans ce cas, on fera une sortie avec un code de succès (0) de la présente récursivité et passer à la prochaine.

#### Exemples d'appels du script

##### Situation avec 0 paramètre :

```sh
mystere/mystere.sh
```

Résultat de l'exécution du script :

La première condition est vraie car le nombre de paramètres est différent de 1, donc le script s'arrête en faisant une sortie avec un code d'erreur 1.


##### Situation avec 1 paramètre qui contient `dossier` comme paramètre :

```sh
mystere/mystere.sh dossier
```

Résultat de l'exécution du script :

La première condition est fausse, car on a un paramètre. Le répertoire `dossier` sera vérifié dans le deuxième `if` qui n'existe pas, donc on passera à la condition du `else`. 
On fait un appel à la récursivité grâce à `"$0" dirname $1` qui va trouver le répertoire courant du script `.` qui mettra fin à la récursivité.
Comme le répertoire `.` existe, donc il y aura une sortie du sous script avec un code de retour de `succès`. On remonte ensuite vers le haut pour créer le répertoire `dossier`. 


##### Situation avec 1 paramètre qui contient encore une fois `dossier` comme paramètre mais le répertoire existe déjà :

```sh
mystere/mystere.sh dossier
```

Résultat de l'exécution du script :

La première condition est fausse, car on a un paramètre. 
Le répertoire `dossier` sera vérifié dans le deuxième `if` qui existe cette fois-ci. 
On va sortir du script avec un code de retour 0.


##### Situation avec 1 paramètre qui contient `dossier/dossier2` comme paramètre :

```sh
mystere/mystere.sh dossier/dossier2
```

Résultat de l'exécution du script :

La première condition est fausse, car on a un paramètre. 
Le répertoire `dossier/dossier2` sera vérifié dans la deuxième condition du `if` qui n'existe pas, 
donc on passera à la condition du `else`. On commence à partir de ce moment là, la récursivité, jusqu'au moment de trouver un répertoire existant. 
La récursivité sera arrêtée, on va remonter la récursivité et créer le répertoire de chaque sous script et le script origine appellé, si nécessaire.


## Solution de l'exercice 2

### État de l'exercice: résolu

* Durant la conception, le fichier `fichier` a été offert par le professeur Moussa Abdenbi, via  Mattermost. Ce fichier contient une quantité appréciable de lignes dans le but de tester la plupart des cas de figures.

* Toutes les expressions régulières utilisent la commande `grep` et on doit mettre notre `regex` entre apostrophe pour éviter que le shell interprète les signes de notre expression.

#### Expression régulière 1 :

```bash
grep '^[aA]' fichier
```

#### Explication régulière 1 :

Il faut trouver les lignes qui commencent par `a` ou `A` via l'ensemble `[aA]`.
Il y a plusieurs moyens d'y arriver mais on va y aller avec un ensemble à choisir, comme expliqué plus haut.
On utilise le symbole `^` qui est un ancrage pour corresponde au début d'une ligne.


#### Expression régulière 2 :

```bash
grep 'rs$' fichier
```

#### Explication régulière 2 :

On va utiliser le symbole ancrage `$` pour déterminer la fin d'une ligne. On veut trouver les lignes qui finissent par la conbinaison `rs`.


#### Expression régulière 3 :

```bash
grep '^[A-Z].*[0-9]' fichier
```

#### Explication régulière 3 :

On commence par utiliser le symbole ancrage `^` pour trouver les lignes qui commencent par une majuscule via l'interval `[A-Z]`.
Ensuite, les lignes du fichiers doivent contenir au moins un chiffre via l'interval `[0-9]`. 
Cependant, si on utilise seulement ces deux intervales, ça va rien donner car il manque une logique à notre expression. 
Entre la majuscule du début et le chiffre, il n'est pas impossible de retrouver quelconques caractères entre les deux. 
On va utiliser `.*` qui signifie qu'on peut avoir entre 0 et plusieurs caractères quelconques.


#### Expression régulière 4 :

```bash
grep '^[BEQ]' fichier
```

#### Explication régulière 4 :

On va utiliser le symbole ancrage `^` pour trouver les lignes qui commencent par les lettres majuscules `B`, `E` ou `Q` via l'interval `[BEQ]`.


#### Expression régulière 5 :

```bash
grep '[^.,;:?!]$' fichier
```

#### Explication régulière 5 :

On va utiliser le symbole `^` mais pas comme un ancrage mais comme une négation à l'intérieur de l'interval des ponctuations.
Cet interval aura les signes suivants `.`, `,`, `;`, `:`, `?` ou `!` via l'interval `[^.,;:?!]`. 
On va utiliser le symbole ancrage `$` pour déterminer la fin d'une ligne.


#### Expression régulière 6 :

```bash
grep '^.r' fichier
```

#### Explication régulière 6 :

On va utiliser le symbole ancrage `^` pour trouver les lignes qui commencent par n'importe quel caractère.
Cependant, le 2e caractère de la ligne doit être absolument la lettre `r`.


#### Expression régulière 7 :

```bash
grep -E '^\+?([0-9]{1,2})?\s?\(?[0-9]{3}\)?[0-9]{3}[-. ]{1}[0-9]{4}$' fichier
```

#### Explication régulière 7 :

On utilise l'option `-E` pour trouver des expressions régulières étendues (ERE).
On va utiliser le symbole ancrage `^` pour trouver les lignes qui commencent par un `+` au sens littéral, mais il est optionnel grâce au `?` qui suit le `+`. 
Ensuite, on a notre premier groupe `([0-9]{1,2})` qui lui aussi pourrait être optionnel grâce au `?` 
et dans ce groupe, on va avoir entre 1 et 2 chiffres qui correspond au code interrurbain du pays qu'on tente de rejoindre.
Ensuite, dans certaines situation, il pourrait y avoir un espace entre le code interrurbain et le reste du numéro. 
On va utiliser la notion `\s` pour représenter l'espace avec l'option qui pourra être optionnel grâce au `?`. 
Ensuite, il pourrait y avoir une paranthèse ouvrante `(` tout en étant optionnel grâce au `?`. 
Ensuite, on a 3 chiffres qui se suivent consécutivement `[0-9]{3}`. 
Si on a une paranthèse ouvrante, on pourrait forcément avoir une paranthèse fermante `)` tout en étant optionnel grâce au `?`.
Ensuite, on a 3 chiffres qui se suit consécutivement `[0-9]{3}`. 
Ensuite, vient obligatoirement un signe de ponctuation `.`, `-` ou ` ` dans l'ensemble suivant : `[-. ]{1}`
pour séparer les 3 chiffres avec les 4 derniers que on va retrouver via la dernière partie de l'expression soit `[0-9]{4}$`.


#### Expression régulière 8 :

```bash
grep -E '^[1-9][0-9]{3}-((0?2-(0?[1-9]|1[0-9]|2[0-8]))|((0?[13578]|1[02])-(0?[1-9]|[1-2][0-9]|3[0-1]))|((0?[469]|11)-(0?[1-9]|[1-2][0-9]|30)))$' fichier
```

#### Explication régulière 8 :

On utilise l'option `-E` pour utiliser des expressions régulières étendues (ERE).
On va commencer par résumer mon expression de 135 caractères de long...
Une chose qui est simple c'est le début, les années peuvent variées entre `1000` et `9999` donc on va utiliser `[1-9][0-9]{3}` 
mais précédé du symbole ancrage `^` pour dire que les lignes du fichiers commencent par un chiffre entre `1` et `9` et suivi d'un `-` pour séparer les années du reste...

Il y a 3 situation qui peut arriver selon les exigences :

* Le mois de févier (peu importe l'année) compte 28 jours.
* Les mois de janvier, mars, mai, juillet, août, octobre, décembre comptent 31 jours.
* Les mois d'avril, juin, septembre, novembre comptent 30 jours.

On va ajouter notre première paire de parenthèses qui va contenir nos 3 scénarios. 
Comme les trois scénarios peuvent arrivés, on va utiliser le symbole `|`, pour le sséparer et qui va représenter un `OU`.
Pour chaque scénario, on va ajouter une autre paire de parenthèses `(....)` pour bien les isoler.


Scénario des mois avec 28 jours. Il y a seulement le mois de février.

On peut écrire le mois avec le `0` qui est optionel en raison du caractère `?` suivi du chiffre `2`.
Ensuite, vient le tiret `-` pour séparer les mois des jours.

Pour la section jour, on va ajouter une paire de parenthèses `(....)`,
comme il va y avoir 3 scénarios, séparer par le symbole `|` qui va représenter un `OU`.

Premier scénario, comme pour le mois, le `0` pour les jours est optionel en raison du caractère `?`
suivi de l'intervale `[1-9]` qui signifi qu'on a un seul chiffre pour la date qui variera entre `1` et `9`.
Deuxième scénario, les mois entre `10` et `19` jours en utilisant cette combinaison `1[0-9]`. 
Troisième scénario, les mois entre `20` et `28` jours en utilisant cette combinaison `2[0-8]`. 
Ce qui met fin au scénario de février.


Scénario des mois avec 30 jours. Il y a les mois suivants : avril, juin, septembre, novembre. 
On va ajouter une paire de parenthèses `(....)`, comme il va y avoir 3 scénarios pour les mois, séparer par le symbole `|` qui va représenter un `OU`.

On peut écrire le mois avec le `0` qui est optionel en raison du caractère `?` suivi de l'interval `[469]` pour les mois en bas de 10.
Pour le mois de novembre, on va utiliser cette combinaison `11`.
Ensuite, vient le tiret `-` pour séparer les mois des jours.

Pour la section jour, on va ajouter une paire de parenthèses `(....)`, 
comme il va y avoir 3 scénarios, séparer par le symbole `|` qui va représenter un `OU`.

Premier scénario, comme pour le mois, le `0` pour les jours est optionel en raison du caractère `?`
suivi de l'intervale `[1-9]` qui signifi qu'on a un seul chiffre pour la date qui variera entre `1` et `9`.
Deuxième scénario, les mois entre `10` et `29` jours en utilisant cette combinaison `[1-2][0-9]`. 
Troisième scénario, le mois avec `30` jours.
Ce qui met fin au scénario des mois de 30 jours.


Scénario des mois avec 31 jours. Il y a les mois suivants : janvier, mars, mai, juillet, août, octobre, décembre. 
On va ajouter une paire de parenthèses `(....)`, comme il va y avoir 3 scénarios pour les mois, séparer par le symbole `|` qui va représenter un `OU`.

On peut écrire le mois avec le `0` qui est optionel en raison du caractère `?` suivi de l'interval `[13578]` pour les mois en bas de 10.
Pour les mois d'octobre et décembre, on va utiliser cette manière dans le `regex` : `1[02]`.
Ensuite, vient le tiret `-` pour séparer les mois des jours.

Pour la section jour, on va ajouter une paire de parenthèses `(....)`, 
comme il va y avoir 3 scénarios, séparer par le symbole `|` qui va représenter un `OU`.

Premier scénario, comme pour le mois, le `0` pour les jours est optionel en raison du caractère `?` 
suivi de l'intervale `[1-9]` qui signifi qu'on a un seul chiffre pour la date qui variera entre `1` et `9`. 
Deuxième scénario, les mois entre `10` et `29` jours en utilisant cette combinaison `[1-2][0-9]`. 
Troisième scénario, les mois avec `30` et `31` jours en utilisant cette combinaison `3[0-1]`. 
Ce qui met fin au scénario des mois de 31 jours.


#### Expression régulière 9 :

```bash
grep -iP '^(https|ftp)(?=://([a-z])\2\2\.[a-z0-9]+\.[a-z]{2,3})' fichier
```

#### Explication régulière 9 :

On utilise l'option `-i` pour ignore la différence entre majuscule et minusculecasepour utiliser des expressions régulières étendues (ERE). 
On utilise aussi l'option `-P` pour utiliser la notion d'assertion. L'assertion permet de ne pas consommer les caractères trouvés.

On va utiliser le symbole ancrage `^` pour trouver un des schémas valides dans le groupe `(https|ftp)`. Seulement le schémas sera capturé au final.
On a besoin d'une adresse web valide mais elle ne doit pas être capturée, on utilisera une assertion de type `positive en avant (lookahead)`.
Tous ce qui est à l'intéreiur de l'assertion sera valider comme d'habitude avec la commande `grep`.
Entre le schéma et l'adresse web, il y a toujours ces 3 caractères important qui doivent être présent `://`.
On a besoin de trouver les 3 caractères pareils, du début de l'adresse web. 
On va créer un deuxième groupe qui contient un caractère `([a-z])` et en utilisant deux fois le terme `\2`.
Avec ça, on pourra réperter deux fois le caractère du deuxième groupe. Le groupe `([a-z])` est le deuxième, car c'est la deuxième parenthèse depuis le début de l'assertion.
Après on valide qu'on a bien un `.` entre les 3 caractères pareils et le nom de domaine, qui d'ailleurs remplace l'adresse IP.
Le nom de domaine est représenté par `[a-z0-9]` des caractères alphanumériques suivi d'un autre `.`.
On termine la validation par les 2 ou 3 caractères qui termine une adresse web soit `[a-z]{2,3}`.


## Solution de l'exercice 3

### État de l'exercice: résolu

#### Explication du script lsexec/lsexec

On utilise le shebang `#!/bin/sh` pour bien interpreter le script.
Tous les dossiers sont séparés d'un `:` dans la variable Environnement `PATH`, donc on va associer le deux point à la variable `IFS`. 
Communément appeler `Internal Field Separator` permet d'interpreter comme on veut le séparateur utilisé par `PATH`.
On commence à itérer à travers la première boucle `for` de chaque répertoires de la variable `PATH`.
Pour chaque répertoire, on va itérer à nouveau via la deuxième boucle `for` sur chaque fichier possèdant le répertoire.
Dans la deuxième boucle `for chemin_fichier in "$liste_repertoires"/*; do`, le terme `/*` est très important, 
car grâce à lui, il permet au script de passer **vraiment** à travers chaque dossier pour lister chaque fichier.
On doit déterminer, que le fichier est normal et qu'il est un exécutable et ça inclut les liens symboliques.
Si c'est trois conditions sont rempli, on affiche le fichier et son chemin relatif de la racine au fichier.
On passera au prochain fichier dans la deuxième boucle. Une fois tous les fichiers du répertoire en cours d'itération,
on va revenir à la première boucle pour itérer sur le répertoire suivant.


## Solution de l'exercice 4

### État de l'exercice: résolu

**Pour voir la liste des commandes exécutées durant l'exercice 4 et leur résultat, je vous prier d'aller consulter le fichier `docker/docker.md`.**

#### Étape dans la création de docker

1. Récupération de la version la plus récente d'Ubuntu via le registre des image Docker Hub.

#### Explication de l'étape 1 :

On utilise la commande `sudo` pour se définir le temps d'exécuter la commande comme un `superutilisateur`.
Ensuite, on demande à `docker` via la commande suivante `docker pull` de récupérer du registre des images, 
l'image la plus récente de la distribution Linux `Ubuntu`. C'est une manière d'installer une image de base `Ubuntu`, sans utiliser la commande `docker build` qui est plus complexe, car elle demande le fichier de configuration `Dockerfile` qui permet l'installation d'une ou plusieurs images avec des spécificités différentes.


2. Affichage des images disponibles pour la création de futurs conteneurs.

#### Explication de l'étape 2 :

On utilise la commande `sudo` pour se définir le temps d'exécuter la commande comme un `superutilisateur`.
Ensuite, on demande à `docker` via la commande suivante `docker images` d'afficher les images disponbibles. 
Avec ces images, on va pouvoir créer des conteneurs et faire des utilisations d'Ubuntu en parallèle de notre distribution Ubuntu déjà installé sur notre ordinateur. 


3. Création d'un conteneur avec l'image de base qu'on a récupére du dépot des images `Ubuntu`.

#### Explication de l'étape 3 :

On utilise la commande `sudo` pour se définir le temps d'exécuter la commande comme un `superutilisateur`.
Ensuite, on demande à `docker` via la commande suivante `docker run` de créer et de démarrer l'instance du conteneur.
On utilise aussi deux options pour faciliter l'utilisateur de ce dernier soit l'option `-i` pour avoir le droit à l'entrée standard même si aucun processus est attaché au terminal. 
Il y a aussi l'option `-t` qui donne la chance d'avoir un terminal, à notre disposition. 
Il fallait donner un nom `containers-admin` à notre conteneur grâce à l'option longue `--name`. 
Ensuite, il fallait associer notre conteneur à une image `Ubuntu` disponible dans la liste d'images récament importé de `DockerHub`, on doit prendre `ubuntu`. 
Pour finir, on a utiliser `/bin/bash` qui sera notre type de shell disponible, tout le long de notr eutilisation de notre conteneur.


4. Installer les outils suivants dans le conteneur containers-admin et afficher leurs localisations dans le système de fichiers.

#### Explication de l'étape 4 :

Avant de faire l'installation des packages, il est important de faire la commande `apt update`. Ça permet de mettre notre conteneur à jour pour la réception des futurs packages qu'on pourrait avoir besoin.

Pour faire l'installation, tous les packages dont on aura besoin, on fait simplement `apt install` avec les packages qu'on veut installer un à la suite de l'autre, après le mot `install`.

On utilise la commande `dpkg` qui est le gestionnaire de packages pour la distribution de Linux `Debian`.
L'option `-L` permet de montrer pour chacun des packages listés après l'option, les endroits où ils se situent dans le système de fichiers.


5. Installation du package `redis-cli`

#### Explication de l'étape 5 :

+ Télécharger le package de la version la plus stable.

#### Sous-Explication :

La commande `curl` est utilisé pour télécharger le package `redis-stable.tar.gz`.
On utilise l'option `-o` pour spécifier le nom du fichier qui sera téléchargé. Après le nom qu'on donnera à notre fichier récupéré, on indique le lien `URL`.


+ Extraire les fichiers du fichier

#### Sous-Explication :

On utilise la commande `tar` pour désarchiver et décompresser un ensemble de fichiers. Il y a plusieurs options utilisés pour extraire le contenu. 
L'option `-x` permet d'extraitre les fichiers de l'archive. L'option `z` va utiliser la commande `gzip` pour décompresser le fichier. 
L'option `-f` indique quel fichier à d'archiver et décompresser, s'il y a lieu.


+ Complier le code source, à l'intérieur du répertoire `/tmp/redis-stable`

#### Sous-Explication :

On utilise simplement la commande `make` à l'intérieur du répertoire dont l'archivage a extrait les fichiers.


+ Copier l'exécutable vers le répertoire `/usr/local/bin`

#### Sous-Explication :

Pour utiliser le package partout dans le conteneur, on devrait en faire une copie dans le répertoire `/usr/local/bin`.


+ Afficher la version de la commande`redis-cli`

#### Sous-Explication :

On va utiliser l'option qui est standard à pas mal toutes les commandes / pacakges soit l'option longue `--version`.


6. Exporter la nouvelle image de notre conteneur dans le compte DockerHub.

+ Attribuer un nom à la nouvelle version de notre image.

#### Sous-Explication :

On utilise la commande `sudo` pour se définir le temps d'exécuter la commande comme un `superutilisateur`.
Ensuite, on demande à `docker` via la commande suivante `docker tag` qui permet de créer une nouvelle référence pour l'image utilisée par un conteneur. ÇA va servir, lorsqu'il sera le tmeps d'envoyer notre image sur le dépôt DockerHub.


+ Connexion à notre compte Docker-Hub.

#### Sous-Explication :

On utilise la commande `sudo` pour se définir le temps d'exécuter la commande comme un `superutilisateur`.
Ensuite, on demande à `docker` via la commande suivante `docker login` pour ouvrir un canal de communication avec notre compte sur DockerHub.
On doit saisir notre nom d'utilisateur et mot de passe.


+ Exportation de notre image à notre compte Docker Hub.

#### Sous-Explication :

On utilise la commande `sudo` pour se définir le temps d'exécuter la commande comme un `superutilisateur`.
Ensuite, on demande à `docker` via la commande suivante `docker push` pour exporter finalement notre nouvelle version de notre image.
On va utliser notre nom d'utilisateur, suivi d'un `/` et du nom de la nouvelle version de notre image.


7. Finalement, notre lien URL pour l'importation de notre image.

[Ma nouvelle version de mon image](https://hub.docker.com/r/hc591017/containers-admin)


## Solution de l'exercice 5

### État de l'exercice: résolu

Le but de cet exercice est d'afficher les fichiers récamment ouverts dans notre système de fichier `Ubuntu`.

La mécanique du script est séparé en différente section. 
Avant le début du script, il y a les 3 fonctions qui seront réutiliées plus tard, ce qui permet d'alléger le code. 
On pourra éliminer la notion de `ìf then else`, dans les situations où il y a une erreur et qu'on devait sortir du cript en exécution. Une mécanique de `if then` sera utilise.

Pour le bon fonctionnement du script, j'ai conçu des tests valides à la hauteur de `10` et d'autres tests invalides à la hauteur de `23` qui donneront des messages d'erreur et ainsi qu'un code d'erreur de sortie.

#### Tests fonctionnels

Ici, on va tester toutes les combinaisons possibles des options.
```
./recent -f recently-used.xbel
./recent -f recently-used.xbel -c
./recent -c -f recently-used.xbel
./recent -f recently-used.xbel -n 20
./recent -n 20 -f recently-used.xbel
./recent -f recently-used.xbel -n 20 -c
./recent -f recently-used.xbel -c -n 20
./recent -n 20 -c -f recently-used.xbel
./recent -c -n 20 -f recently-used.xbel
./recent -c -f recently-used.xbel -n 20
```

#### Tests non fonctionnels, pour s'assurer de l'intégrité du script.

# Code erreur 1
```
./recent 
./recent -f
./recent recently-used.xbel
./recent -c
./recent -n
```

# Code erreur 2
```
./recent -f fail                   >>> fichier est invalide
./recent -n 5 recently-used.xbel >>> le fichier doit venir avec son option -f
./recent -n 5                     >>> aucun nom de fichier na été fourni
./recent -f /home/frantz256255/.local/share >>> fichier est invalide
./recent -c -f                     >>> aucun nom de fichier na été fourni
./recent -n 4 -c -f             >>> aucun nom de fichier na été fourni
./recent -n 4 -c                 >>> aucun nom de fichier na été fourni
```

# Code erreur 3
```
./recent -f recently-used.xbel -n        >>> le nombre est manquant
./recent -f recently-used.xbel -n 0     >>> le nombre est doit être supérieur à 0
./recent -f recently-used.xbel -n 10x >>> le nombre est invalide
./recent -f recently-used.xbel -n a7   >>> le nombre est invalide 
./recent -c -n -f recently-used.xbel    >>> le nombre est manquant
./recent -n -c -f recently-used.xbel    >>> le nombre est manquant
```

# Code erreur 4
```
./recent -f recently-used.xbel -x          >>> option invalide
./recent -- -f recently-used.xbel          >>> option invalide
./recent -n 4 -n -f recently-used.xbel >>> option déjà présente
```

# Code erreur 5
```
./recent -f recently-used.xbel abcd               >>> argument inconnu
./recent -f recently-used.xbel recently-used.xbel >>> argument inconnu
```

Ces tests seront déclanchés à différent moment pendant le script. 
Avec un nombre argument valide, on va initier plusieurs variables qui seront utilisées dans le script.

On va utiliser un `forEach` pour itérer à travers tous les arguments. Je vais utiliser deux variables pour stocker les deux arguments sur lesquelles,
on va travailler. Ici, je parle de l'argument précédent qui sera affectué à l'argument actuel, 
qui est à null pour le premier argument, comme il n'y a pas d'argument précédent, vue qu'on commence à itérer.

On va utliser une mécanique de `switch / case` qui permet alléger le code en éliminant, la redondance des `if then else...`.
Les choix possibles du `switch / case` seront dans un premier temps les options `-f, -n & -c`, et la dernière situation sera tout le restant qui n'est pas une option valide.

Il faut dire qu'après une option valide, vient son argument propre à lui, sauf pour l'option `-c` qui viendra seul. 
Sinon, il faudra gérer des situations d'erreurs, tel mentionné plus haut.

Exemple de situation d'erreur possible, un nom de fichier qui ne vient pas après l'option `-f` mais remplacer 
par l'option `-n` et vise versa. Un nombre de lignes `valides` qui seront utilisées pour l'affichage du contenu du fichier récupérer via l'option `-f`. 

Lorsqu'une erreur survient, on doit envoyer un message ainsi qu'un code de sortie à la fonction `message_erreur_exit`. 
Il y a aussi l'utilisation de la fonction `validation_option_utilise` qui sera pour vérifier si on ne reçoit pas deux fois la même option.
On a utilisé des variables de contrôles de style `booléen`, une variable pour récupérer une valeur numérique et une variable qui contiendra le nom du fichier.

Une fois le `switch / case` terminé, on va finaliser certaines situations d'erreurs qui pourraient survenir à ce moment là.

Maintenant, on doit exécuter notre commande pour récupérer les fichiers les plus récents ouvert dans notre système de fichiers `Ubuntu`. 
Pour ce faire, on commence par utiliser la commande `grep` pour récupérer les lignes qui possède la mention de `href="file://`. 
Ensuite, on va utiliser la commande `awk` sur toutes les lignes retrouvées grace au résultat précédent. 
Avec l'option `-F` et son délimiteur voulu `"` qui permettra de récupérer toutes les séquences qui content des `"`. 
On va garder seulement la deuxième occurence soit via l'argument d ela même commande `'{print $2}'`. 
Maintenant qu'on a les noms complèts des fichiers, on va garder seulement le chemin et le nom du fichier, 
donc on aura besoin de la commande `sed` pour faire un traitement de nettoyage. 
On va utiliser l'option `-s/regexp/remplacement/g` pour remplacer l'occurence trouvée par rien, donc on fera juste supprimer `href="file://`. 
On va maintenant inverser la sélection pour avoir les fichiers les plus récents à la première ligne avec la commande `sort -r`. 
La commande `head -n` est obligatoire mais tout ce qui peut varier sera le nombre de lignes affichées en fonction du choix passer au script, 
préalablement. Le résultat affichera des caractères bizarre, si le chemin possède des espaces et / ou des accents. 
Exemple pour les espaces, on va avoir `%20` et pour les accents dont le `é`, on va avoir `%C3%A9`.
Pour corriger ces caractères innabituels, on devra faire appel à l'option `-c` du script. 
Dans un premier temps, on va faire appel, à la commande `sed` pour faire le remplacement du caractère `%` par `\x`. Cette transformation dira à la prochaine commande que c'est des caractères hexadécimales et qu'on peut faire de quoi pour convertir.

La commande finale `xargs` agira d'exécutante pour la commande `printf` qui agira ici à titre de convertisseur et formatage du résultat qui sera affiché. Ça va permettre d'afficher les espaces ou les autres caractères de type `spécial`, correctement.
On doit utiliser l'option `-0` avec la commande `xargs`, car la fin de chaque fichier est terminé par des caractères null.


## Solution de l'exercice 6

### État de l'exercice: résolu

Le but de cet exercice est d'archiver et de compresser des bases de données, via un répertoire passer en paramètre au script.

Avant le début du script, il y a la fonction les 3 fonctions `message_erreur_exit` reprise du script 
à l'exercice 5 pour faire l'affichage des messages d'erreurs. Cette fonction sera réutiliée plus tard, 
e qui permet d'alléger le code. 

On commence par faire une vérification du nombre argument passé en paramètre au script.
Il ne peut pas en avoir plus d'un arguement, sinon un message d'erreur approprier sera affiché et une sortie de script se fera.
On récupère le répertoire où se trouve normalement les bases de données à archiver. 
Un nom de variable `repertoire_cible` est plus significatif que `$1`. 

Ensuite, il faut valider que le répertoire est bien existant et valide. Après celà, une autre vérification simpose soit la présence de les bases de données, car sinon, ça ne sert à rien d'aller plus loin dans le script.

Il est très important, à partir de maintenant de parler de notion de chemin relatif qui commence par la racine du système de fichier `/home`. Dans le répertoire ciblé, on va itéré sur chaque fichier avec la bonne extension. 
Pour chaque DBs, on va créé un nouveau chemin qui ménera à la création d'un fichier de type `SQL`. 
Dans le nouveau chemin, il va avoir le chemin relatif, suivi du répertoire `/sql`, 
suivi du nom de fichier seulement sans son extension, sans son chemin relatif à lui et la date du moment pour la création du fichier.

Ensuite, il est temps de faire l'archivage de toutes les DBs converties en fichier de type `SQL`. 
On commence par valider si l'archive existe, si oui on rajout les autres fichiers de type `SQL`, à l'archive en cours.
Sinon, on créé l'archive. On utilise la commande `tar` pour archiver, avec l'option `-C` qu'on utilise pour se déplacer 
dans le répertoire où se trouvent les éléments à archiver. Un fois dans le répertoire, on ajout à archive le fichier en cours itération.

Une fois archivage terminé, on va maintenant faire la compression de l'archivage via la commande `gzip`, ce qui va renommer automatiquement l'archive en extention `.tar.gz`.

Pour finir, on fait le ménage dans nos bases de données, plus nécessaire d'avoir ces dernières vue la création du backup fait.

Les tâches de CRONJOB à faire pour l'exercice 6 :

Les tâches s'exécutent, respectivement à chaque 15 minutes, chaque heure, chaque 4 heures et une fois par jour le soir à 23h59m.
```
*/15 * * * * /home/frantz256255/Documents/INF1070/TP2/INF1070-TP2/backup/backup-dbs /home/frantz256255/Documents/INF1070/TP2/INF1070-TP2/backup/mydbs
0 * * * * /home/frantz256255/Documents/INF1070/TP2/INF1070-TP2/backup/backup-dbs /home/frantz256255/Documents/INF1070/TP2/INF1070-TP2/backup/mydbs
0 */4 * * * /home/frantz256255/Documents/INF1070/TP2/INF1070-TP2/backup/backup-dbs /home/frantz256255/Documents/INF1070/TP2/INF1070-TP2/backup/mydbs
59 23 * * * /home/frantz256255/Documents/INF1070/TP2/INF1070-TP2/backup/backup-dbs /home/frantz256255/Documents/INF1070/TP2/INF1070-TP2/backup/mydbs
```