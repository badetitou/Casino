Extension { #name : #CSNBOnLoad }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBOnLoad >> getAngularRepresentation [
	^ self behavior
		ifEmpty: [ '' ]
		ifNotEmpty: [ :behaviors | '(load)="' , (behaviors anyOne uniqueNameInPage: self caller rootNode) , '()"' ]
]
