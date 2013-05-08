Dev.Setup
=========

This powershell script uses [Chocolatey][choco] application manager to simplify the installation of Windows Development workstation from scratch.

This script will prompt you to elevate it to Administrator once, after which it will run all installs as administrator.

## Quick Installation

	(new-object Net.WebClient).DownloadString("https://raw.github.com/lancehunt/Dev.Setup/master/GetSetup.ps1") | iex

## Manual Installation

1. Open a Powershell prompt via `WIN+R -> powershell`.
2. Type `.\Setup.ps1` and press enter.
3. Choose `Yes` if you are prompted to run as Administrator.  
4. Enjoy.


Note: if you do not have [Chocolatey][choco] installed, this script will automatically install it for you.


## Installed Packages

View the contents of `Setup.ps1` to see what it installs.



[choco]: http://chocolatey.org/

