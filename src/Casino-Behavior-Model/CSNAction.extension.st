Extension { #name : #CSNAction }

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNAction >> behavior [
	"Relation named: #behavior type: #FASTJavaMethodEntity opposite: #ui"

	<generated>
	<derived>
	<FMProperty: #behavior type: #FASTJavaMethodEntity opposite: #ui>
	<package: #'Casino-Behavior-Model'>
	^ self privateState attributeAt: #behavior ifAbsentPut: [ FMMultivalueLink on: self opposite: #ui: ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNAction >> behavior: anObject [

	<generated>
	self behavior value: anObject
]
