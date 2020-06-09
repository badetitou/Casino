Extension { #name : #CSNBOnSubmitSuccess }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBOnSubmitSuccess >> getAngularRepresentation [
	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(ngSubmit)="' , (behaviors anyOne uniqueNameInPage: self caller rootNode) , '()"' ]
]
