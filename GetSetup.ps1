function Install-DevSetup {
    $ModulePaths = @($Env:PSModulePath -split ';')
    $ExpectedUserModulePath = Join-Path -Path ([Environment]::GetFolderPath('MyDocuments')) -ChildPath WindowsPowerShell\Modules
    $Destination = $ModulePaths | Where-Object { $_ -eq $ExpectedUserModulePath}
    if (-not $Destination) {
        $Destination = $ModulePaths | Select-Object -Index 0
    }
    New-Item ($Destination + "\Dev.Setup\") -ItemType Directory -Force | out-null
    Write-Host Downloading Dev.Setup from https://github.com/lancehunt/Dev.Setup/raw/master/Dev.Setup/Setup.ps1
    $client = (New-Object Net.WebClient)
    $client.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials
    $client.DownloadFile("https://github.com/lancehunt/Dev.Setup/raw/master/Dev.Setup/Setup.ps1", $Destination + "\Dev.Setup\Setup.ps1")

    $executionPolicy  = (Get-ExecutionPolicy)
    $executionRestricted = ($executionPolicy -eq "Restricted")
    if ($executionRestricted){
        Write-Warning @"Your execution policy is $executionPolicy, this means you will not be able import or use any scripts including modules."
    }

    if (!$executionRestricted){
        # ensure Dev.Setup is executed from the location it was just installed to
        . $Destination\Dev.Setup\Setup.ps1
    }    
}

Install-DevSetup