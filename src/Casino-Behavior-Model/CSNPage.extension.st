Extension { #name : #CSNPage }

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNPage >> navigations [
	"Relation named: #navigations type: #CSNBNavigation opposite: #page"

	<generated>
	<derived>
	<FMProperty: #navigations type: #CSNBNavigation opposite: #page>
	<package: #'Casino-Behavior-Model'>
	^ self attributeAt: #navigations ifAbsentPut: [ FMMultivalueLink on: self opposite: #page: ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNPage >> navigations: anObject [

	<generated>
	self navigations value: anObject
]
