Extension { #name : #CSNPage }

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNPage >> navigations [

	<generated>
	<MSEProperty: #navigations type: #Object>
	<package: #'Casino-Behavior-Model'>
	^ self privateState attributeAt: #navigations ifAbsentPut: [ FMMultivalueLink on: self opposite: #page: ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNPage >> navigations: anObject [

	<generated>
	self navigations value: anObject
]
