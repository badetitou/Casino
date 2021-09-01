Extension { #name : #CSNAction }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNAction >> getAngularRepresentationWith: anExporter [
	^ self behavior
		ifEmpty: [ self inform: #ThisShouldBeFixed.
			'' ]
		ifNotEmpty: [ :behaviors | '(unknow)="' , behaviors anyOne uniqueName , '($event)"' ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNAction >> leftToken [
	^ '('
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNAction >> rightToken [
	^ ')'
]
