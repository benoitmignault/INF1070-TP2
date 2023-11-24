# Exemple de programme shell : ``mystere``

L'objectif de ce exercice est de vous initier à la lecture et à la compréhension d'un script shell.

## Question

1) Que fait le script shell suivant, dont le nom est mystere ?

```
#!/bin/sh
if [ $# -ne 1 ]; then
 echo "Fournir un nom en parametre"
 exit 1
fi
if [ -d "$1" ]; then
 exit 0
else
 "$0" `dirname "$1"`
 mkdir "$1"
fi

```

2) Proposez des exemples d'appels du programme mystere.