Extension { #name : #CSNBOnBlur }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnBlur >> getAngularRepresentation [
	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(blur)="' , (behaviors anyOne uniqueNameInPage: self caller rootNode), '()"' ]
]
