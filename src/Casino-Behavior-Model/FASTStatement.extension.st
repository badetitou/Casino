Extension { #name : #FASTStatement }

{ #category : #'*Casino-Behavior-Model-accessing' }
FASTStatement >> carrefourPopUpOwner [

	<generated>
	<container>

	<MSEProperty: #carrefourPopUpOwner type: #Object>
	<package: #'Casino-Behavior-Model'>
	^ self privateState attributeAt: #carrefourPopUpOwner ifAbsent: [ nil ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
FASTStatement >> carrefourPopUpOwner: anObject [

	<generated>
	(self privateState attributeAt: #carrefourPopUpOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #carrefourPopUpOwner put: anObject.
	anObject data: self
]
