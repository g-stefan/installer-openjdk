@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

call build\build.config.cmd

echo -^> vendor %PRODUCT_NAME%

if not exist vendor\ mkdir vendor

set WEB_LINK=https://download.java.net/java/GA/jdk17.0.1/2a2082e5a09d4267845be086888add4f/12/GPL/openjdk-17.0.1_windows-x64_bin.zip
if not exist vendor\openjdk-%PRODUCT_VERSION%_windows-x64_bin.zip curl --insecure --location %WEB_LINK% --output vendor\openjdk-%PRODUCT_VERSION%_windows-x64_bin.zip
