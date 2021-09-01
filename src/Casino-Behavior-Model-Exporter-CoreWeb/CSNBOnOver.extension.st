Extension { #name : #CSNBOnOver }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnOver >> getAngularRepresentationWith: anExporter [
	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(mouseover)="' , (behaviors anyOne uniqueNameInPage: anExporter currentPage), '($event)"' ]
]
