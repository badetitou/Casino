*BL-Model-Exporter-Angular
accept: anExporter
	| root rootPhases rootComponents |
	root := anExporter root.
	root createDirectory.
	"Write app.module.ts"
	anExporter writeFile: root / self getModuleName withCode: self generateModuleSourceCode.
	"Write app.route.ts"
	anExporter writeFile: root / self getRouteName withCode: self generateRouteSourceCode.
	"Write components"
	rootComponents := root / 'components' / 'index'.
	rootComponents ensureCreateDirectory.
	anExporter
		writeFile: rootComponents / self getHTMLName
		withCode: self generateHTMLSourceCode.
	anExporter
		writeFile: rootComponents / self getTSName
		withCode: self generateTSSourceCode.
	rootPhases := root / 'phases'.
	rootPhases createDirectory.
	self allBLPhase
		do: [ :phase | 
			anExporter visit: phase.
]