@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

echo -^> release openjdk

call build.clean.cmd
call build.vendor.cmd
call build.make.cmd
call build.installer.cmd
