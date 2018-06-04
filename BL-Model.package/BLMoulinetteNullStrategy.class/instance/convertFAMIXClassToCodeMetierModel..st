as yet unclassified
convertFAMIXClassToCodeMetierModel: aFAMIXClass
	^ aFAMIXClass "methods collect: [ :method | method" sourceText replaceAllRegex: '\*/' with: '//'", String crlf ]"