Extension { #name : #CSNAttribute }

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNAttribute >> behavioralAccess [
	"Relation named: #behavioralAccess type: #CSNBAccessElementAttribute opposite: #attribute"

	<generated>
	<derived>
	<FMProperty: #behavioralAccess type: #CSNBAccessElementAttribute opposite: #attribute>
	<package: #'Casino-Behavior-Model'>
	^ self privateState attributeAt: #behavioralAccess ifAbsentPut: [ FMMultivalueLink on: self opposite: #attribute: ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNAttribute >> behavioralAccess: anObject [

	<generated>
	self behavioralAccess value: anObject
]

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNAttribute >> behavioralSetAccess [
	"Relation named: #behavioralSetAccess type: #CSNBSetElementAttribute opposite: #attribute"

	<generated>
	<derived>
	<FMProperty: #behavioralSetAccess type: #CSNBSetElementAttribute opposite: #attribute>
	<package: #'Casino-Behavior-Model'>
	^ self privateState attributeAt: #behavioralSetAccess ifAbsentPut: [ FMMultivalueLink on: self opposite: #attribute: ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNAttribute >> behavioralSetAccess: anObject [

	<generated>
	self behavioralSetAccess value: anObject
]
