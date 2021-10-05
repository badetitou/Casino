Extension { #name : #CSNBOnKeyup }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnKeyup >> getAngularRepresentationWith: anExporter [

	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | 
		  '(keyup)="' , (behaviors anyOne uniqueNameInPage: anExporter currentPage) , (behaviors anyOne parameters ifEmpty: [ '()"' ] ifNotEmpty: [ '($event)"' ]) ]
]
