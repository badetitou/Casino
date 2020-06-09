Extension { #name : #CSNBOnFocus }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnFocus >> getAngularRepresentation [
	^ self behavior
		ifEmpty: [ '' ]
		ifNotEmpty: [ :behaviors | '(focus)="' , (behaviors anyOne uniqueNameInPage: self caller rootNode) , '()"' ]
]
