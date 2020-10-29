Extension { #name : #CSNWidget }

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNWidget >> behavioralAccess [
	"Relation named: #behavioralAccess type: #CSNBDOMElementAcccess opposite: #widget"

	<generated>
	<derived>
	<FMProperty: #behavioralAccess type: #CSNBDOMElementAcccess opposite: #widget>
	<package: #'Casino-Behavior-Model'>
	^ self attributeAt: #behavioralAccess ifAbsentPut: [ FMMultivalueLink on: self opposite: #widget: ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNWidget >> behavioralAccess: anObject [

	<generated>
	self behavioralAccess value: anObject
]
