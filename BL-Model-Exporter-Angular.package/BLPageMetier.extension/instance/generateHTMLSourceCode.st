*BL-Model-Exporter-Angular
generateHTMLSourceCode
	self halt. 
	^ self widgets flatCollect: [ :widget | widget getDom , String crlf ]