Param(
    $sourcePath = '.\',
    $destPath = 'C:\users\herobali\Documents\'
)

$filePaths = @("$destPath\Docs", "$destPath\Apps", "$destPath\Etc", "$destPath\PDFs", "$destPath\Archive")

$filePaths | % {
    if (!(Test-Path $_)) {
        mkdir $_
        Write-Output "Docs Folder Created! `r`n"
    }
} 


Get-ChildItem -Path $sourcePath | Select Extension | Sort Extension | Get-Unique  -AsString

Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".exe"} | Move-Item -Destination $destPath\Apps
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".msi"} | Move-Item -Destination $destPath\Apps
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".docx"} | Move-Item -Destination $destPath\Docs
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".docx"} | Move-Item -Destination $destPath\Docs
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".pptx"} | Move-Item -Destination $destPath\Docs
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".xlsx"} | Move-Item -Destination $destPath\Docs
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".jpg"} | copy-Item -Destination C:\users\herobali\Pictures\
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".jpg"} | Remove-Item #this is needed because copy-item complains about the path given to it. This is to make sure ther is no duplicates.
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".png"} | copy-Item -Destination C:\users\herobali\Pictures\
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".png"} | Remove-Item
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".pdf"} | Move-Item -Destination $destPath\PDFs
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".txt"} | Move-Item -Destination $destPath\Docs
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".zip"} | Move-Item -Destination $destPath\Archive
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".tar"} | Move-Item -Destination $destPath\Archive
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".vbs"} | Move-Item -Destination $destPath\Etc
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".kdbx"} | Move-Item -Destination $destPath\Etc
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".kdb"} | Move-Item -Destination $destPath\Etc
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".ics"} | Move-Item -Destination $destPath\Etc
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".xml"} | Move-Item -Destination $destPath\Etc
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".html"} | Move-Item -Destination $destPath\Etc
Get-ChildItem -path $sourcePath | where-object {$_.Extension -eq ".encrypted"} | Move-Item -Destination $destPath\Etc
