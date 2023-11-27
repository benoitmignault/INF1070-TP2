## Voici les commandes pour l'exercice Docker

1. Récupération de la version la plus récente d'Ubuntu via le registre des image Docker Hub.

```bash
sudo docker pull ubuntu:latest
```

# Résultat de la commande précédente :

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

# Résultat de la commande précédente :

```
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       latest    e4c58958181a   7 weeks ago   77.8MB
```


3. Création d'un conteneur avec l'image de bbase que nous avons récupére du dépot des images `Ubuntu`.

```bash
sudo docker run -it --name containers-admin ubuntu /bin/bash
```

# Résultat de la commande précédente :

```
root@ba2e39f6db12:/#
```
