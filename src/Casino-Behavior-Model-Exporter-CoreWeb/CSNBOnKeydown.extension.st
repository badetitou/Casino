Extension { #name : #CSNBOnKeydown }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnKeydown >> getAngularRepresentationWith: anExporter [

	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | 
		  '(keydown)="' , (behaviors anyOne uniqueNameInPage: anExporter currentPage) , (behaviors anyOne parameters ifEmpty: [ '()"' ] ifNotEmpty: [ '($event)"' ]) ]
]
