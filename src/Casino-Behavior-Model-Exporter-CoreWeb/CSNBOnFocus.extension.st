Extension { #name : #CSNBOnFocus }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnFocus >> getAngularRepresentationWith: anExporter [

	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(focus)="' , (behaviors anyOne uniqueNameInPage: anExporter currentPage) , '($event)"' ]
]
