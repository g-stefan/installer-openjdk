// Created by Grigore Stefan <g_stefan@yahoo.com>
// Public domain (Unlicense) <http://unlicense.org>
// SPDX-FileCopyrightText: 2022 Grigore Stefan <g_stefan@yahoo.com>
// SPDX-License-Identifier: Unlicense

messageAction("installer");

Shell.mkdirRecursivelyIfNotExists("release");
Shell.mkdirRecursivelyIfNotExists("temp");

Shell.setenv("PRODUCT_NAME", "installer-openjdk");
Shell.setenv("PRODUCT_VERSION", Project.version);
Shell.setenv("PRODUCT_BASE", "open");

exitIf(Shell.system("makensis.exe /NOCD \"source\\openjdk-installer.nsi\""));
exitIf(Shell.system("grigore-stefan.sign \"OpenJDK\" \"release\\openjdk-" + Project.version + "-installer.exe\""));

exitIf(Shell.system("makensis.exe /NOCD \"source\\openjre-installer.nsi\""));
exitIf(Shell.system("grigore-stefan.sign \"OpenJRE\" \"release\\openjre-" + Project.version + "-installer.exe\""));

var fileName = "openjdk-" + Project.version + "-installer.exe";
var jsonName = "openjdk-" + Project.version + "-installer.json";

var json = {};
json[fileName] = SHA512.fileHash("release/" + fileName);
Shell.filePutContents("release/" + jsonName, JSON.encodeWithIndentation(json));

var fileName = "openjre-" + Project.version + "-installer.exe";
var jsonName = "openjre-" + Project.version + "-installer.json";

var json = {};
json[fileName] = SHA512.fileHash("release/" + fileName);
Shell.filePutContents("release/" + jsonName, JSON.encodeWithIndentation(json));
