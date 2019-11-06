Extension { #name : #CSNAction }

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
CSNAction >> behavior [
	"Relation named: #behavior type: #FASTJavaMethodEntity opposite: #ui"

	<generated>
	<derived>
	<FMProperty: #behavior type: #FASTJavaMethodEntity opposite: #ui>
	<package: #'Casino-Bind-UIBehavior'>
	^ self privateState attributeAt: #behavior ifAbsentPut: [ FMMultivalueLink on: self opposite: #ui: ]
]

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
CSNAction >> behavior: anObject [

	<generated>
	self behavior value: anObject
]
