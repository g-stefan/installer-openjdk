@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

call build.config.cmd

echo -^> vendor %PRODUCT_NAME%

if not exist vendor\ mkdir vendor

set WEB_LINK=https://download.java.net/java/GA/jdk%PRODUCT_VERSION%/0d1cfde4252546c6931946de8db48ee2/7/GPL/openjdk-%PRODUCT_VERSION%_windows-x64_bin.zip
if not exist vendor\openjdk-%PRODUCT_VERSION%_windows-x64_bin.zip curl --insecure --location %WEB_LINK% --output vendor\openjdk-%PRODUCT_VERSION%_windows-x64_bin.zip
