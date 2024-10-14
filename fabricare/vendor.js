// Created by Grigore Stefan <g_stefan@yahoo.com>
// Public domain (Unlicense) <http://unlicense.org>
// SPDX-FileCopyrightText: 2022 Grigore Stefan <g_stefan@yahoo.com>
// SPDX-License-Identifier: Unlicense

messageAction("vendor");

Shell.mkdirRecursivelyIfNotExists("vendor");
		
var vendor = "openjdk-" + Project.version + "_windows-x64_bin.zip";
if (!Shell.fileExists("vendor/" + vendor)) {
	var webLink = "https://download.java.net/java/GA/jdk" + Project.version + "/3c5b90190c68498b986a97f276efd28a/37/GPL/" + vendor;
	var cmd = "curl --insecure --location " + webLink + " --output vendor/" + vendor;
	Console.writeLn(cmd);
	exitIf(Shell.system(cmd));
};

