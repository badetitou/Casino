Extension { #name : #PJBlockNode }

{ #category : #'*BL-Fast-Java-Angular-Extensions' }
PJBlockNode >> angularString [
	^ ' {', String crlf,( self statements flatCollect: [ :statement | statement angularString, String crlf  ]) , '}', String crlf
]
