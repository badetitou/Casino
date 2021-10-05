Extension { #name : #CSNBOnKeypress }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnKeypress >> getAngularRepresentationWith: anExporter [

	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | 
		  '(keypress)="' , (behaviors anyOne uniqueNameInPage: anExporter currentPage) , (behaviors anyOne parameters ifEmpty: [ '()"' ] ifNotEmpty: [ '($event)"' ]) ]
]
