$server = "http://octopus-chris.westeurope.cloudapp.azure.com/"
$package = "OctopusAzureTest"
$apiKey = "API-FFUS4EEZRJYNS2U8CMUZ2VRLNS"

rm "$package*.nupkg"
octo pack --id=$package

$filename = Get-ChildItem "$package*.nupkg" | Select-Object -first 1
echo $filename.Fullname
octo push --package $filename --server $server --apiKey $apiKey