"
A representation of a variable entity, 
"
Class {
	#name : #FASTNamedEntity,
	#superclass : #FASTVariableEntity,
	#instVars : [
		'parentNode'
	],
	#category : 'BL-Fast-FIX'
}

{ #category : #visiting }
FASTNamedEntity >> accept: aVisitor [
	^ aVisitor visitNamedEntity: self
]

{ #category : #accessing }
FASTNamedEntity >> childrenNodes [
	| result |
	self flag: 'this is not really a child node...'.
	result := OrderedCollection new.
	famixNamedEntity ifNotNil: [ result add: famixNamedEntity ].
	^ result
]

{ #category : #accessing }
FASTNamedEntity >> famixNamedEntity [
	<MSEProperty: #famixNamedEntity type: #FAMIXNamedEntity opposite: #fastNamedEntities>
	<MSEComment: 'Corresponding Famix named entity AKA meta-variable for symbol resolution'>
	^ famixNamedEntity
]

{ #category : #accessing }
FASTNamedEntity >> famixNamedEntity: aNamedEntity [
	famixNamedEntity := FMMultivalueLink
		on: self
		update: #fastNamedEntities
		from: self famixNamedEntity
		to: aNamedEntity
]

{ #category : #accessing }
FASTNamedEntity >> name [
	<MSEProperty: #name type: #String>
	<MSEComment: 'Name of a variable'>
	^ name
]

{ #category : #accessing }
FASTNamedEntity >> name: aName [
	name := aName
]

{ #category : #accessing }
FASTNamedEntity >> nameByPolicy [
	<MSEProperty: #nameByPolicy type: #String>
	<derived>
	<MSEComment: 'Name of a variable transformed to fit programmming language case policy'>
	^ self sourceLanguage casePolicy: self name
]

{ #category : #accessing }
FASTNamedEntity >> parentNode: aFamixNamedEntity [
	self parentBehaviouralEntity: aFamixNamedEntity
]

{ #category : #accessing }
FASTNamedEntity >> parentScopableEntity [
	^ parentScopableEntity
]

{ #category : #accessing }
FASTNamedEntity >> parentScopableEntity: anObject [
	parentScopableEntity := anObject
]
