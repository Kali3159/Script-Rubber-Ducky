<#
Auteur: Kali
Contact: Discord - kalienclaquettes

Ce script récupère toutes les adresse IPV4 et l'adresse ip publique sur un système Windows et les envoie vers un webhook Discord.

Note: Assurez-vous de remplacer 'VOTRE_WEBHOOK' (ligne 15) par l'URL de votre webhook Discord.
#>


# Import du module NetTCPIP pour utiliser Get-NetIPAddress
Import-Module NetTCPIP

# URL du webhook Discord
$url = "VOTRE_WEBHOOK"

# Création d'un tableau pour stocker les données
$data = @()

# Récupération du nom d'hôte
$hostname = $env:COMPUTERNAME
$data += "**Hostname:** $hostname"

# Récupération de l'adresse IP publique
try {
    $publicIpAddress = (Invoke-RestMethod -Uri "https://api.ipify.org?format=text")
    $data += "**Public IP Address:** $publicIpAddress"
} catch {
    $data += "**Public IP Address:** Failed to retrieve."
}

# Récupération des informations sur les adresses IP IPv4
$ipAddresses = Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -notlike "127.*" -and $_.IPAddress -notlike "169.254.*" } | Sort-Object { 
    if ($_.InterfaceAlias -eq "Ethernet") { 0 } 
    elseif ($_.InterfaceAlias -eq "Ethernet 2") { 1 } 
    else { 2 }
}

foreach ($ip in $ipAddresses) {
    $data += ""
    $data += "**IPv4 Address:** $($ip.IPAddress)"
    $data += "- **PrefixLength:** $($ip.PrefixLength)"
    $data += "- **InterfaceAlias:** $($ip.InterfaceAlias)"
}

# Convertir le tableau en une chaîne de texte
$message = $data -join "`r`n"

# Création de l'objet JSON pour le webhook Discord
$json = @{
    content = $message
} | ConvertTo-Json

# Envoi du message sur Discord
Invoke-RestMethod -Uri $url -Method Post -ContentType 'application/json' -Body $json
