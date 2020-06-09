Extension { #name : #CSNBOnError }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBOnError >> getAngularRepresentation [
	^ self behavior
		ifEmpty: [ '' ]
		ifNotEmpty: [ :behaviors | '(error)="' , (behaviors anyOne uniqueNameInPage: self caller rootNode) , '()"' ]
]
