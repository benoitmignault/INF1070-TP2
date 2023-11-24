# `lsexec` lister les exécutables de `PATH`

Dans cet exercice, vous devez créer un petit script nommé `lsexec` qui va lister tous les fichiers exécutables dans les répertoires de la variable d'environnement `PATH`.

## Description et fonctionnement

Ce script est en `sh` et prend aucun argument. 
Si des arguments sont présent, ils sont simplement ignorés.

### Usage

```sh
./lsexec
```
Par exemple les exécutions suivantes sont valides
```sh
./lsexec
./lsexec abcd
./lsexec -n -f -c yryrfh
PATH=~ ./lsexec
```

### fonctionnement

Le script `lsexec` va simplement parcourir chaque répertoire présent dans la variable `PATH` et afficher les fichiers qui sont exécutables (droit `x`).

## Exemples d'exécution

<p>

<details>

<summary>Exemple 1</summary>

La sortie du script est tranquée pour des raisons d'espace.

<pre>
$ ./lsexec
/usr/local/bin/x11docker
/usr/sbin/ModemManager
/usr/sbin/NetworkManager
/usr/sbin/aa-remove-unknown
/usr/sbin/aa-status
[...]
/snap/bin/geckodriver
/snap/bin/obs-studio
/snap/bin/snap-store
/snap/bin/snap-store.ubuntu-software
/snap/bin/snap-store.ubuntu-software-local-file
</pre>

Vérification pour quelque fichiers avec la commande `ls -l`. 
Notez que les liens symbolique sont considérés comme exécutables et ils sont distincts de leurs fichiers liés.

<pre>
$ ls -l /usr/local/bin/x11docker /usr/sbin/ModemManager  /snap/bin/snap-store
lrwxrwxrwx 1 root root      13 aoû 11 11:04 /snap/bin/snap-store -> /usr/bin/snap
-rwxr-xr-x 1 root root  456719 oct  5 19:19 /usr/local/bin/x11docker
-rwxr-xr-x 1 root root 2198336 fév  8  2023 /usr/sbin/ModemManager
</pre>

On peut lister les exécutables de n'importe quel répertoire avec l'exécution suivantes

<pre>
$ PATH=~ ./lsexec
/home/moot/cdd
/home/moot/lsexec
/home/moot/recent
/home/moot/tmp
$ PATH=~/Bureau ./lsexec
</pre>

Notez que le répertoire `~/Bureau` ne contient aucun exécutable, par conséquent rien n'est affiché.

</details>

</p>


## Contraines et indications
- Vous avez droit à toutes les fonctionnalités de `sh` et toutes les commandes présentes dans une distribution Ubuntu classique.
    - Pensez aux nombreuses options de test de la commande `test` (ou `[ ]`).
- Votre script ne doit nécessiter aucune nouvelle installation de commande quelle qu'elle soit.
