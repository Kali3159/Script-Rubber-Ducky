# IP Grabber.ps1

Ce script PowerShell récupère toutes les adresses IPv4 et l'adresse IP publique sur un système Windows et les envoie vers un webhook Discord.

## Configuration

Avant d'utiliser ce script, assurez-vous de remplacer "VOTRE_WEBHOOK" par l'URL de votre webhook Discord dans le fichier IP Grabber.ps1. Cela permettra au script d'envoyer les informations récupérées à votre serveur Discord.

## Informations récupérées

Le script récupère les informations suivantes :

- **Hostname:** Le nom d'hôte de l'ordinateur.
- **Public IP Address:** L'adresse IP publique de l'ordinateur.
- **IPv4 Address:** Les adresses IPv4 de l'ordinateur.
  - **PrefixLength:** La longueur du préfixe de sous-réseau.
  - **InterfaceAlias:** L'alias de l'interface réseau associée à l'adresse.

Les informations sont envoyées au webhook Discord spécifié, ce qui vous permet de les consulter facilement depuis votre serveur Discord.

## Mon Discord : kalienclaquettes

Pour toute question ou assistance, vous pouvez me contacter en message priver sur Discord