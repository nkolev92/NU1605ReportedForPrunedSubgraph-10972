Remove-Item localFeed -Recurse -Force 
Remove-Item packages -Recurse -Force 
New-Item -Path localFeed -ItemType "directory" -Force
dotnet pack ReferencedV1
dotnet pack ReferencedV1_1
dotnet pack PackageA
dotnet pack PackageB
dotnet restore .\Repro\Repro.csproj
Write-Host "Look at Repro\obj\project.assets.json. Microsoft.Extensions.Configuration 3.1.11 was selected, but the warning is complaining about 5.0.0 of the same package which wasn't selected!"