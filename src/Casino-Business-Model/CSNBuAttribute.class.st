"
I represent an attribute of a businessType.
"
Class {
	#name : #CSNBuAttribute,
	#superclass : #CSNBuEntity,
	#traits : 'CSNBuTWithComment + CSNBuTWithSource',
	#classTraits : 'CSNBuTWithComment classTrait + CSNBuTWithSource classTrait',
	#instVars : [
		'#attributeType => FMOne type: #CSNBuDTO opposite: #usedInAttributes',
		'#businessType => FMOne type: #CSNBuBusinessType opposite: #attributes',
		'#expression => FMProperty',
		'#isFinal => FMProperty',
		'#isStatic => FMProperty',
		'#isTransient => FMProperty',
		'#name => FMProperty'
	],
	#category : #'Casino-Business-Model-Entities'
}

{ #category : #meta }
CSNBuAttribute class >> annotation [

	<FMClass: #Attribute super: #CSNBuEntity>
	<package: #'Casino-Business-Model'>
	<generated>
	^self
]

{ #category : #accessing }
CSNBuAttribute >> attributeType [
	"Relation named: #attributeType type: #CSNBuDTO opposite: #usedInAttributes"

	<generated>
	^ attributeType
]

{ #category : #accessing }
CSNBuAttribute >> attributeType: anObject [

	<generated>
	attributeType := anObject
]

{ #category : #accessing }
CSNBuAttribute >> businessType [
	"Relation named: #businessType type: #CSNBuBusinessType opposite: #attributes"

	<generated>
	<container>
	^ businessType
]

{ #category : #accessing }
CSNBuAttribute >> businessType: anObject [

	<generated>
	businessType := anObject
]

{ #category : #navigation }
CSNBuAttribute >> businessTypeGroup [
	<generated>
	<navigation: 'BusinessType'>
	^ MooseSpecializedGroup with: self businessType
]

{ #category : #accessing }
CSNBuAttribute >> expression [

	<FMProperty: #expression type: #String>
	<generated>
	^ expression
]

{ #category : #accessing }
CSNBuAttribute >> expression: anObject [
	<generated>
	expression := anObject
]

{ #category : #accessing }
CSNBuAttribute >> isFinal [

	<FMProperty: #isFinal type: #Boolean>
	<generated>
	^ isFinal
]

{ #category : #accessing }
CSNBuAttribute >> isFinal: anObject [
	<generated>
	isFinal := anObject
]

{ #category : #accessing }
CSNBuAttribute >> isStatic [

	<FMProperty: #isStatic type: #Boolean>
	<generated>
	^ isStatic
]

{ #category : #accessing }
CSNBuAttribute >> isStatic: anObject [
	<generated>
	isStatic := anObject
]

{ #category : #accessing }
CSNBuAttribute >> isTransient [

	<FMProperty: #isTransient type: #Boolean>
	<generated>
	^ isTransient
]

{ #category : #accessing }
CSNBuAttribute >> isTransient: anObject [
	<generated>
	isTransient := anObject
]

{ #category : #accessing }
CSNBuAttribute >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
CSNBuAttribute >> name: anObject [
	<generated>
	name := anObject
]
