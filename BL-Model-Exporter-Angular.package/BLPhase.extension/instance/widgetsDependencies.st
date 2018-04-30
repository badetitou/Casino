*BL-Model-Exporter-Angular
widgetsDependencies
	^ '', ((((self recursiveMetiers flatCollect: #recursiveWidgets) select: #hasExternalDependencies thenCollect: #getExternalDependencies) asSet) asOrderedCollection flatCollect: [ :dependency | dependency importString , String crlf])