@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

if not exist vendor\ mkdir vendor

set WEB_LINK=https://download.java.net/java/GA/jdk14.0.2/205943a0976c4ed48cb16f1043c5c647/12/GPL/openjdk-14.0.2_windows-x64_bin.zip
if not exist vendor\openjdk-14.0.2_windows-x64_bin.zip curl --insecure --location %WEB_LINK% --output vendor\openjdk-14.0.2_windows-x64_bin.zip
