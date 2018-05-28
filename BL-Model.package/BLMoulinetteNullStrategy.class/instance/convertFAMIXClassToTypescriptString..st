as yet unclassified
convertFAMIXClassToTypescriptString: aFAMIXClass
	^ aFAMIXClass methods flatCollect: [ :method | method sourceText replaceAllRegex: '\*/' with: '//', String crlf ]