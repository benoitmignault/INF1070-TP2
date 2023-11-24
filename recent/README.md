# `recent` les fichiers récemment ouverts

Dans cet exercice, vous devez créer un script nommé `recent` qui donnera les fichiers récemment ouverts dans votre machine en ce basant sur le fichier `recently-used.xbel` de l'environnement GNOME.

## Description et fonctionnement

Ce script est en `bash` et prend au moins 2 et au plus 5 arguments.

- Deux arguments **obligatoires** pour indiquer le chemin d'un fichier `recently-used.xbel`
    - premier argument est une option `-f`
    - suivi d'un deuxième argument consistant en un chemin vers un fichier `recently-used.xbel`
- Deux arguments **optionnels** pour indiquer le nombre de fichiers récemment ouverts que l'utilisateur voudrait afficher
    - premier argument est une option `-n`
    - suivi d'un deuxième argument consistant en un nombre entier strictement positif
    - par défaut l'outil affiche les 10 derniers fichiers ouverts, si ces deux arguments ne sont pas présent
- Une option **bonus** `-c` pour corriger les caractères en hexadécimal
    - par exemple, un répertoire `Téléchargements` apparaitra ainsi `T%C3%A9l%C3%A9chargements` ou `%C3` et `%A9` (`%C3%A9`) sont deux caractères hexadécimaux qui, utilisés ensemble, représentent `é` (voir la table [UTF-8](https://www.charset.org/utf-8))
    - voir l'exemple 3 plus bas pour des exemples d'exécution 
- Attention l'ordre de saisi de ces arguments varie. Voir les exemples plus bas
- Les arguments sont séparés par un ou plusieurs espaces

### Usage

```sh
./recent -f CHEMIN [-n N|-c]
```
Par exemple, les exécutions suivantes sont valides
```sh
./recent -f recently-used.xbel
./recent -n 4 -f recently-used.xbel
./recent -f ~/.local/share/recently-used.xbel -n 14
./recent -c -f ~/.local/share/recently-used.xbel -n 40
./recent -c -n 33 -f /home/onizuka/.local/share/recently-used.xbel
```
Par contre, les exécutions suivantes ne sont pas valides et doivent être détectées. Le script `recent` doit s'arrêter, afficher un message d'erreur adéquat et retourner une valeur d'erreur
```sh
./recent
./recent -n 4
./recent -f ~/.local/share/recently-used.xbel -n X1
./recent -f /chemin/qui/n/existe/pas/recently-used.xbel -n 40
./recent -f -n 
```
- Les valeurs de retour en cas d'erreur sont les suivantes
    - si le script est lancé avec moins de 2 arguments ou plus que 5 arguments, retourner 1
    - si l'option `-f` est suivi d'un chemin non valide (le fichier n'existe pas, n'est pas accessible, etc.), retourner 2
        - si le nombre d'arguments est correct (2 à 5 arguments), mais pas de nom fichier fourni, retourner également 2
    - si l'option `-n` est suivi d'autre chose qu'un nombre entier strictement positif, retourner 3
    - si une option autre que `-f`, `-n` ou `-c` a été saisie, retourner 4
    - si un argument extra (ni une option, ni un chemin, ni un nombre) est présent, retourner 5 
- Noter que dans tous les cas plus haut, le script `recent` doit s'arrêter et aucun traitement ne sera effectué
- Les messages d'erreur doivent être afficher sur la sortie standard d'erreur
- Voir l'exemple 2 plus bas pour des exemples d'exécution.

### fonctionnement
Le fichier `recently-used.xbel` est au formal [XML](https://fr.wikipedia.org/wiki/Extensible_Markup_Language), vous n'avez pas à connaitre/comprendre ce format pour pouvoir faire cet exercice.
Vous pouvez vous concentrer sur les lignes de la forme suivante
```xml
<bookmark href="file:///home/onizuka/Bureau/1.pdf" added="2022-10-21T16:45:51.949233Z" modified="2022-10-21T16:45:57.892231Z" visited="2023-07-21T16:45:51.949235Z">
```
qui indique les informations suivantes
- `href="file:///home/onizuka/Bureau/1.pdf"` le nom d'un fichier
- `visited="2023-07-21T16:45:51.949235Z"` la date à laquelle le fichier indiqué dans `href="file:///home/onizuka/Bureau/1.pdf"` a été ouvert la dernière fois
- vous pouvez ignorer toutes les autres lignes/entrées

En vous basant donc sur ces lignes, vous pouvez extraire les noms des fichiers (ce qui suit `href="file://`) et la dernière date d'ouverture de ce fichier (`visited=`), les trier en fonction des dates d'ouverture et afficher le nombre demandé de fichiers ouverts récement (du plus récent affiché en premier, au plus ancien).

## Exemples d'exécution

Un exemple de fichier `recently-used.xbel` est joint à cet exercice pour vos tests.

<p>

<details>

<summary>Exemple 1</summary>

Usage minimal, avec l'option `-f` et un chemin vers un fichier `recently-used.xbel`. 
Ça affiche donc les 10 derniers fichiers ouverts par défaut. Le plus récent doit être en premier.
Notez que seul le nom du fichier est affiché (sans le `href="file://` ni les doubles guillements `"`)

<pre>
$ ./recent -f recently-used.xbel 
/home/onizuka/Images/Captures%20d%E2%80%99%C3%A9cran/grep.png
/home/onizuka/Images/Captures%20d%E2%80%99%C3%A9cran/d.png
/home/onizuka/Images/Captures%20d%E2%80%99%C3%A9cran/Capture%20d%E2%80%99%C3%A9cran%20du%202023-11-02%2021-19-38.png
/home/onizuka/Images/Captures%20d%E2%80%99%C3%A9cran/Capture%20d%E2%80%99%C3%A9cran%20du%202023-11-02%2021-18-21.png
/home/onizuka/Bureau/INF1070-intra/cr/corrections/pdf/0001.pdf
/home/onizuka/Bureau/INF1070-intra/DOC-indiv-solution.pdf
/home/onizuka/Bureau/INF1070-intra/DOC-sujet.pdf
/home/onizuka/Bureau/233-intra%203./233-intra/cr/corrections/pdf/0142.pdf
/home/onizuka/Bureau/Enseignement/INF1070/Enregistrements/2023-10-29%2020-01-02.mkv
/home/onizuka/Bureau/233-intra%203./233-intra/cr/corrections/pdf/0150.pdf
</pre>

Les deux exécutions suivantes donnent exactement le même résultat.

<pre>
$ ./recent -f recently-used.xbel -n 5
/home/onizuka/Images/Captures%20d%E2%80%99%C3%A9cran/grep.png
/home/onizuka/Images/Captures%20d%E2%80%99%C3%A9cran/d.png
/home/onizuka/Images/Captures%20d%E2%80%99%C3%A9cran/Capture%20d%E2%80%99%C3%A9cran%20du%202023-11-02%2021-19-38.png
/home/onizuka/Images/Captures%20d%E2%80%99%C3%A9cran/Capture%20d%E2%80%99%C3%A9cran%20du%202023-11-02%2021-18-21.png
/home/onizuka/Bureau/INF1070-intra/cr/corrections/pdf/0001.pdf
$ ./recent -n 5 -f recently-used.xbel
/home/onizuka/Images/Captures%20d%E2%80%99%C3%A9cran/grep.png
/home/onizuka/Images/Captures%20d%E2%80%99%C3%A9cran/d.png
/home/onizuka/Images/Captures%20d%E2%80%99%C3%A9cran/Capture%20d%E2%80%99%C3%A9cran%20du%202023-11-02%2021-19-38.png
/home/onizuka/Images/Captures%20d%E2%80%99%C3%A9cran/Capture%20d%E2%80%99%C3%A9cran%20du%202023-11-02%2021-18-21.png
/home/onizuka/Bureau/INF1070-intra/cr/corrections/pdf/0001.pdf
</pre>

</details>

</p>

<p>

<details>

<summary>Exemple 2</summary>

Valeur de retour pour moins de 2 arguments ou plus que 5 arguments.

<pre>
$ ./recent
./recent : le nombre d'arguments n'est pas correct
$ echo $?
1
$ ./recent -f
./recent : le nombre d'arguments n'est pas correct
$ echo $?
1
$ ./recent recently-used.xbel
./recent : le nombre d'arguments n'est pas correct
$ echo $?
1
</pre>

Valeur de retour pour l'option `-f` et le chemin pour un fichier `recently-used.xbel`.

<pre>
$ ./recent -f fail
./recent : 'fail' est un nom de fichier non valide ou introuvable
$ echo $?
2
$ ./recent -n 4
./recent : aucun nom de fichier n'a été fourni
$ echo $?
2
$ ./recent -f /home/moot
./recent : '/home/moot' est un nom de fichier non valide ou introuvable
$ echo $?
2
</pre>

Valeur de retour pour l'option `-n` et le nombre entier `N`.

<pre>
$ ./recent -f recently-used.xbel -n 
./recent :  doit être un nombre entier strictement supérieur à 0
$ echo $?
3
$ ./recent -f recently-used.xbel -n 10x
./recent : 10x doit être un nombre entier strictement supérieur à 0
$ echo $?
3
$ ./recent -f recently-used.xbel -n a7
./recent : a7 doit être un nombre entier strictement supérieur à 0
$ echo $?
3
</pre>

Valeur de retour pour une option inconnue.

<pre>
$ ./recent -f recently-used.xbel -x
./recent : option inconnue
$ echo $?
4
$ ./recent -- -f recently-used.xbel
./recent : option inconnue
$ echo $?
4
</pre>

Valeur de retour pour un argument extra.

<pre>
$ ./recent -f recently-used.xbel abcd
./recent : argument inconnu
$ echo $?
5
$ ./recent -f recently-used.xbel recently-used.xbel
./recent : argument inconnu
$ echo $?
5
</pre>

</details>

</p>

<details>

<summary>Exemple 3</summary>

L'option `-c` pour la correction des caractères hexadécimaux.

<pre>
$ ./recent -f recently-used.xbel -c
/home/onizuka/Images/Captures d’écran/grep.png
/home/onizuka/Images/Captures d’écran/d.png
/home/onizuka/Images/Captures d’écran/Capture d’écran du 2023-11-02 21-19-38.png
/home/onizuka/Images/Captures d’écran/Capture d’écran du 2023-11-02 21-18-21.png
/home/onizuka/Bureau/INF1070-intra/cr/corrections/pdf/0001.pdf
/home/onizuka/Bureau/INF1070-intra/DOC-indiv-solution.pdf
/home/onizuka/Bureau/INF1070-intra/DOC-sujet.pdf
/home/onizuka/Bureau/233-intra 3./233-intra/cr/corrections/pdf/0142.pdf
/home/onizuka/Bureau/Enseignement/INF1070/Enregistrements/2023-10-29 20-01-02.mkv
/home/onizuka/Bureau/233-intra 3./233-intra/cr/corrections/pdf/0150.pdf
</pre>

La position de l'option `-c` n'est pas importante (du moment que ce n'est pas entre `-f` et son chemin ou entre `-n` et le nombre entier `N`)

<pre>
$ ./recent -n 5 -c -f recently-used.xbel
/home/onizuka/Images/Captures d’écran/grep.png
/home/onizuka/Images/Captures d’écran/d.png
/home/onizuka/Images/Captures d’écran/Capture d’écran du 2023-11-02 21-19-38.png
/home/onizuka/Images/Captures d’écran/Capture d’écran du 2023-11-02 21-18-21.png
/home/onizuka/Bureau/INF1070-intra/cr/corrections/pdf/0001.pdf
</pre>

</details>

</p>


## Contraines et indications
- Vous avez droit à toutes les fonctionnalités de `bash` et toutes les commandes présentes dans une distribution Ubuntu classique.
    - Pensez aux expressions régulières pour vos validations et vos extractions.
- Votre script ne doit nécessiter aucune nouvelle installation de commande quelle qu'elle soit.
- Vous n'avez pas à valider le fomat `XML` des fichiers `recently-used.xbel`, vous pouvez considérer que les fichiers qui serviront à tester votre script ont un fomat valide (c'est-à-dire un format identique au fichier `recently-used.xbel` fourni en exemple).
    - Vous devez seulement vérifier que le chemin fourni est bien un fichier et qu'il peut être lu.
