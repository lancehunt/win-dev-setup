Dev.Setup
=========

This powershell script uses [Chocolatey][choco] application manager to simplify the installation of Windows Development workstation from scratch.

This script will prompt you to elevate it to Administrator once, after which it will run all installs as administrator.

## Installed Packages

View the contents of `Setup.ps1` to see what it installs.

## Run Setup

1. Open a Powershell prompt via WIN+R -> powershell.
2. Type `.\Setup.ps1` and press enter.
3. Choose Yes If UAC is installed when you are prompted to run as Administrator.  
4. Enjoy.


Note: if you do not have [Chocolatey][choco] installed, this script will automatically install it for you.


[choco]: http://chocolatey.org/

