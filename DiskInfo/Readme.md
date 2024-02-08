
DiskInfo.ps1
Ce script PowerShell récupère des informations sur les disques présents sur un PC sous Windows et les envoie vers un webhook Discord.

Configuration
Avant d'utiliser ce script, assurez-vous de remplacer "VOTRE_WEBHOOK" par l'URL de votre webhook Discord dans le fichier DiskInfo.ps1. Cela permettra au script d'envoyer les informations récupérées à votre serveur Discord.

Informations récupérées
Le script récupère les informations suivantes sur chaque disque :

Disk: Numéro du disque.
Model: : Modèle du disque.
SerialNumber: : Numéro de série du disque.
MediaType: : Type de support de stockage du disque.
InterfaceType: : Type d'interface du disque.
Size: : Taille totale du disque.
PartitionStyle: : Style de partitionnement du disque.
NumberOfPartitions: : Nombre total de partitions sur le disque.
OperationalStatus: : État opérationnel du disque.
HealthStatus: : Statut de santé du disque.
FirmwareVersion: : Version du firmware du disque.
LogicalSectorSize: : Taille du secteur logique du disque.
PhysicalSectorSize: : Taille du secteur physique du disque.
IsBoot: : Indique si le disque est un disque de démarrage.
IsSystem: : Indique si le disque est un disque système.
IsReadOnly: : Indique si le disque est en lecture seule.
IsOffline: : Indique si le disque est hors ligne.
IsClustered: : Indique si le disque est utilisé dans un cluster.
Pour chaque disque, le script récupère également des informations sur les partitions :

Partition: 1 : Numéro de la partition.
Size: : Taille de la partition.
AccessPaths: : Chemins d'accès associés à la partition.
IsSystem: : Indique si la partition est une partition système.
IsActive: : Indique si la partition est active.
IsBoot: : Indique si la partition est une partition de démarrage.
IsReadOnly: : Indique si la partition est en lecture seule.
IsShadowCopy: : Indique si la partition est une copie d'ombre.
(Les mêmes informations sont fournies pour les autres partitions.)

Les informations sont envoyées au webhook Discord spécifié, ce qui vous permet de les consulter facilement depuis votre serveur Discord.
