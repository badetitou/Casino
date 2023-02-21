Extension { #name : #FamixJavaInterface }

{ #category : #'*Casino-BL-GWT-ServiceRest-Exporter' }
FamixJavaInterface >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitInterface: self
]
