*BL-Model-Exporter-Angular
generateHTMLSourceCode
	^ self widgets
		flatCollect: [ :widget | widget getDom , String crlf ]