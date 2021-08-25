Extension { #name : #CSNBOnOver }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnOver >> getAngularRepresentation [
	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(mouseover)="' , (behaviors anyOne uniqueNameInPage: self caller rootNode) , '($event)"' ]
]
