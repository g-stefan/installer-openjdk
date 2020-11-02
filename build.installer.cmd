@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

call build.config.cmd

echo -^> installer %PRODUCT_NAME%

if exist installer\ rmdir /Q /S installer
mkdir installer

if exist build\ rmdir /Q /S build
mkdir build

makensis.exe /NOCD "util\openjdk-installer.nsi"
makensis.exe /NOCD "util\openjre-installer.nsi"

call grigore-stefan.sign "OpenJDK" "installer\%PRODUCT_BASE%jdk-%PRODUCT_VERSION%-installer.exe"
call grigore-stefan.sign "OpenJRE" "installer\%PRODUCT_BASE%jre-%PRODUCT_VERSION%-installer.exe"

if exist build\ rmdir /Q /S build
