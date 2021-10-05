Extension { #name : #CSNBOnMousemove }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnMousemove >> getAngularRepresentationWith: anExporter [

	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | 
		  '(mousemove)="' , (behaviors anyOne uniqueNameInPage: anExporter currentPage) , (behaviors anyOne parameters ifEmpty: [ '()"' ] ifNotEmpty: [ '($event)"' ]) ]
]
