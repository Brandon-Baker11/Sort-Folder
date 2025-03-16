function Sort-Folder {
    $downloadfolder = "C:\Users\bakerb\Downloads"
    $emlfolder = "C:\Users\bakerb\Documents\Emls"
    $picfolder = "C:\Users\bakerb\Pictures\Attached Photos"
    $certfiles = "C:\Users\bakerb\Documents\Cert files"
    $docfiles = "C:\Users\bakerb\Documents\Attached Docs"
    $destfolders = @($emlfolder, $picfolder, $certfiles, $docfiles)
    
    Write-Host "`n Rounding up your files in the 'Downloads' folder."; Start-Sleep -Seconds 1.5
    
    foreach ($folder in $destfolders) {
        if (!(Test-Path -Path $folder)) {
            New-Item -Path $folder -ItemType Directory | Out-Null
        }
    }

    # This loops through each item in the downloads folder and moves it to its destination depending on the file extension
    foreach ($file in Get-ChildItem -Path $downloadfolder) {
        switch ($file.Extension) {
            ".png" { Move-Item -Path $file.FullName -Destination $picfolder }

            ".jpg" { Move-Item -Path $file.FullName -Destination $picfolder }

            ".jpeg" { Move-Item -Path $file.FullName -Destination $picfolder }
            
            ".pdf" { Move-Item -Path $file.FullName -Destination $docfiles }

            ".docx" { Move-Item -Path $file.FullName -Destination $docfiles }
            
            ".cer" { Move-Item -Path $file.FullName -Destination $certfiles }
            
            ".eml" { Move-Item -Path $file.FullName -Destination $emlfolder }
        }
    }
    
    Write-Host "`n Distributing those files to their new home."; Start-Sleep -Seconds 1.5

    # This loops through the files in each destination folder and deletes files that haven't been accessed in a week or more
    foreach ($folder in $destfolders) {
        #If the file's last write time is older than one week it gets deleted
        foreach ($file in Get-ChildItem -Path $folder) {
            if ($file.LastAccessTime -le (Get-Date).AddDays(-7)) {
                Remove-Item -Path $file.FullName -Force
            }
        }
        Write-Host " Cleaning up old files in $folder.FullName"; Start-Sleep -Seconds 1.5
    }
    Write-Host "`n Successfully deleted files that were last accessed more than 7 days ago."
}
