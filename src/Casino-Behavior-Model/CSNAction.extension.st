Extension { #name : #CSNAction }

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNAction >> addBehavior: aBehavior [
	self behavior add: aBehavior
]

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNAction >> behavior [
	"Relation named: #behavior type: #FASTTBehaviouralEntity opposite: #ui"

	<generated>
	<derived>
	<FMProperty: #behavior type: #FASTTBehaviouralEntity opposite: #ui>
	<package: #'Casino-Behavior-Model'>
	^ self attributeAt: #behavior ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #ui ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNAction >> behavior: anObject [

	<generated>
	self behavior value: anObject
]
