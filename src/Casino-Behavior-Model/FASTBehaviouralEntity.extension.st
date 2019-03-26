Extension { #name : #FASTBehaviouralEntity }

{ #category : #'*Casino-Behavior-Model-accessing' }
FASTBehaviouralEntity >> carrefourOnFailureOwner [

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
	self privateState attributeAt: #carrefourOnFailureOwner put: anObject.
	anObject onFailure: self
]

{ #category : #'*Casino-Behavior-Model-accessing' }
FASTBehaviouralEntity >> carrefourOnSuccessOwner [

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
	self privateState attributeAt: #carrefourOnSuccessOwner put: anObject.
	anObject onSuccess: self
]
