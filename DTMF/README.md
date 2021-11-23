# Script `timersalon.tcl`

Ce script TCL permet de paramétrer une commande DTMF afin de désactiver le _timersalon_. Par exemple, si pour une raison particulière, vous faites un QSY sur un salon et que vous voulez éviter de revenir sur le salon d'appel RRF (fonctionnement le plus souvent nominal), il vous suffit d'envoyer la commande DTMF que vous avez indiqué (par défaut, 111).

Cette section de script TCL est évidement à ajouter à votre fichier `Logic.tcl`, qui se trouve dans le répertoire `/usr/share/svxlink/events.d/local`.

# Script `dtmfcontroler.tcl`

Ce script TCL permet tout simplement de désactiver l'interpretation des commandes DTMF. Il vous suffit d'envoyer la commande DTMF que vous avez indiqué (par défaut, 999) et votre link deviendra sourd à l'ensemble des autres commandes DTMF. Si vous renvoyez à nouveau la commande DTMF que vous avez indiqué (par défaut, 999), tout revient à la normal.

Ce script TCL peut s'avérer très utile pour les Sysops de link, par exemple, victime d'un perturbateur. 

Vous pouvez par exemple envisager de _parker_ votre link sur un salon annexe, puis désactiver le _timersalon_ (voir le script TCL `timersalon.tcl`), puis désactiver les commandes DTMF.

Votre link restera là où il est et il ne sera plus possible de le déplacer ailleurs, à moins de renvoyer à nouveau la commande DTMF.

**Pour des raisons évidentes de part son caractère stratégique, ce code DTMF devrait être connu du Sysop en charge de la gestion du link et de lui seul ;)**

Cette section de script TCL est évidement à ajouter à votre fichier `Logic.tcl`, qui se trouve dans le répertoire `/usr/share/svxlink/events.d/local`. 

**Attention !**

**Cette section doit impérativement être placé AVANT les autres sections dédiées au traitement des autres commandes DTMF de votre fichier `Logic.tcl`.**

De mon coté, je l'ai placé juste avant la section suivante (ligne 596) :

```
  # Speak network IPs
  if {$cmd == "93"} {
    sayIP
    return 1
  }
```

# Fichiers vocaux

Pour finir, penser à copier les 4 fichiers .wav qui se trouvent dans le répertoire `sounds`. Vous devez les placer dans le répertoire `/usr/share/svxlink/sounds/fr_FR/RRF` de votre Spotnik (avec les autres fichiers déjà présents). 


73 de F4HWN Armel

