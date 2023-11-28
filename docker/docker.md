# Voici les commandes pour l'exercice Docker

1. Récupération de la version la plus récente d'Ubuntu via le registre des image Docker Hub.

```bash
sudo docker pull ubuntu:latest
```

## Résultat de la commande précédente :

```
latest: Pulling from library/ubuntu
aece8493d397: Pull complete 
Digest: sha256:2b7412e6465c3c7fc5bb21d3e6f1917c167358449fecac8176c6e496e5c1f05f
Status: Downloaded newer image for ubuntu:latest
docker.io/library/ubuntu:latest
```


2. Affichage des images disponibles pour la création de futurs conteneurs.

```bash
sudo docker images
```

## Résultat de la commande précédente :

```
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       latest    e4c58958181a   7 weeks ago   77.8MB
```


3. Création d'un conteneur avec l'image de bbase que nous avons récupére du dépot des images `Ubuntu`.

```bash
sudo docker run -it --name containers-admin ubuntu /bin/bash
```

## Résultat de la commande précédente :

```
root@ba2e39f6db12:/#
```


4. Afficher les locatisations des packages installés, à l'aide d'une seule commande.

```bash
dpkg -L lsb-release curl gpg gcc libjemalloc-dev pkg-config make
```

## Résultat de la commande précédente :

**Package : lsb-release**
```
/.
/usr
/usr/bin
/usr/bin/lsb_release
/usr/lib
/usr/lib/python2.7
/usr/lib/python2.7/dist-packages
/usr/lib/python3
/usr/lib/python3/dist-packages
/usr/share
/usr/share/bug
/usr/share/bug/lsb-release
/usr/share/doc
/usr/share/doc/lsb-release
/usr/share/doc/lsb-release/README.Debian
/usr/share/doc/lsb-release/changelog.gz
/usr/share/doc/lsb-release/copyright
/usr/share/man
/usr/share/man/man1
/usr/share/man/man1/lsb_release.1.gz
/usr/share/pyshared
/usr/share/pyshared/lsb_release.py
/usr/lib/python2.7/dist-packages/lsb_release.py
/usr/lib/python3/dist-packages/lsb_release.py
```
**Package : curl**
```
/.
/usr
/usr/bin
/usr/bin/curl
/usr/share
/usr/share/doc
/usr/share/doc/curl
/usr/share/doc/curl/copyright
/usr/share/man
/usr/share/man/man1
/usr/share/man/man1/curl.1.gz
/usr/share/zsh
/usr/share/zsh/vendor-completions
/usr/share/zsh/vendor-completions/_curl
/usr/share/doc/curl/NEWS.Debian.gz
/usr/share/doc/curl/changelog.Debian.gz
```
**Package : gpg**
```
/.
/usr
/usr/bin
/usr/bin/gpg
/usr/share
/usr/share/doc
/usr/share/doc/gpg
/usr/share/doc/gpg/copyright
/usr/share/man
/usr/share/man/man1
/usr/share/man/man1/gpg.1.gz
/usr/share/doc/gpg/NEWS.Debian.gz
/usr/share/doc/gpg/changelog.Debian.gz
```
**Package : gcc**
```
/.
/usr
/usr/bin
/usr/bin/c89-gcc
/usr/bin/c99-gcc
/usr/lib
/usr/lib/bfd-plugins
/usr/share
/usr/share/doc
/usr/share/doc/cpp
/usr/share/man
/usr/share/man/man1
/usr/share/man/man1/c89-gcc.1.gz
/usr/share/man/man1/c99-gcc.1.gz
/usr/bin/gcc
/usr/bin/gcc-ar
/usr/bin/gcc-nm
/usr/bin/gcc-ranlib
/usr/bin/gcov
/usr/bin/gcov-dump
/usr/bin/gcov-tool
/usr/bin/x86_64-linux-gnu-gcc
/usr/bin/x86_64-linux-gnu-gcc-ar
/usr/bin/x86_64-linux-gnu-gcc-nm
/usr/bin/x86_64-linux-gnu-gcc-ranlib
/usr/bin/x86_64-linux-gnu-gcov
/usr/bin/x86_64-linux-gnu-gcov-dump
/usr/bin/x86_64-linux-gnu-gcov-tool
/usr/lib/bfd-plugins/liblto_plugin.so
/usr/share/doc/cpp/README.Bugs
/usr/share/doc/gcc
/usr/share/man/man1/gcc-ar.1.gz
/usr/share/man/man1/gcc-nm.1.gz
/usr/share/man/man1/gcc-ranlib.1.gz
/usr/share/man/man1/gcc.1.gz
/usr/share/man/man1/gcov-dump.1.gz
/usr/share/man/man1/gcov-tool.1.gz
/usr/share/man/man1/gcov.1.gz
/usr/share/man/man1/x86_64-linux-gnu-gcc-ar.1.gz
/usr/share/man/man1/x86_64-linux-gnu-gcc-nm.1.gz
/usr/share/man/man1/x86_64-linux-gnu-gcc-ranlib.1.gz
/usr/share/man/man1/x86_64-linux-gnu-gcc.1.gz
/usr/share/man/man1/x86_64-linux-gnu-gcov-dump.1.gz
/usr/share/man/man1/x86_64-linux-gnu-gcov-tool.1.gz
/usr/share/man/man1/x86_64-linux-gnu-gcov.1.gz
```
**Package : libjemalloc-dev**
```
/.
/usr
/usr/bin
/usr/bin/jeprof
/usr/include
/usr/include/jemalloc
/usr/include/jemalloc/jemalloc.h
/usr/lib
/usr/lib/x86_64-linux-gnu
/usr/lib/x86_64-linux-gnu/libjemalloc.a
/usr/lib/x86_64-linux-gnu/libjemalloc_pic.a
/usr/lib/x86_64-linux-gnu/pkgconfig
/usr/lib/x86_64-linux-gnu/pkgconfig/jemalloc.pc
/usr/share
/usr/share/doc
/usr/share/doc/libjemalloc-dev
/usr/share/doc/libjemalloc-dev/copyright
/usr/share/doc/libjemalloc-dev/jemalloc.html
/usr/share/doc-base
/usr/share/doc-base/libjemalloc-dev.libjemalloc-dev
/usr/share/man
/usr/share/man/man1
/usr/share/man/man1/jeprof.1.gz
/usr/share/man/man3
/usr/share/man/man3/jemalloc.3.gz
/usr/lib/x86_64-linux-gnu/libjemalloc.so
/usr/share/doc/libjemalloc-dev/README
/usr/share/doc/libjemalloc-dev/changelog.Debian.gz
```
**Package : pkg-config**
```
/.
/etc
/etc/dpkg
/etc/dpkg/dpkg.cfg.d
/etc/dpkg/dpkg.cfg.d/pkg-config-hook-config
/usr
/usr/bin
/usr/bin/pkg-config
/usr/bin/x86_64-pc-linux-gnu-pkg-config
/usr/lib
/usr/lib/pkg-config.multiarch
/usr/lib/pkgconfig
/usr/share
/usr/share/aclocal
/usr/share/aclocal/pkg.m4
/usr/share/doc
/usr/share/doc/pkg-config
/usr/share/doc/pkg-config/AUTHORS
/usr/share/doc/pkg-config/NEWS.gz
/usr/share/doc/pkg-config/README
/usr/share/doc/pkg-config/changelog.Debian.gz
/usr/share/doc/pkg-config/copyright
/usr/share/doc/pkg-config/pkg-config-guide.html
/usr/share/man
/usr/share/man/man1
/usr/share/man/man1/pkg-config.1.gz
/usr/share/pkg-config-crosswrapper
/usr/share/pkg-config-dpkghook
/usr/share/pkgconfig
```
**Package : make**
```
/.
/usr
/usr/bin
/usr/bin/make
/usr/bin/make-first-existing-target
/usr/include
/usr/include/gnumake.h
/usr/share
/usr/share/doc
/usr/share/doc/make
/usr/share/doc/make/ABOUT-NLS.gz
/usr/share/doc/make/AUTHORS
/usr/share/doc/make/Explanations.gz
/usr/share/doc/make/NEWS.Debian.gz
/usr/share/doc/make/NEWS.gz
/usr/share/doc/make/README.Debian-Source
/usr/share/doc/make/README.customs.gz
/usr/share/doc/make/README.gz
/usr/share/doc/make/changelog.Debian.gz
/usr/share/doc/make/copyright
/usr/share/man
/usr/share/man/man1
/usr/share/man/man1/make-first-existing-target.1.gz
/usr/share/man/man1/make.1.gz
/usr/bin/gmake
/usr/share/man/man1/gmake.1.gz
```


