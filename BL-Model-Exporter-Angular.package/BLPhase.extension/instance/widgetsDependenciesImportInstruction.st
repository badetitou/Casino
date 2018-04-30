*BL-Model-Exporter-Angular
widgetsDependenciesImportInstruction
	^ ''
		,
			(self widgetsDependencies
				flatCollect: [ :dependency | dependency importString , String crlf ])