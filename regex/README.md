# Les expréssions régulières `regex`

Les but de ce exercice est de vous familiariser avec les expressions régulières.

## Description et fonctionnement

Pour chacun des points suivants, en expliquant votre démarche, proposez l'expression régulière permettant de 
rechercher dans le fichier **fichier** les lignes correspondantes.

Vous devez fournir votre solution et votre démarche dans un fichier nommé `regex.md`

1. Chercher toutes les lignes commençant par `a` ou `A`. 
2. Chercher toutes les lignes finissant par `rs`. 
3. Chercher toutes les lignes commençant par une majuscule et contenant au moins un chiffre.
4. Chercher toutes les lignes commençant par `B`, `E` ou `Q`.
5. Chercher toutes les lignes ne finissant pas par un signe de ponctuation suivants :
    point, virgule, point-virgule, deux-points, point d'interrogation, point d'exclamation.
6. Chercher tous les mots dont la seconde lettre est un `r`.
7. Chercher tout numéro de téléphone correspondant à l'une des formes valides citées en exemple (voir **cas de test** plus bas).
8. Chercher toutes les **dates valides** sous la forme `AAAA-MM-DD` ou `AAAA-M-D` ou `AAAA-MM-D` ou `AAAA-M-DD` considérant que :
   - Le mois de `févier` (peu importe l'année) compte 28 jours.
   - Les mois de `janvier`, `mars`, `mai`, `juillet`, `août`, `octobre`, `décembre` comptent 31 jours.
   - Les mois d'`avril`, `juin`, `septembre`, `novembre` comptent 30 jours.

9. Chercher et ne capturer que les **schémas** (`https` ou `ftp`) des `URLs` dont l'autorité est de la forme :
    - 3 caractères alphabétiques identiques, 
    - suivi d'un point, 
    - suivi d'un ou plusieurs caractères alphanumériques
    - suivi d'un point
    - suivi de deux ou trois caractères alphabétiques. 

      - Exemple d'autorité valide : `www.afferage.com`, `mmm.uqamlabunix.ca`, `rrr.exemple.net`

      - Note : Seul les deux shémas sus-indiqués seront capturés.

## Exemple solution 

<p>
<details>
<summary>Exemple 1</summary>

Il faut indiquer que l'on veut le début de la ligne, avec le chapeau, afin de préciser que la ligne
commence par un `a` minuscule ou majuscule, il y a deux façons de faire :
- Utiliser l'option `-i` qui fait ignorer la différence entre les majuscules et le minuscules.
- Dire que l'on cherche un `a` ou un `A` en utilisant les crochets.
Enfin, il faut protéger les signes contre le shell, pour qu'il ne les interprète pas; on met donc
l'expression entre apostrophes.

Il faut donc écrire :

<pre>
grep -i '^a' fichier
ou
grep '^[aA]' fichier
</pre>

</details>

</p>

## Cas de test

### 1.
    Cas valide
        `abréger` `Alexandre`
    Cas valide
        `INF1070`
### 2.
    Cas valide
        ```
        Abattoirs
        Abatteurs
        ```
    Cas invalide
        `ABDOFESSIERS`

### 3.
    Cas valide
        `INF1070`   `Mgl7760`
    Cas invalide
        `inf1070` `Margo-lamule`

### 4.
    Cas valide
        `Baba` `Bébé` `Ecchymotique`  `Eczéma` `Quadrangulaire`
    Cas invalide
        `École` `bébé`  `quatre`

### 5.
    Cas valide
        `Ceci est une démo` `Salut` `Comment`  `et ensuite` `Belle finission`
    Cas invalide
        `Ceci est une démo.` `Salut !` `Comment ?`  `et ensuite :` `Belle finission;`

### 6.
    Cas valide
        `Arbre` `arachide` `Arabes` 
    Cas invalide
        `Bonjour` `Université` `Montréal` 

### 7. 
    Cas valide
        `(999)999-9999`  `+9(999)999-9999`  `+99(999)999-9999`  `9(999)999-9999` `99(999)999-9999` `(999)999.9999`
        `(999)999 9999`  `99 (999)999-9999`  `+99 (999)999-9999`  `999999-9999`
    Cas valide
        Toutes les autres possibilités sont invalides

### 8.
    Cas valide
        `9999-12-20`  `9999-2-2`  `2023-12-2`  `2023-9-21` `2021-02-28`  `2023-04-30`  `2023-01-31`
    Cas invalide
        `2020-12-32`  `2020-13-12` `2020-02-29`  `2023-04-31`

### 9.
    Cas valide
        `https://www.welovedevs.com` (seulement https est capturé)  
        `ftp://ttt.fileZilla.com`    (seulement ftp est capturé)
    Cas invalide
        `http://www.welovedevs.com`  (aucune capture)
        `https://abc.download.net`   (aucune capture)
