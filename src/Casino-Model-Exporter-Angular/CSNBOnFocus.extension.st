Extension { #name : #CSNBOnFocus }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBOnFocus >> getAngularRepresentation [
	^ self behavior
		ifEmpty: [ '' ]
		ifNotEmpty: [ :behaviors | '(focus)="' , (behaviors anyOne uniqueNameInPage: self caller rootNode) , '()"' ]
]
