Extension { #name : #CSNBOnMouseout }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnMouseout >> getAngularRepresentationWith: anExporter [

	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | 
		  '(mouseout)="' , (behaviors anyOne uniqueNameInPage: anExporter currentPage) , (behaviors anyOne parameters ifEmpty: [ '()"' ] ifNotEmpty: [ '($event)"' ]) ]
]
