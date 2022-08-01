Extension { #name : #CSNActionAppel }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNActionAppel >> getAngularRepresentationWith: anExporter [
	self call ifNil: [ ^ '' ].
	^ '(click)="openPhase(' , self call getAcceptedName , ')"'
]
