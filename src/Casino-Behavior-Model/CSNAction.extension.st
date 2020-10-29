Extension { #name : #CSNAction }

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNAction >> behavior [
	"Relation named: #behavior type: #FASTBehaviouralEntity opposite: #ui"

	<generated>
	<derived>
	<FMProperty: #behavior type: #FASTBehaviouralEntity opposite: #ui>
	<package: #'Casino-Behavior-Model'>
	^ self attributeAt: #behavior ifAbsentPut: [ FMMultivalueLink on: self opposite: #ui: ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNAction >> behavior: anObject [

	<generated>
	self behavior value: anObject
]
