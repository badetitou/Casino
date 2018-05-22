*BL-Model-Exporter-Angular
widgetsDependenciesName
	^ ''
		,
			(self widgetsDependencies 
				flatCollect: [ :dependency | '        ', dependency moduleName , ',' , String crlf ])