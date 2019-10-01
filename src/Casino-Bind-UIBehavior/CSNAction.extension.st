Extension { #name : #CSNAction }

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
CSNAction >> behavior [
	"Relation named: #behavior type: #CSNMethodEntity opposite: #ui"

	<generated>
	<MSEProperty: #behavior type: #Object>
	<package: #'Casino-Bind-UIBehavior'>
	^ self privateState attributeAt: #behavior ifAbsentPut: [ FMMultivalueLink on: self opposite: #ui: ]
]

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
CSNAction >> behavior: anObject [

	<generated>
	self behavior value: anObject
]
