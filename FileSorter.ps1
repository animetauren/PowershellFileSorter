Param(
    $sourcePath = '.\',
    $destPath = [Environment]::GetFolderPath('MyDocuments')
)

$filePaths = @("$destPath\Docs", "$destPath\Apps", "$destPath\Etc", "$destPath\PDFs", "$destPath\Archive", "$destPath\Templates")

$filePaths | % {
    if (!(Test-Path $_)) {
        mkdir $_
        Write-Output "Folder(s) Created! `r`n"
    }
} 


Get-ChildItem -Path $sourcePath | Select Extension | Sort Extension | Get-Unique  -AsString

Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".exe"} | Move-Item -Destination $destPath\Apps
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".msi"} | Move-Item -Destination $destPath\Apps
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".docx"} | Move-Item -Destination $destPath\Docs
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".pptx"} | Move-Item -Destination $destPath\Docs
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".xlsx"} | Move-Item -Destination $destPath\Docs
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".txt"} | Move-Item -Destination $destPath\Docs
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".jpg"} | copy-Item -Destination [Environment]::GetFolderPath('MyPictures')
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".jpg"} | Remove-Item #this is needed because copy-item complains about the path given to it. This is to make sure ther is no duplicates.
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".jpeg"} | copy-Item -Destination [Environment]::GetFolderPath('MyPictures')
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".jpeg"} | Remove-Item
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".png"} | copy-Item -Destination [Environment]::GetFolderPath('MyPictures')
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".png"} | Remove-Item
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".bmp"} | copy-Item -Destination [Environment]::GetFolderPath('MyPictures')
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".bmp"} | Remove-Item
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".aac"} | copy-Item -Destination [Environment]::GetFolderPath('MyMusic')
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".aac"} | Remove-Item
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".mp3"} | copy-Item -Destination [Environment]::GetFolderPath('MyMusic')
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".mp3"} | Remove-Item
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".avi"} | copy-Item -Destination [Environment]::GetFolderPath('MyVideos')
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".avi"} | Remove-Item
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".flv"} | copy-Item -Destination [Environment]::GetFolderPath('MyVideos')
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".flv"} | Remove-Item
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".mp4"} | copy-Item -Destination [Environment]::GetFolderPath('MyVideos')
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".mp4"} | Remove-Item
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".pdf"} | Move-Item -Destination $destPath\PDFs
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".zip"} | Move-Item -Destination $destPath\Archive
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".tar"} | Move-Item -Destination $destPath\Archive
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".vbs"} | Move-Item -Destination $destPath\Etc
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".kdbx"} | Move-Item -Destination $destPath\Etc
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".kdb"} | Move-Item -Destination $destPath\Etc
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".ics"} | Move-Item -Destination $destPath\Etc
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".xml"} | Move-Item -Destination $destPath\Etc
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".html"} | Move-Item -Destination $destPath\Etc
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".htm"} | Move-Item -Destination $destPath\Etc
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".encrypted"} | Move-Item -Destination $destPath\Etc
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".rdp"} | Move-Item -Destination $destPath\Etc
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".vss"} | Move-Item -Destination $destPath\Templates
