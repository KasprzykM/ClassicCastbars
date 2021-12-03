@echo off

:: Path to where ClassicCastbars source code folder is stored (no trailing slashes!).
set "path_projects=E:\Projects\Github"

:: Path to your WoW folders.
set "path_bcc=C:\Program Files (x86)\World of Warcraft\_classic_\Interface\AddOns"
set "path_classic=C:\Program Files (x86)\World of Warcraft\_classic_era_\Interface\AddOns"

:: Download BigWigs packager script
if NOT exist release.sh (
  powershell.exe -Command "Invoke-WebRequest https://raw.githubusercontent.com/BigWigsMods/packager/master/release.sh -OutFile release.sh"
)

:: Create build folder if it doesn't already exists.
if not exist .release\NUL (
  mkdir .release\ClassicCastbars
  mkdir .release\ClassicCastbars_Options
)

:: Create the symlinks. Make sure you run this as admin.
mklink /D "%path_bcc%\ClassicCastbars" "%path_projects%\ClassicCastbars\.release\ClassicCastbars"
mklink /D "%path_bcc%\ClassicCastbars_Options" "%path_projects%\ClassicCastbars\.release\ClassicCastbars_Options"
mklink /D "%path_classic%\ClassicCastbars" "%path_projects%\ClassicCastbars\.release\ClassicCastbars"
mklink /D "%path_classic%\ClassicCastbars_Options" "%path_projects%\ClassicCastbars\.release\ClassicCastbars_Options"

pause
