Class {
	#name : #CSNLLayout,
	#superclass : #CSNOriginedEntity,
	#instVars : [
		'#cell => FMMany type: #CSNLCell opposite: #layoutOwner'
	],
	#category : #'Casino-Model-Layout-Entities'
}

{ #category : #meta }
CSNLLayout class >> annotation [

	<FMClass: #Layout super: #CSNOriginedEntity>
	<package: #'Casino-Model-Layout'>
	<generated>
	^self
]

{ #category : #adding }
CSNLLayout >> addCell: anObject [
	<generated>
	^ self cell add: anObject
]

{ #category : #accessing }
CSNLLayout >> cell [
	"Relation named: #cell type: #CSNLCell opposite: #layoutOwner"

	<generated>
	<derived>
	^ cell
]

{ #category : #accessing }
CSNLLayout >> cell: anObject [

	<generated>
	cell value: anObject
]

{ #category : #navigation }
CSNLLayout >> cellGroup [
	<generated>
	<navigation: 'Cell'>
	^ MooseGroup withAll: self cell asSet
]

{ #category : #accessing }
CSNLLayout >> container [
	"Relation named: #container type: #CSNContainer opposite: #layout"

	<generated>
	<container>
	<FMProperty: #container type: #CSNContainer opposite: #layout>
	^ self attributeAt: #container ifAbsent: [ nil ]
]

{ #category : #accessing }
CSNLLayout >> container: anObject [
	<generated>
	(self attributeAt: #container ifAbsentPut: [ nil ]) == anObject
		ifTrue: [ ^ anObject ].
	anObject
		ifNil: [ | otherSide |
			otherSide := self container.
			self privateState attributeAt: #container put: anObject.
			otherSide layout: nil ]
		ifNotNil: [ self attributeAt: #container put: anObject.
			anObject layout: self ]
]

{ #category : #navigation }
CSNLLayout >> containerGroup [
	<generated>
	<navigation: 'Container'>
	^ MooseGroup with: self container
]
