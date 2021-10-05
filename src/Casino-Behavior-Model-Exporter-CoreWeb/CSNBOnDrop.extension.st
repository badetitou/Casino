Extension { #name : #CSNBOnDrop }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnDrop >> getAngularRepresentationWith: anExporter [

	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | 
		  '(drop)="' , (behaviors anyOne uniqueNameInPage: anExporter currentPage) , (behaviors anyOne parameters ifEmpty: [ '()"' ] ifNotEmpty: [ '($event)"' ]) ]
]
