Class {
	#name : #BLActionAttribute,
	#superclass : #BLAttribute,
	#traits : 'BLTWithBehaviors',
	#classTraits : 'BLTWithBehaviors classTrait',
	#instVars : [
		'#codeMetierModel',
		'#oldClass'
	],
	#classVars : [
		'#moulinetteStrategy'
	],
	#category : 'BL-Model-Entities'
}

{ #category : #meta }
BLActionAttribute class >> annotation [

	<generated>
	<MSEClass: #ActionAttribute super: #BLAttribute>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #meta }
BLActionAttribute class >> createAttributeFor: aFAMIXCLass [
	^ self new
		source: aFAMIXCLass;
		name: aFAMIXCLass name;
		attributeValue: aFAMIXCLass name;
		oldClass: aFAMIXCLass;
		yourself
]

{ #category : #generator }
BLActionAttribute class >> generatedSlotNames [
	<generated>
	^ #(codeMetierModel)
]

{ #category : #generator }
BLActionAttribute class >> generatedTraitNames [
	<generated>
	^ #(BLTWithBehaviors)
]

{ #category : #meta }
BLActionAttribute class >> moulinetteStrategy: aMoulinetteStrategy [
	moulinetteStrategy := aMoulinetteStrategy 
]

{ #category : #meta }
BLActionAttribute class >> requirements [

	<generated>
	^ {  }
]

{ #category : #navigation }
BLActionAttribute >> behaviorsGroup [

	<generated>
	<navigation: 'Behaviors'>
	^ MooseGroup
			withAll: (self behaviors asSet)
]

{ #category : #accessing }
BLActionAttribute >> codeMetierModel [

	<MSEProperty: #codeMetierModel type: #Object>
	<generated>
	<MSEComment: 'The source code of the actions'>
	^ codeMetierModel
]

{ #category : #accessing }
BLActionAttribute >> codeMetierModel: anObject [

	<generated>
	codeMetierModel := anObject

]

{ #category : #accessing }
BLActionAttribute >> convertOldClass [
	oldClass do: [ :pjMethod | "pjMethod acceptVisitor: (BLConvertVisitor new model: self mooseModel )" ]
]

{ #category : #accessing }
BLActionAttribute >> moulinetteStrategy [
	^ moulinetteStrategy ifNil: [ moulinetteStrategy := BLMoulinetteNullStrategy new ]
]

{ #category : #accessing }
BLActionAttribute >> moulinetteStrategy: anObject [
	moulinetteStrategy := anObject
]

{ #category : #accessing }
BLActionAttribute >> oldClass [
	^ oldClass 
]

{ #category : #accessing }
BLActionAttribute >> oldClass: anObject [
	oldClass := self moulinetteStrategy convertFAMIXClassToCodeMetierModel: anObject 
]
