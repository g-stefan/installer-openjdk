@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

call build\build.config.cmd

echo -^> make %PRODUCT_NAME%

if exist temp\ rmdir /Q /S temp
if exist output\ rmdir /Q /S output

mkdir temp
mkdir output

7z x "vendor/openjdk-%PRODUCT_VERSION%_windows-x64_bin.zip" -aoa -otemp
move /Y "temp\jdk-%PRODUCT_VERSION%" "output\jdk"
if exist temp\ rmdir /Q /S temp

set JRE_MODULES=java.base
set JRE_MODULES=%JRE_MODULES%,java.compiler
set JRE_MODULES=%JRE_MODULES%,java.datatransfer
set JRE_MODULES=%JRE_MODULES%,java.desktop
set JRE_MODULES=%JRE_MODULES%,java.instrument
set JRE_MODULES=%JRE_MODULES%,java.logging
set JRE_MODULES=%JRE_MODULES%,java.management
set JRE_MODULES=%JRE_MODULES%,java.management.rmi
set JRE_MODULES=%JRE_MODULES%,java.naming
set JRE_MODULES=%JRE_MODULES%,java.net.http
set JRE_MODULES=%JRE_MODULES%,java.prefs
set JRE_MODULES=%JRE_MODULES%,java.rmi
set JRE_MODULES=%JRE_MODULES%,java.scripting
set JRE_MODULES=%JRE_MODULES%,java.se
set JRE_MODULES=%JRE_MODULES%,java.security.jgss
set JRE_MODULES=%JRE_MODULES%,java.security.sasl
set JRE_MODULES=%JRE_MODULES%,java.smartcardio
set JRE_MODULES=%JRE_MODULES%,java.sql
set JRE_MODULES=%JRE_MODULES%,java.sql.rowset
set JRE_MODULES=%JRE_MODULES%,java.transaction.xa
set JRE_MODULES=%JRE_MODULES%,java.xml
set JRE_MODULES=%JRE_MODULES%,java.xml.crypto

pushd "output\jdk\bin"
set PATH=%CD%;%PATH%
popd

jlink --no-header-files --no-man-pages --compress=2 --add-modules %JRE_MODULES% --output "output\jre"

echo. > output\separator.txt
echo ------------------------------------------------------------------------------ >> output\separator.txt
echo. >> output\separator.txt
copy "output\jdk\legal\java.base\LICENSE"+"output\separator.txt"+"output\jdk\legal\java.base\ADDITIONAL_LICENSE_INFO" "output\LICENSE"

