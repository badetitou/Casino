Extension { #name : #CSNBOnBlur }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnBlur >> getAngularRepresentationWith: anExporter [
	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(blur)="' , (behaviors anyOne uniqueNameInPage: anExporter currentPage), '($event)"' ]
]
