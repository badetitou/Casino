Extension { #name : #CSNBOnClick }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnClick >> getAngularRepresentationWith: anExporter [
	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(click)="' , (behaviors anyOne uniqueNameInPage: anExporter currentPage) , '($event)"' ]
]
