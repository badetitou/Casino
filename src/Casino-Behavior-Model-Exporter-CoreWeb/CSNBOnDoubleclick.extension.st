Extension { #name : #CSNBOnDoubleclick }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnDoubleclick >> getAngularRepresentationWith: anExporter [

	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | 
		  '(dbclick)="' , (behaviors anyOne uniqueNameInPage: anExporter currentPage) , (behaviors anyOne parameters ifEmpty: [ '()"' ] ifNotEmpty: [ '($event)"' ]) ]
]
