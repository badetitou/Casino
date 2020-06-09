Extension { #name : #CSNBOnOver }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBOnOver >> getAngularRepresentation [
	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(mouseover)="' , (behaviors anyOne uniqueNameInPage: self caller rootNode) , '()"' ]
]
