Extension { #name : #FASTBehaviouralEntity }

{ #category : #'*Casino-Behavior-Model-accessing' }
FASTBehaviouralEntity >> carrefourOnFailureOwner [
	"Relation named: #carrefourOnFailureOwner type: #FASTCall opposite: #onFailure"

	<generated>
	<container>
	<MSEProperty: #carrefourOnFailureOwner type: #Object>
	<package: #'Casino-Behavior-Model'>
	^ self privateState attributeAt: #carrefourOnFailureOwner ifAbsent: [ nil ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
FASTBehaviouralEntity >> carrefourOnFailureOwner: anObject [

	<generated>
	(self privateState attributeAt: #carrefourOnFailureOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self carrefourOnFailureOwner.
		self privateState attributeAt: #carrefourOnFailureOwner put: anObject.
		otherSide onFailure: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #carrefourOnFailureOwner put: anObject.
		anObject onFailure: self ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
FASTBehaviouralEntity >> carrefourOnSuccessOwner [
	"Relation named: #carrefourOnSuccessOwner type: #FASTCall opposite: #onSuccess"

	<generated>
	<container>
	<MSEProperty: #carrefourOnSuccessOwner type: #Object>
	<package: #'Casino-Behavior-Model'>
	^ self privateState attributeAt: #carrefourOnSuccessOwner ifAbsent: [ nil ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
FASTBehaviouralEntity >> carrefourOnSuccessOwner: anObject [

	<generated>
	(self privateState attributeAt: #carrefourOnSuccessOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self carrefourOnSuccessOwner.
		self privateState attributeAt: #carrefourOnSuccessOwner put: anObject.
		otherSide onSuccess: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #carrefourOnSuccessOwner put: anObject.
		anObject onSuccess: self ]
]
