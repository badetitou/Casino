Extension { #name : #CSNUICWRechercheEtListe }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWRechercheEtListe class >> accept: aVisitor [
	^ aVisitor visitCSNUICWRechercheEtListe: self 
]
