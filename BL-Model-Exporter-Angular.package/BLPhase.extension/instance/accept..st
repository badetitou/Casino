*BL-Model-Exporter-Angular
accept: anExporter
	| phaseRoot |
	phaseRoot := anExporter rootPhases / self name.
	phaseRoot createDirectory.
	anExporter
		writeFile: phaseRoot / self getModuleName
		withCode: self generateModuleSourceCode.
	anExporter
		writeFile: phaseRoot / self getRouteName
		withCode: self generateRouteSourceCode