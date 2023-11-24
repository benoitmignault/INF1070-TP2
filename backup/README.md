# `backup-dbs` sauvegarder des bases de données SQLite3

Une base de données relationnelle SQLite3 est stockée dans un seul fichier ayant l'extension `.db` (par exemple : mydb1.db, mydb2.db, ...).

Pour travailler avec les bases de données SQLite3, il faudra en premier installer les paquets `sqlite3` et `sqlite3-tools`.

Dans cet exercice, vous devez :

**I)** Créer un script nommé `backup-dbs` qui va sauvegarder sous forme d'archive compressée toutes les bases de données SQLite3 situées dans le répertoire passé en argument.

Pour ce faire, vous devez procéder en trois étapes successives :
1) exporter chacune des bases de données sous format sql dans le répertoire `./sql`

La commande pour exporter mydb1, par exemple, est la suivante : `sqlite3 db1.db .dump > db1-YYYYMMDDHHMM.sql`

où YYYY-MM-DD correspond à la date du jour (YYYY: année, MM : mois, DD : jour, HH : heure, MM : minutes).

Attention : Les noms des bases de données doivent être récupérés dynamiquement en lisant le répertoire passé en argument et non invoqués statiquement dans le script.

2) archiver tous les fichiers SQL, compresser le fichier archive puis déposer le resultat dans le répertoire `./mybackups`.
Le fichier sauvegarde devra avoir la nomenclature suivante : `mydbs-YYYYMMDDHHMM.tar.gz`.

3) supprimer les fichiers SQL de toutes les bases de données (ceux créés à l'étape 1).

**II)** Utiliser le script développé dans la partie I) pour mettre en place un mécanisme de planification de tâches (CRON) afin de *sauvegarder automatiquement toutes les bases de données* à un moment précis de la journée. La sauvegarde doit être faite périodiquement pour chacun des cas suivants :
- toutes les minutes (pour faire des tests)
- toutes les 15 minutes
- toutes les heures
- toutes les 4 heures
- une fois par jour à 23h59m

## Description et fonctionnement

Ce script est en `sh` et prend un seul argument qui correspond au répertoire contenant la liste des bases de données SQLite3 ayant l'extension `.db`.

### Usage

```sh
./backup-dbs SQLITE3_DBS_DIR
```

- QLITE3_DBS_DIR est un répertoire contenant un certain nombre de bases de données SQLite3 ayant une extension .db
- s'il n'y a pas d'arguments ou bien il y a plus qu'un argument, afficher le message "Usage: ./backup-dbs QLITE3_DBS_DIR" et quitter le script.
- s'il n'y a pas de bases de données SQLite3 (extension .db) dans le répertoire passé en argument (SQLITE3_DBS_DIR), alors afficher le message suivant : "Aucune base de données à sauvegarder dans le répertoire SQLITE3_DBS_DIR".

### Fonctionnement

Le script `backup-dbs` va simplement parcourir le répertoire passé en argument, sauvegarder chaque base de données qui s'y trouve au format SQL puis créer une archive compressée et la déposer dans le répertoire `./mybackups`.

## Exemples d'exécution

<p>
<details>
<summary>Exemple 1</summary>

<pre>
$ ./backup-dbs
Usage: ./backup-dbs QLITE3_DBS_DIR
</pre>

</details>
</p>

<p>
<details>
<summary>Exemple 2</summary>

<pre>
$ ./backup-dbs ~/mydbs ~/nodbs
Usage: ./backup-dbs QLITE3_DBS_DIR
</pre>

</details>
</p>

<p>
<details>
<summary>Exemple 3</summary>

<pre>
$ ls ~/nodbs
employés.csv  employés.pdf

$ ./backup-dbs ~/nodbs
Aucune base de données à sauvegarder dans le répertoire ~/nodbs
</pre>

</details>
</p>

<p>
<details>
<summary>Exemple 4</summary>

<pre>
$ ls ~/mydbs
books.db uqam.db

$ ./backup-dbs ~/mydbs
Export de books.db sous format SQL ...
Export de uqam.db sous format SQL ...
Archivage et compression dans ~/mybackups/mydbs-202311132247.tar.gz ...
Supression des fichiers SQL de toutes les bases de données ...

$ ls ~/mybackups
[...]
mydbs-202311162346.tar.gz
</pre>

</details>
</p>

## Contraines et indications
- Vous avez droit à toutes les fonctionnalités de `sh` et toutes les commandes présentes dans une distribution Ubuntu classique.
- Vous devez installer les paquets `sqlite3` et `sqlite3-tools` pour pouvoir sauvegarder, sous format sql, les bases de données SQLite3.
- Le format de la date `YYYYMMDDHHMM` ne doit pas changer à l'intérieur du script (c-à-d entre la premiere utilisation et les utilisations subséquentes).

## Livrables
Vous devez remettre :
- le script développé dans la partie I et 
- le contenu de la CRON de la partie II.
