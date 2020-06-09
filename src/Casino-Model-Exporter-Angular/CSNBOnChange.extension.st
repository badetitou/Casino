Extension { #name : #CSNBOnChange }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBOnChange >> getAngularRepresentation [
	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(change)="' , (behaviors anyOne uniqueNameInPage: self caller rootNode), '()"' ]
]
