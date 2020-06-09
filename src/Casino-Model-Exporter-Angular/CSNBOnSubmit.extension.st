Extension { #name : #CSNBOnSubmit }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBOnSubmit >> getAngularRepresentation [
	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(ngSubmit)="' , (behaviors anyOne uniqueNameInPage: self caller rootNode) , '()"' ]
]
