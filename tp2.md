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
Le script est diviser en deux parties. La première partie avec un bloc `if...fi`, suivi d'un 2e bloc `if...else...fi`.

Le premier bloc `if...fi` possède une condition `$# -ne 1`, qui valide si le nombre arguments passé en paramètre est différent de 1. Rappellons-nous que le nom du script ne figure pas dans la somme des paramètres. Si nous passons 0 paramètre ou 2 paramètres et plus, la condition sera vraie donc le message `Fournir un nom en parametre` sera affiché via la commande `echo` et un code de retour 1 sera associé à la sortie du script via la commande `exit`. Le code de retour 1 représente, généralement une erreur d'éxecution. 

Si nous avons un paramètre, on passe au prochain bloc `if...else...fi`. On commence par valider si le paramètre `$1` est un répertoire avec l'option `-d`. Ici, l'option est associé au test de la condition. Si le répertoire existe, on sortira du script avec un code de retour 0, qui veut dire `succès`. Sinon, le répertoire n'existe pas et nous allons rentrer dans une récursivité.

Cette récursivité va rappeller le script ainsi que le paramètre `"$0" dirname $1`. Le nombre de récursivités va être égale au nombre de répertoires parents + le répertoire qu'on veut créer. Au moment de la dernière récursivité, la commande `"$0" dirname $1` va retirer le répertoire et garder le répertoire courant `.`, lorsqu'il ne trouvera plus de `/`. 

Biensûr, le répertoire courant `.` existe, donc la condition du 2e `if` sera vraie donc fera un exit avec un code de retour 0. On remontera chacunes des autres récursivités en créant le répertoire désigné avec la commande `mkdir $1`, sauf si le répertoire voulu existe déjà et dans ce cas, nous allons faire une sortie avec un code de succès (0) de la présente récursivité et passer à la prochaine.

#### Exemples d'appels du script

##### Situation avec 0 paramètre :

```sh
mystere/mystere.sh
```

Résultat de l'exécution du script :

La première condition est vraie car le nombre de paramètres est différent de 1, donc le script s'arrête en faisant une sortie avec un code d'errreur 1


##### Situation avec 1 paramètre qui contient `dossier` comme paramètre :

```sh
mystere/mystere.sh dossier
```

Résultat de l'exécution du script :

La première condition est fausse, car on a un paramètre. Le répertoire `dossier` sera vérifié dans le deuxième `if` qui n'existe pas, donc on passera à la condition du `else`. On fait un appel à la récursivité grâce à `"$0" dirname $1` qui va trouver le répertoire courant du script `.` qui mettra fin à la récursivité, comme le répertoire `.` existe, donc il y aura une sortie du sous script avec un code de retour de `succès`. En remonte ensuite vers le haut pour créer le répertoire `dossier`. 


##### Situation avec 1 paramètre qui contient encore une fois `dossier` comme paramètre mais le répertoire existe déjà :

```sh
mystere/mystere.sh dossier
```

Résultat de l'exécution du script :

La première condition est fausse, car on a un paramètre. Le répertoire `dossier` sera vérifié dans le deuxième `if` qui existe cette fois ci. On va sortir du script avec un code de retour 0.


##### Situation avec 1 paramètre qui contient `dossier/dossier2` comme paramètre :

```sh
mystere/mystere.sh dossier/dossier2
```

Résultat de l'exécution du script :

La première condition est fausse, car on a un paramètre. Le répertoire `dossier/dossier2` sera vérifié dans la deuxième condition du `if` qui n'existe pas, donc on passera à la condition du `else`. On commence à partir de ce moment là, la récursivité, jusqu'au moment de trouver un répertoire existant. La récursivité sera arrêtée, on va remonter la récursivité et créer le répertoire de chaque sous script et le script origine appellé, si nécessaire.


## Solution de l'exercice 2

### État de l'exercice: résolu, partiellement résolu ou non résolu

Décrire votre solution ici.



## Solution de l'exercice 3

### État de l'exercice: résolu, partiellement résolu ou non résolu

Décrire votre solution ici.



## Solution de l'exercice 4

### État de l'exercice: résolu, partiellement résolu ou non résolu

Décrire votre solution ici.



## Solution de l'exercice 5

### État de l'exercice: résolu, partiellement résolu ou non résolu

Décrire votre solution ici.



## Solution de l'exercice 6

### État de l'exercice: résolu, partiellement résolu ou non résolu

Décrire votre solution ici.
