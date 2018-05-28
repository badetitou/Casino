as yet unclassified
convertFAMIXClassToTypescriptString: aFAMIXClass
	^ aFAMIXClass "methods collect: [ :method | method" sourceText replaceAllRegex: '\*/' with: '//'", String crlf ]"