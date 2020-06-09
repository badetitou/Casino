Extension { #name : #CSNBOnClick }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBOnClick >> getAngularRepresentation [
	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(click)="' , (behaviors anyOne uniqueNameInPage: self caller rootNode) , '()"' ]
]
