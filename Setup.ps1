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
cinstm nodejs.install


cinstm ruby.devkit
cinstm python 


# .NET frameworks

Write-Host "Grabbing required frameworks"
cinstm netframework2 -source webpi
cinstm NETFramework35 -source webpi
cinstm NETFramework4 -source webpi
cinstm NETFramework4Update402 -source webpi
cinstm NETFramework4Update402_KB2544514_Only -source webpi
cinstm WindowsInstaller31 -source webpi
cinstm WindowsInstaller45 -source webpi


# Windows Features

cwindowsfeatures IIS-WebServerRole



# Browsers

cinstm GoogleChrome

cinstm Firefox

cinstm GoogleTalk




# Tools

cinstm dropbox

cinstm Console2

cinstm notepadplusplus.install

cinstm 7zip.install

cinstm grepwin

cinstm curl

cinstm sysinternals


cinstm gow

cinstm putty


# Automation Tools

cinstm vagrant

cinstm virtualbox



# Dev Tools

cinstm git.install

cinstm nuget.commandline

cinstm kdiff3

cinstm psake

cinstm poshgit

cinstm windbg

cinstm fiddler4


# IDE's

cinstm sublimetext2


#cinstm VisualStudio2012Premium
#cinstm JetBrains.Webstorm
#cinstm resharper
#cinstm dotpeek


# Dev Databases

#cinstm mongodb