*BL-Model-Exporter-Angular
widgetsDependencies
	^ ''
		,
			(((self recursiveWidgets) select: #hasExternalDependency thenCollect: #getExternalDependencies) flattened asSet asOrderedCollection
				flatCollect: [ :dependency | dependency importString , String crlf ])