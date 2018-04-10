*BL-Model-Exporter-Angular
getComponentsPageMetierListName
	^ self metiers flatCollect: [ :metier | metier componentName, ',', String crlf ]