Extension { #name : #CSNBOnOut }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBOnOut >> getAngularRepresentation [
	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(mouseout)="' , (behaviors anyOne uniqueNameInPage: self caller rootNode) , '()"' ]
]
