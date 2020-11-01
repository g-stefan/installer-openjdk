@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

echo -^> vendor openjdk

call build.config.cmd

if not exist vendor\ mkdir vendor

set WEB_LINK=https://download.java.net/java/GA/jdk%PRODUCT_VERSION%/51f4f36ad4ef43e39d0dfdbaf6549e32/9/GPL/openjdk-%PRODUCT_VERSION%_windows-x64_bin.zip
if not exist vendor\openjdk-%PRODUCT_VERSION%_windows-x64_bin.zip curl --insecure --location %WEB_LINK% --output vendor\openjdk-%PRODUCT_VERSION%_windows-x64_bin.zip
