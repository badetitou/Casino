Extension { #name : #CSNBOnSubmit }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnSubmit >> getAngularRepresentationWith: anExporter [

	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | 
		  '(ngSubmit)="' , (behaviors anyOne uniqueNameInPage: anExporter currentPage) , (behaviors anyOne parameters ifEmpty: [ '()"' ] ifNotEmpty: [ '($event)"' ]) ]
]
