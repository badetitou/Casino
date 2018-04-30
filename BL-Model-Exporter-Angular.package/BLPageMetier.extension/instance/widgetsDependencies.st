*BL-Model-Exporter-Angular
widgetsDependencies
	^ ''
		,
			(((self recursiveWidgets) select: #hasExternalDependencies thenCollect: #getExternalDependencies) asSet asOrderedCollection
				flatCollect: [ :dependency | dependency importString , String crlf ])