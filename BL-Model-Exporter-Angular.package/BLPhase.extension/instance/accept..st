*BL-Model-Exporter-Angular
accept: anExporter
	| phaseRoot |
	phaseRoot := self rootFromExporter: anExporter.
	phaseRoot createDirectory.
	"Write phase.module.ts"
	anExporter writeFile: phaseRoot / self getModuleName withCode: self generateModuleSourceCode.
	"Write phase.route.ts"
	anExporter writeFile: phaseRoot / self getRouteName withCode: self generateRouteSourceCode.
	"Write components"
	self writeComponentsIn: phaseRoot withExporter: anExporter