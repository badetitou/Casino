*BL-Model-Exporter-Angular
getExternalDependencies
	^ {self getExternalDependency . (self getExternalDependency internalDependencies)} flattened