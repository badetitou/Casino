as yet unclassified
convertCodeMetierModelTo: aFAMIXClass
	^ aFAMIXClass "methods collect: [ :method | method" sourceText replaceAllRegex: '\*/' with: '//'", String crlf ]"