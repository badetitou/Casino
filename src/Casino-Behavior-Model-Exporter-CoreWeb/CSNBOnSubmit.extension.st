Extension { #name : #CSNBOnSubmit }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnSubmit >> getAngularRepresentation [
	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(ngSubmit)="' , (behaviors anyOne uniqueNameInPage: self caller rootNode) , '()"' ]
]
