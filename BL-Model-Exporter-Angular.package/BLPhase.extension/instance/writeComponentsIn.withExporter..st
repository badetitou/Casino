*BL-Model-Exporter-Angular
writeComponentsIn: phaseRoot withExporter: anExporter
	| componentsRoot indexRoot |
	componentsRoot := self componentsRootFromExporter: anExporter.
	componentsRoot createDirectory.
	indexRoot := componentsRoot / 'index'.
	indexRoot createDirectory.
	anExporter writeFile: indexRoot / self getTSName withCode: self generateTSSourceCode.
	anExporter writeFile: indexRoot / self getHTMLName withCode: self generateHTMLSourceCode.
	self metiers do: [ :metier | anExporter visit: metier ]