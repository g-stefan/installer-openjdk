// Created by Grigore Stefan <g_stefan@yahoo.com>
// Public domain (Unlicense) <http://unlicense.org>
// SPDX-FileCopyrightText: 2022 Grigore Stefan <g_stefan@yahoo.com>
// SPDX-License-Identifier: Unlicense

Fabricare.include("vendor");

// ---

messageAction("make");

if (Shell.fileExists("temp/build.done.flag")) {
	return;
};

Shell.removeDirRecursivelyForce("output");
Shell.removeDirRecursivelyForce("temp");

Shell.mkdirRecursivelyIfNotExists("output");
Shell.mkdirRecursivelyIfNotExists("temp");

Shell.system("7z x \"vendor/openjdk-" + Project.version + "_windows-x64_bin.zip\" -aoa -otemp");
Shell.rename("temp/jdk-" + Project.version, "output/jdk");
Shell.removeDirRecursivelyForce("temp");

var jreModules=[

	"java.base",
	"java.compiler",
	"java.datatransfer",
	"java.desktop",
	"java.instrument",
	"java.logging",
	"java.management",
	"java.management.rmi",
	"java.naming",
	"java.net.http",
	"java.prefs",
	"java.rmi",
	"java.scripting",
	"java.se",
	"java.security.jgss",
	"java.security.sasl",
	"java.smartcardio",
	"java.sql",
	"java.sql.rowset",
	"java.transaction.xa",
	"java.xml",
	"java.xml.crypto"

];

Shell.setenv("PATH", Shell.getcwd() + "\\output\\jdk\\bin;" + Shell.getenv("PATH"));
Shell.system("jlink --no-header-files --no-man-pages --compress=2 --add-modules "+jreModules.join(",")+" --output \"output/jre\"");

var license = Shell.fileGetContents("output/jdk/legal/java.base/LICENSE");
license += "\r\n";
license += "------------------------------------------------------------------------------\r\n";
license += "\r\n";

license += Shell.fileGetContents("output/jdk/legal/java.base/ADDITIONAL_LICENSE_INFO");

Shell.filePutContents("output/LICENSE",license);

Shell.mkdirRecursivelyIfNotExists("temp");
Shell.filePutContents("temp/build.done.flag", "done");
