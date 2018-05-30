*BL-Model-Exporter-Angular
getExternalDependencies
	^ {self getExternalDependency.
	self getExternalDependency collect: #internalDependencies}
		flattened