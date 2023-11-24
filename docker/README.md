# `containers-admin` Création d'une nouvelle image à sauvegarder dans DockerHub


Cet exercice consiste à créer modifier un conteneur et à le sauvegarder comme une image dans votre compte DockerHub.

Pour toutes les questions qui suivent, vous devez fournir la commande ou la procédure d'installation ainsi que le résultat affiché sur la sortie standard pour chaque commande.

Ne pas afficher les résultats des commandes de la question d).

a) Créer un compte dans **DockerHub** (*https://hub.docker.com/*)

b) Récupérer sur votre VM Linux, à partir de DockerHub, une **image Ubuntu de base** et afficher cette image

c) Créer un conteneur à partir de l'image de base Ubuntu et nommer le `containers-admin`

Dans le conteneur :

d) Installer les outils suivants dans le conteneur `containers-admin` et affciher leurs localisations dans le système de fichiers, à l'aide d'*une seule commande*

 - `lsb-release`
 - `curl`
 - `gpg`
 - `gcc`
 - `libjemalloc-dev`
 - `pkg-config`
 - `make`

e) Installer la commande `redis-cli` et afficher sa version

Vous devez :

- télécharger le tarball `redis-stable.tar.gz`, dans le répertoire `/tmp` à partir du site `redis.io`
- compiler le code source, à l'aide de la commande `make`, dans le répertoire `redis-stable`
- afficher toutes les lignes de compilation qui viennent àprès les lignes suivantes :

`...`\
`make[3]: Leaving directory '/tmp/redis-stable/deps/jemalloc'`\
`make[2]: Leaving directory '/tmp/redis-stable/deps'`\
`    CC adlist.o`

- copier l'exécutable `redis-cli` dans le répertoire `/usr/local/bin`
- afficher la version de la commande `redis-cli`

Dans votre VM :

f) Sauvegarder, dans votre compte DockerHub, le conteneur `containers-admin` comme une nouvelle image `containers-admin:v1`


## Description et fonctionnement

L'objectif de cet exercice est de :

1) télécharger une image Ubuntu de base
2) exécuter cette image comme conteneur
3) modifier le conteneur pour y installer de nouveaux paquets et logiciels
4) sauvegarder le conteneur modifié comme une nouvelle image dans votre compte DockerHub.
5) donner l'URL de votre nouvelle image dans DockerHub

## Livrables
Vous devez remettre :
- toutes le commandes ainsi que leurs affichage dans la sortie standard
- expliquer ce que fait chacune de vos commandes
- donner l'URL de votre nouvelle image dans DockerHub
