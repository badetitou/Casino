Extension { #name : #CSNBOnError }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnError >> getAngularRepresentation [
	^ self behavior
		ifEmpty: [ '' ]
		ifNotEmpty: [ :behaviors | '(error)="' , (behaviors anyOne uniqueNameInPage: self caller rootNode) , '()"' ]
]
