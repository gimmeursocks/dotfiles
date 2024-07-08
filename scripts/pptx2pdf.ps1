param(
    [string]$currPath
)

$pptApp = New-Object -ComObject PowerPoint.Application
Write-Host "Currently in" $currPath

Get-ChildItem -Path $currPath -Filter *.ppt? | ForEach-Object {
    Write-Host "Processing" $_.FullName "..."
    $document = $pptApp.Presentations.Open($_.FullName)
    $pdfFilename = "$($currPath)\$($_.BaseName).pdf"
    $opt= [Microsoft.Office.Interop.PowerPoint.PpSaveAsFileType]::ppSaveAsPDF
    $document.SaveAs($pdfFilename, $opt)
    $document.Close()
}

$pptApp.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($pptApp)