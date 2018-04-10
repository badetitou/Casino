*BL-Model-Exporter-Angular
getComponentsPageMetierListName
	| text |
	text := ''.
	self metiers do: [ :metier | text := text , metier componentName, ',', String crlf ].
	^ text