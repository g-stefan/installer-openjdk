@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

echo -^> make openjdk

if exist build\ rmdir /Q /S build
if exist release\ rmdir /Q /S release

mkdir build
mkdir release

7z x "vendor/openjdk-14.0.2_windows-x64_bin.zip" -aoa -obuild
move /Y "build\jdk-14.0.2" "release\jdk"
if exist build\ rmdir /Q /S build

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

pushd "release\jdk\bin"
set PATH=%CD%;%PATH%
popd

jlink --no-header-files --no-man-pages --compress=2 --add-modules %JRE_MODULES% --output "release\jre"

echo. > release\separator.txt
echo ------------------------------------------------------------------------------ >> release\separator.txt
echo. >> release\separator.txt
copy "release\jdk\legal\java.base\LICENSE"+"release\separator.txt"+"release\jdk\legal\java.base\ADDITIONAL_LICENSE_INFO" "release\LICENSE"

