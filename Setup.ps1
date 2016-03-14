function Use-RunAs 
{    
    # Check if script is running as Adminstrator and if not use RunAs 
    # Use Check Switch to check if admin 
     
    param([Switch]$Check) 
     
    $IsAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()` 
        ).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator") 
         
    if ($Check) { return $IsAdmin }     
 
    if ($MyInvocation.ScriptName -ne "") 
    {  
        if (-not $IsAdmin)  
        {  
            try 
            {  
                $arg = "-file `"$($MyInvocation.ScriptName)`"" 
                Start-Process "$psHome\powershell.exe" -Verb Runas -ArgumentList $arg -ErrorAction 'stop'  
            } 
            catch 
            { 
                Write-Warning "Error - Failed to restart script with runas"  
                break               
            } 
            exit # Quit this session of powershell 
        }  
    }  
    else  
    {  
        Write-Warning "Error - Script must be saved as a .ps1 file first"  
        break  
    }  
} 


Use-RunAs


Set-ExecutionPolicy Unrestricted



# Package Managers
 (new-object net.webclient).DownloadString('http://chocolatey.org/install.ps1') | iex

 (new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex

# Dev Languages
cinst nodejs.install
cinst ruby.devkit
cinst python 


# .NET frameworks
#Write-Host "Grabbing required frameworks"
#cinst netframework2 -source webpi
#cinst NETFramework35 -source webpi
#cinst NETFramework4 -source webpi
#cinst NETFramework4Update402 -source webpi
#cinst NETFramework4Update402_KB2544514_Only -source webpi
#cinst WindowsInstaller31 -source webpi
#cinst WindowsInstaller45 -source webpi


# Windows Features
choco windowsfeatures IIS-WebServerRole

# Browsers
cinst GoogleChrome
#cinst Firefox
#cinst GoogleTalk

# Tools
cinst dropbox
cinst Console2
cinst notepadplusplus.install
cinst 7zip.install
cinst grepwin
cinst curl
cinst sysinternals
cinst gow
cinst putty

# Automation Tools
cinst vagrant
cinst virtualbox

# Dev Tools
cinst git.install
cinst nuget.commandline
cinst kdiff3
cinst psake
cinst poshgit
cinst windbg
cinst fiddler4

# IDE's
#cinst sublimetext2
#cinstm VisualStudio2012Premium
#cinstm JetBrains.Webstorm
#cinstm resharper
#cinstm dotpeek

# Dev Databases
#cinstm mongodb
