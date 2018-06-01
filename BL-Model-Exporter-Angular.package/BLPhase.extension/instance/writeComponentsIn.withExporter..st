*BL-Model-Exporter-Angular
writeComponentsIn: phaseRoot withExporter: anExporter
	| componentsRoot indexRoot |
	componentsRoot := self componentsRootFromExporter: anExporter.
	componentsRoot ensureCreateDirectory.
	indexRoot := componentsRoot / 'index'.
	indexRoot ensureCreateDirectory.
	anExporter writeFile: indexRoot / self getTSName withCode: self generateTSSourceCode.
	anExporter writeFile: indexRoot / self getHTMLName withCode: self generateHTMLSourceCode.
	self pageMetiers do: [ :metier | anExporter visit: metier ]