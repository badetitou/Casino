Extension { #name : #CSNBOnClick }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnClick >> getAngularRepresentation [
	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(click)="' , (behaviors anyOne uniqueNameInPage: self caller rootNode) , '($event)"' ]
]
