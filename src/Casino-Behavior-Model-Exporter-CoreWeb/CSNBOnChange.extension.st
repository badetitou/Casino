Extension { #name : #CSNBOnChange }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnChange >> getAngularRepresentationWith: anExporter [

	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(change)="' , (behaviors anyOne uniqueNameInPage: anExporter currentPage) , '($event)"' ]
]
