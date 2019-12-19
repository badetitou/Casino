"
I represent a characteritic that can be add to a Widget
"
Class {
	#name : #CSNAttribute,
	#superclass : #CSNOriginedEntity,
	#instVars : [
		'#attributeValue => FMProperty',
		'#oldClass => FMProperty',
		'#widget => FMOne type: #CSNWidget opposite: #attributes'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNAttribute class >> annotation [

	<FMClass: #Attribute super: #CSNOriginedEntity>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #accessing }
CSNAttribute >> attributeValue [

	<FMProperty: #attributeValue type: #String>
	<generated>
	<FMComment: 'The literal value of the attribute'>
	^ attributeValue
]

{ #category : #accessing }
CSNAttribute >> attributeValue: anObject [
	<generated>
	attributeValue := anObject
]

{ #category : #accessing }
CSNAttribute >> oldClass [

	<FMProperty: #oldClass type: #Object>
	<generated>
	^ oldClass
]

{ #category : #accessing }
CSNAttribute >> oldClass: anObject [
	<generated>
	oldClass := anObject
]

{ #category : #accessing }
CSNAttribute >> widget [
	"Relation named: #widget type: #CSNWidget opposite: #attributes"

	<generated>
	<container>
	^ widget
]

{ #category : #accessing }
CSNAttribute >> widget: anObject [

	<generated>
	widget := anObject
]

{ #category : #navigation }
CSNAttribute >> widgetGroup [
	<generated>
	<navigation: 'Widget'>
	^ MooseGroup with: self widget
]
