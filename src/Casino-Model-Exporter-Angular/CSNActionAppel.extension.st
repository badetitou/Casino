Extension { #name : #CSNActionAppel }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNActionAppel >> getAngularRepresentation [
	^ '(click)="openPhase(' , self call name , ')"'
]