5. Installation du package `redis-cli`

+ Télécharger le package de la version la plus stable.

```bash
curl -o /tmp/redis-stable.tar.gz https://download.redis.io/redis-stable.tar.gz?_gl=1*uld02z*_ga*MjA2MDM0NTk0OC4xNzAxMDU3MTE0*_ga_8BKGRQKRPV*MTroot@ba2e39f6db12:/#
```

## Résultat de la commande précédente :

```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 3396k  100 3396k    0     0  4453k      0 --:--:-- --:--:-- --:--:-- 4451k
```

+ Extraire les fichiers du fichier

```bash
tar xzf /tmp/redis-stable.tar.gz -C /tmp
```

## Résultat de la commande précédente :

```
Aucun résultat sur STDOUT
```

+ Complier le code source, à l'intérieur du répertoire `/tmp/redis-stable`

```bash
make
```

## Résultat de la commande précédente :

```
[...]
make[3]: Leaving directory '/tmp/redis-stable/deps/jemalloc'
make[2]: Leaving directory '/tmp/redis-stable/deps'
    CC adlist.o
    CC quicklist.o
    CC ae.o
    CC anet.o
    CC dict.o
[...]
```

+ Copier l'exécutable vers le répertoire `/usr/local/bin`

```bash
cp redis-cli /usr/local/bin
```

## Résultat de la commande précédente :

```
Aucun résultat sur STDOUT
```

+ Afficher la version de la commande`redis-cli`

```bash
redis-cli --version
```

## Résultat de la commande précédente :

```
redis-cli 7.2.3
```


6. Exporter la nouvelle image de notre conteneur dans le compte DockerHub.

+ Attribuer un nom à la nouvelle version de notre image.

```bash
sudo docker tag ubuntu hc591017/containers-admin:v1
```

## Résultat de la commande précédente :

```
Aucun résultat sur STDOUT
```

+ Connexion à notre compte Docker-Hub.

```bash
sudo docker login
```

## Résultat de la commande précédente :

```
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: hc591017
Password: 
WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```

+ Exportation de notre image à notre compte Docker Hub.

```bash
sudo docker push hc591017/containers-admin:v1
```

## Résultat de la commande précédente :

```
The push refers to repository [docker.io/hc591017/containers-admin]
256d88da4185: Mounted from library/ubuntu 
v1: digest: sha256:c0eef2c2053b7e7a644da62acce5c26fdd655d581d3e52007bb97f567fbcd444 size: 529
```