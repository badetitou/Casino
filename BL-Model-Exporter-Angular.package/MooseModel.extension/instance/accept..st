*BL-Model-Exporter-Angular
accept: anExporter
	| root rootPhases |
	root := anExporter root.
	root createDirectory.
	"Write app.module.ts"
	anExporter writeFile: root / self getModuleName withCode: self generateModuleSourceCode.
	"Write app.route.ts"
	anExporter writeFile: root / self getRouteName withCode: self generateRouteSourceCode.
	"Write components"
	rootPhases := root / 'phases'.
	rootPhases createDirectory.
	self allBLPhase do: [ :phase | anExporter visit: phase ]