Extension { #name : #CSNBOnMouseup }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnMouseup >> getAngularRepresentationWith: anExporter [

	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | 
		  '(mouseup)="' , (behaviors anyOne uniqueNameInPage: anExporter currentPage) , (behaviors anyOne parameters ifEmpty: [ '()"' ] ifNotEmpty: [ '($event)"' ]) ]
]
