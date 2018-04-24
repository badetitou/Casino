*BL-Model-Exporter-Angular
accept: anExporter
	| pageMetierRoot |
	pageMetierRoot := ((self container at: 1) componentsRootFromExporter: anExporter)
		/ self getFolderName.
	[ pageMetierRoot ensureCreateDirectory ]
		on: DirectoryExists
		do: [  ].
	"Write pageMetier.module.ts"
	anExporter
		writeFile: pageMetierRoot / self getHTMLName
		withCode: self generateHTMLSourceCode.
	"Write pageMetier.route.ts"
	anExporter
		writeFile: pageMetierRoot / self getTSName
		withCode: self generateTSSourceCode