@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

call build\build.config.cmd

echo -^> installer %PRODUCT_NAME%

if exist installer\ rmdir /Q /S installer
mkdir installer

if exist temp\ rmdir /Q /S temp
mkdir temp

makensis.exe /NOCD "source\openjdk-installer.nsi"
makensis.exe /NOCD "source\openjre-installer.nsi"

call grigore-stefan.sign "OpenJDK" "installer\%PRODUCT_BASE%jdk-%PRODUCT_VERSION%-installer.exe"
call grigore-stefan.sign "OpenJRE" "installer\%PRODUCT_BASE%jre-%PRODUCT_VERSION%-installer.exe"

if exist temp\ rmdir /Q /S temp
