Extension { #name : #CSNBOnLoad }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnLoad >> getAngularRepresentationWith: anExporter [

	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(load)="' , (behaviors anyOne uniqueNameInPage: anExporter currentPage) , '($event)"' ]
]
