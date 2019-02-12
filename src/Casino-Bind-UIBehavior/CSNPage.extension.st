Extension { #name : #CSNPage }

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
CSNPage >> navigations [

	<generated>
	<MSEProperty: #navigations type: #Object>
	<package: #'Casino-Bind-UIBehavior'>
	^ self privateState attributeAt: #navigations ifAbsentPut: [ FMMultivalueLink on: self opposite: #page: ]
]

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
CSNPage >> navigations: anObject [

	<generated>
	self navigations value: anObject
]
