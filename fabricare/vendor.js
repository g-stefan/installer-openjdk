// Created by Grigore Stefan <g_stefan@yahoo.com>
// Public domain (Unlicense) <http://unlicense.org>
// SPDX-FileCopyrightText: 2022 Grigore Stefan <g_stefan@yahoo.com>
// SPDX-License-Identifier: Unlicense

messageAction("vendor");

Shell.mkdirRecursivelyIfNotExists("vendor");

var vendor = "openjdk-" + Project.version + "_windows-x64_bin.zip";
if (!Shell.fileExists("vendor/" + vendor)) {
	var webLink = "https://download.java.net/java/GA/jdk" + Project.version + "/afdd2e245b014143b62ccb916125e3ce/10/GPL/" + vendor;
	var cmd = "curl --insecure --location " + webLink + " --output vendor/" + vendor;
	Console.writeLn(cmd);
	exitIf(Shell.system(cmd));
};

