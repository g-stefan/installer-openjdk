@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

echo -^> installer openjdk

if exist installer\ rmdir /Q /S installer
mkdir installer

if exist build\ rmdir /Q /S build
mkdir build

makensis.exe /NOCD "util\openjdk-installer.nsi"
makensis.exe /NOCD "util\openjre-installer.nsi"

call grigore-stefan.sign "OpenJDK" "installer\openjdk-14.0.2-installer.exe"
call grigore-stefan.sign "OpenJRE" "installer\openjre-14.0.2-installer.exe"

if exist build\ rmdir /Q /S build
