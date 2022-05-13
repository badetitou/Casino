"
I represent a kind of data created by the developers of the application.
I am composed of other DTO.
"
Class {
	#name : #CSNBuBusinessType,
	#superclass : #CSNBuDTO,
	#traits : 'CSNBuTWithComment + CSNBuTWithSource',
	#classTraits : 'CSNBuTWithComment classTrait + CSNBuTWithSource classTrait',
	#instVars : [
		'#attributes => FMMany type: #CSNBuAttribute opposite: #businessType',
		'#children => FMMany type: #CSNBuBusinessType opposite: #parent',
		'#isAbstract => FMProperty',
		'#name => FMProperty',
		'#parent => FMOne type: #CSNBuBusinessType opposite: #children'
	],
	#category : #'Casino-Business-Model-Entities'
}

{ #category : #meta }
CSNBuBusinessType class >> annotation [

	<FMClass: #BusinessType super: #CSNBuDTO>
	<package: #'Casino-Business-Model'>
	<generated>
	^self
]

{ #category : #adding }
CSNBuBusinessType >> addAttribute: anObject [
	<generated>
	^ self attributes add: anObject
]

{ #category : #adding }
CSNBuBusinessType >> addChildren: anObject [
	<generated>
	^ self children add: anObject
]

{ #category : #accessing }
CSNBuBusinessType >> attributes [
	"Relation named: #attributes type: #CSNBuAttribute opposite: #businessType"

	<generated>
	<derived>
	^ attributes
]

{ #category : #accessing }
CSNBuBusinessType >> attributes: anObject [

	<generated>
	attributes value: anObject
]

{ #category : #navigation }
CSNBuBusinessType >> attributesGroup [
	<generated>
	<navigation: 'Attributes'>
	^ MooseSpecializedGroup withAll: self attributes asSet
]

{ #category : #accessing }
CSNBuBusinessType >> children [
	"Relation named: #children type: #CSNBuBusinessType opposite: #parent"

	<generated>
	<derived>
	^ children
]

{ #category : #accessing }
CSNBuBusinessType >> children: anObject [

	<generated>
	children value: anObject
]

{ #category : #navigation }
CSNBuBusinessType >> childrenGroup [
	<generated>
	<navigation: 'Children'>
	^ MooseSpecializedGroup withAll: self children asSet
]

{ #category : #accessing }
CSNBuBusinessType >> isAbstract [

	<FMProperty: #isAbstract type: #Boolean>
	<generated>
	^ isAbstract
]

{ #category : #accessing }
CSNBuBusinessType >> isAbstract: anObject [
	<generated>
	isAbstract := anObject
]

{ #category : #testing }
CSNBuBusinessType >> isBusinessType [

	<generated>
	^ true
]

{ #category : #accessing }
CSNBuBusinessType >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
CSNBuBusinessType >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
CSNBuBusinessType >> parent [
	"Relation named: #parent type: #CSNBuBusinessType opposite: #children"

	<generated>
	<container>
	^ parent
]

{ #category : #accessing }
CSNBuBusinessType >> parent: anObject [

	<generated>
	parent := anObject
]

{ #category : #navigation }
CSNBuBusinessType >> parentGroup [
	<generated>
	<navigation: 'Parent'>
	^ MooseSpecializedGroup with: self parent
]

{ #category : #printing }
CSNBuBusinessType >> printServiceDeserializeOn: aCSNExporter [

	aCSNExporter <<< 'this.objectMapper.parse<'.
	self writeBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< '>(JSON.stringify(res), ' inBraces: [ 
		aCSNExporter << 'mainCreator: () => ['.
		self printJsonClassTypeOn: aCSNExporter.
		aCSNExporter <<< ']' ].
	aCSNExporter <<< ');'
]
