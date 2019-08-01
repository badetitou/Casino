Extension { #name : #CSNWidget }

{ #category : #'*Casino-Model-Layout-accessing' }
CSNWidget >> cellOwner [

	<generated>
	<container>

	<MSEProperty: #cellOwner type: #Object>
	<package: #'Casino-Model-Layout'>
	^ self privateState attributeAt: #cellOwner ifAbsent: [ nil ]
]

{ #category : #'*Casino-Model-Layout-accessing' }
CSNWidget >> cellOwner: anObject [

	<generated>
	(self privateState attributeAt: #cellOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self cellOwner.
		self privateState attributeAt: #cellOwner put: anObject.
		otherSide widget: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #cellOwner put: anObject.
		anObject widget: self ]
]
