Extension { #name : #FASTExpression }

{ #category : #'*Casino-Behavior-Model-accessing' }
FASTExpression >> carrefourPopUpOwner [

	<generated>
	<container>

	<MSEProperty: #carrefourPopUpOwner type: #Object>
	<package: #'Casino-Behavior-Model'>
	^ self privateState attributeAt: #carrefourPopUpOwner ifAbsent: [ nil ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
FASTExpression >> carrefourPopUpOwner: anObject [

	<generated>
	(self privateState attributeAt: #carrefourPopUpOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self carrefourPopUpOwner.
		self privateState attributeAt: #carrefourPopUpOwner put: anObject.
		otherSide data: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #carrefourPopUpOwner put: anObject.
		anObject data: self ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
FASTExpression >> navigation [

	<generated>
	<container>

	<MSEProperty: #navigation type: #Object>
	<package: #'Casino-Behavior-Model'>
	^ self privateState attributeAt: #navigation ifAbsent: [ nil ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
FASTExpression >> navigation: anObject [

	<generated>
	self privateState attributeAt: #navigation put: (FMMultivalueLink on: self update: #arguments from: self navigation to: anObject).
]
