Extension { #name : #CSNUIInputFile }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUIInputFile >> accept: aCSNModelVisitor [
	<generated>
	^ aCSNModelVisitor visitCSNUIInputFile: self
]

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUIInputFile classSide >> accept: aCSNModelVisitor [
	<generated>
	^ aCSNModelVisitor visitCSNUIInputFile: self
]

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUIInputFile >> angularComponent [
	^ CSNELCWBLInputFile new
]
