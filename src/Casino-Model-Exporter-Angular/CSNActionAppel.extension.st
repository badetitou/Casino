Extension { #name : #CSNActionAppel }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNActionAppel >> getAngularRepresentation [
	self call ifNil: [ ^ '' ].
	^ '(click)="openPhase(' , self call name , ')"'
]
