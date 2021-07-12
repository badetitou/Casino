Extension { #name : #CSNUIInputEmail }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUIInputEmail >> accept: aCSNModelVisitor [
	<generated>
	^ aCSNModelVisitor visitCSNUIInputEmail: self
]

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUIInputEmail classSide >> accept: aCSNModelVisitor [
	<generated>
	^ aCSNModelVisitor visitCSNUIInputEmail: self
]

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUIInputEmail >> computeSelfAttributes [
	^ super computeSelfAttributes
		,
			{(CSNAttribute new
				name: 'type';
				attributeValue: 'email';
				yourself)}
]
