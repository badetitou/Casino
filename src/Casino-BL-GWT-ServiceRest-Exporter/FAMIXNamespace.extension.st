Extension { #name : #FAMIXNamespace }

{ #category : #'*Casino-BL-GWT-ServiceRest-Exporter' }
FAMIXNamespace >> fullNameLowerCasePrintOn: aStream [
	aStream nextPutAll: 'fr.bl.server.omaje.ws.rest'.
	((self allParents reject: [ :p | p name = 'remote' ]) reverse allButFirst: 4)
		ifNotEmpty: [ :list | 
			aStream nextPut: $..
			list do: [ :namespace | aStream nextPutAll: namespace name asLowercase ] separatedBy: [ aStream nextPut: $. ] ].
	self name = 'remote' ifTrue: [ ^ self ].
	aStream nextPut: $..
	aStream nextPutAll: self name asLowercase
]
