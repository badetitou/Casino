Extension { #name : #CSNUICWRechercheEtListe }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWRechercheEtListe >> accept: aVisitor [
	^ aVisitor visitCSNUICWRechercheEtListe: self 
]

{ #category : #'*Casino-Model-Visitor' }
CSNUICWRechercheEtListe class >> accept: aVisitor [
	^ aVisitor visitCSNUICWRechercheEtListe: self 
]
