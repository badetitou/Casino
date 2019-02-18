Extension { #name : #CSNAction }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNAction >> getAngularRepresentation [
	^ self behavior ifEmpty: [ self warning: #ThisShouldBeFixed. '' ]
		ifNotEmpty: [ :behaviors | '(click)="', behaviors anyOne name,'"' ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNAction >> leftToken [
	^ '('
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNAction >> rightToken [
	^ ')'
]
