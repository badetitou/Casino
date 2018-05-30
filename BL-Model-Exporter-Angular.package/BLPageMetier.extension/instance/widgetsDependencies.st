*BL-Model-Exporter-Angular
widgetsDependencies
	^ ''
		,
			((self recursiveWidgets collect: #getExternalDependencies) flattened asSet asOrderedCollection
				flatCollect: [ :dependency | dependency importString , String crlf ])