Extension { #name : #CSNBOnChange }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnChange >> getAngularRepresentation [
	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(change)="' , (behaviors anyOne uniqueNameInPage: self caller rootNode), '()"' ]
]
