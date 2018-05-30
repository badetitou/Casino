*BL-Model-Exporter-Angular
widgetsDependencies
	"At the level of the Phase, we don't need recursive external import (for the module file)... It's only in the TS file"
	^ ((self recursiveMetiers flatCollect: #recursiveWidgets)
		collect: #getExternalDependency) flattened asSet asOrderedCollection