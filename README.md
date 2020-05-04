# Script shell `num.sh`

Ce script, totalement générique, dispose des options suivantes :

* start : permet de démarrer __tous__ les services numériques
* stop : permet de stopper __tous__ les services numériques
* state : indique l'état des services numériques : _active_ si démarrés ou _inactive_ si stoppés
* enable : lors du prochain _reboot_, __tous__ les services numériques seront chargés et démarrés
* disable : lors du prochain _reboot_, __aucun__ service numérique ne sera chargé et démarré
* version : la version du script

> Je suggère de placer ce script dans le répertoire `/etc/spotnik`

# Script shell `spot`

En partant du script `spot` patché, j'ai ajouté 2 nouvelles options. C'est beaucoup plus _safe_ que de gérer une seule et unique option qui tente de gérer les 2 actions. Nous avons donc :

* 22 - Enable Numeric mode
* 23 - Disable Numeric mode

Ces 2 options pointent tout simplement vers `/etc/spotnik/num.sh enable` et `/etc/spotnik/num.sh disable`. 

> Attention, j'insiste à nouveau sur les options _enable_ et _disable_ du script `num.sh`. Elles influencent le comportement du chargement et du démarrage des services numériques __lors du prochain reboot__. Elles n'influencent en rien l'état actuel des services numériques (qui peuvent être _active_ ou _inactive_). L'utilisation de ces options _enable_ et _disable_ nécessite donc un reboot. 





