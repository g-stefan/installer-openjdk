// Created by Grigore Stefan <g_stefan@yahoo.com>
// Public domain (Unlicense) <http://unlicense.org>
// SPDX-FileCopyrightText: 2022 Grigore Stefan <g_stefan@yahoo.com>
// SPDX-License-Identifier: Unlicense

messageAction("vendor");

Shell.mkdirRecursivelyIfNotExists("vendor");
		
var vendor = "openjdk-" + Project.version + "_windows-x64_bin.zip";
if (!Shell.fileExists("vendor/" + vendor)) {
	var webLink = "https://download.java.net/java/GA/jdk" + Project.version + "/bd75d5f9689641da8e1daabeccb5528b/36/GPL/" + vendor;
	var cmd = "curl --insecure --location " + webLink + " --output vendor/" + vendor;
	Console.writeLn(cmd);
	exitIf(Shell.system(cmd));
};

