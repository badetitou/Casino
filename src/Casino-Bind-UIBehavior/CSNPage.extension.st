Extension { #name : #CSNPage }

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
CSNPage >> navigations [
	"Relation named: #navigations type: #CSNNavigation opposite: #page"

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
