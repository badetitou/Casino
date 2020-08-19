"
I represent an attribute of a businessType
"
Class {
	#name : #CSNBuAttribute,
	#superclass : #CSNBuEntity,
	#instVars : [
		'#attributeType => FMMany type: #CSNBuDTO opposite: #usedInAttributes',
		'#businessType => FMOne type: #CSNBuBusinessType opposite: #attributes',
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

{ #category : #adding }
CSNBuAttribute >> addAttributeType: anObject [
	<generated>
	^ self attributeType add: anObject
]

{ #category : #accessing }
CSNBuAttribute >> attributeType [
	"Relation named: #attributeType type: #CSNBuDTO opposite: #usedInAttributes"

	<generated>
	<derived>
	^ attributeType
]

{ #category : #accessing }
CSNBuAttribute >> attributeType: anObject [

	<generated>
	attributeType value: anObject
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
	^ MooseGroup with: self businessType
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
