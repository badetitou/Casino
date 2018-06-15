Extension { #name : #BLActionAppel }

{ #category : #'*BL-Model-Exporter-Angular' }
BLActionAppel >> getAngularRepresentation [
	^ '(click)="openPhase(' , self actionAppelOwner name , ')"'
]
