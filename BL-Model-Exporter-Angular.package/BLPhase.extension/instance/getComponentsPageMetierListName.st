*BL-Model-Exporter-Angular
getComponentsPageMetierListName
	^ self recursiveMetiers flattened flatCollect: [ :metier | '    ', metier componentName, ',', String crlf ]