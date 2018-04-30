*BL-Model-Exporter-Angular
widgetsDependencies
	^ (((self recursiveMetiers flatCollect: #recursiveWidgets)
				select: #hasExternalDependency
				thenCollect: #getExternalDependencies)) flattened asSet asOrderedCollection