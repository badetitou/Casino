Extension { #name : #CSNUIInputPassword }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUIInputPassword class >> accept: aCSNModelVisitor [
	<generated>
	^ aCSNModelVisitor visitCSNUIInputPassword: self
]

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUIInputPassword >> accept: aCSNModelVisitor [
	<generated>
	^ aCSNModelVisitor visitCSNUIInputPassword: self
]

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUIInputPassword >> computeSelfAttributes [
	^ super computeSelfAttributes
		,
			{(CSNAttribute new
				name: 'type';
				attributeValue: 'password';
				yourself)}
]
