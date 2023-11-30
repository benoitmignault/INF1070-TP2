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


4. Installer les outils suivants dans le conteneur containers-admin et afficher leurs localisations dans le système de fichiers.

* Avant d'installer les packages, on doit faire cette commande :

```bash
apt update
```

## Résultat de la commande précédente :

```
Get:1 http://security.ubuntu.com/ubuntu jammy-security InRelease [110 kB]
Get:2 http://archive.ubuntu.com/ubuntu jammy InRelease [270 kB]                      
Get:3 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 Packages [1494 kB]
Get:4 http://archive.ubuntu.com/ubuntu jammy-updates InRelease [119 kB]
Get:5 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 Packages [44.0 kB]
Get:6 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 Packages [1027 kB]
Get:7 http://archive.ubuntu.com/ubuntu jammy-backports InRelease [109 kB]      
Get:8 http://security.ubuntu.com/ubuntu jammy-security/main amd64 Packages [1265 kB]     
Get:9 http://archive.ubuntu.com/ubuntu jammy/restricted amd64 Packages [164 kB]            
Get:10 http://archive.ubuntu.com/ubuntu jammy/main amd64 Packages [1792 kB]
Get:11 http://archive.ubuntu.com/ubuntu jammy/universe amd64 Packages [17.5 MB]
Get:12 http://archive.ubuntu.com/ubuntu jammy/multiverse amd64 Packages [266 kB]
Get:13 http://archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 Packages [1520 kB]
Get:14 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 Packages [49.8 kB]
Get:15 http://archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages [1292 kB]
Get:16 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [1535 kB]
Get:17 http://archive.ubuntu.com/ubuntu jammy-backports/universe amd64 Packages [32.6 kB]
Get:18 http://archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages [78.3 kB]
Fetched 28.6 MB in 4s (7205 kB/s)                          
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
13 packages can be upgraded. Run 'apt list --upgradable' to see them.
```

* Voici la commande pour installer d'un coup les packages sur une même ligne de commande :

```bash
apt install lsb-release curl gpg gcc libjemalloc-dev pkg-config make
```

## Résultat « partiel» de la commande précédente :

```
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
binutils binutils-common binutils-x86-64-linux-gnu bzip2 ca-certificates cpp cpp-11 dirmngr distro-info-data fontconfig-config fonts-dejavu-core gcc-11 gcc-11-base gnupg
gnupg-l10n gnupg-utils gpg-agent gpg-wks-client gpg-wks-server gpgconf gpgsm libasan6 libassuan0 libatomic1 libbinutils libbrotli1 libbsd0 libc-dev-bin libc-devtools
libc6-dev libcc1-0 libcrypt-dev libctf-nobfd0 libctf0 libcurl4 libdeflate0 libdpkg-perl libexpat1 libfile-fcntllock-perl libfontconfig1 libfreetype6 libgcc-11-dev libgd3
libgdbm-compat4 libgdbm6 libglib2.0-0 libglib2.0-data libgomp1 libicu70 libisl23 libitm1 libjbig0 libjemalloc2 libjpeg-turbo8 libjpeg8 libksba8 libldap-2.5-0 libldap-common
liblocale-gettext-perl liblsan0 libmd0 libmpc3 libmpdec3 libmpfr6 libnghttp2-14 libnpth0 libnsl-dev libperl5.34 libpng16-16 libpsl5 libpython3-stdlib libpython3.10-minimal
libpython3.10-stdlib libquadmath0 libreadline8 librtmp1 libsasl2-2 libsasl2-modules libsasl2-modules-db libsqlite3-0 libssh-4 libtiff5 libtirpc-dev libtsan0 libubsan1
libwebp7 libx11-6 libx11-data libxau6 libxcb1 libxdmcp6 libxml2 libxpm4 linux-libc-dev manpages manpages-dev media-types netbase openssl perl perl-base perl-modules-5.34
pinentry-curses publicsuffix python3 python3-minimal python3.10 python3.10-minimal readline-common rpcsvc-proto shared-mime-info ucf xdg-user-dirs xz-utils
Suggested packages:
binutils-doc bzip2-doc cpp-doc gcc-11-locales dbus-user-session libpam-systemd pinentry-gnome3 tor gcc-multilib autoconf automake libtool flex bison gdb gcc-doc
gcc-11-multilib gcc-11-doc parcimonie xloadimage scdaemon glibc-doc debian-keyring patch git bzr libgd-tools gdbm-l10n libsasl2-modules-gssapi-mit
| libsasl2-modules-gssapi-heimdal libsasl2-modules-ldap libsasl2-modules-otp libsasl2-modules-sql make-doc man-browser perl-doc libterm-readline-gnu-perl
| libterm-readline-perl-perl libtap-harness-archive-perl pinentry-doc dpkg-dev python3-doc python3-tk python3-venv python3.10-venv python3.10-doc binfmt-support
[...]
Setting up libxpm4:amd64 (1:3.5.12-1ubuntu0.22.04.2) ...
Setting up gpgsm (2.2.27-3ubuntu2.1) ...
Setting up python3 (3.10.6-1~22.04) ...
running python rtupdate hooks for python3.10...
running python post-rtupdate hooks for python3.10...
Setting up binutils (2.38-4ubuntu2.3) ...
Setting up dirmngr (2.2.27-3ubuntu2.1) ...
Setting up perl (5.34.0-3ubuntu1.3) ...
Setting up shared-mime-info (2.1-2) ...
Setting up libgd3:amd64 (2.3.0-2ubuntu2) ...
Setting up libdpkg-perl (1.21.1ubuntu2.2) ...
Setting up gpg-wks-server (2.2.27-3ubuntu2.1) ...
Setting up gcc-11 (11.4.0-1ubuntu1~22.04) ...
Setting up lsb-release (11.1.0ubuntu4) ...
Setting up libc-devtools (2.35-0ubuntu3.4) ...
Setting up gpg-wks-client (2.2.27-3ubuntu2.1) ...
Setting up libfile-fcntllock-perl (0.22-3build7) ...
Setting up gcc (4:11.2.0-1ubuntu1) ...
Setting up pkg-config (0.29.2-1ubuntu3) ...
Setting up gnupg (2.2.27-3ubuntu2.1) ...
Processing triggers for libc-bin (2.35-0ubuntu3.4) ...
Processing triggers for ca-certificates (20230311ubuntu0.22.04.1) ...
Updating certificates in /etc/ssl/certs...
0 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...
done.
```

* Voici la commande pour afficher leurs localisations dans le système de fichiers :

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