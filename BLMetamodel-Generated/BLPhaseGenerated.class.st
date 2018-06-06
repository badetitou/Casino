Class {
	#name : #BLPhaseGenerated,
	#superclass : #MooseEntity,
	#instVars : [
		'codePhase',
		'codeValue',
		'realClassName'
	],
	#category : 'BLMetamodel-Generated-Entities'
}

{ #category : #meta }
BLPhaseGenerated class >> annotation [

	<MSEClass: #Phase super: #MooseEntity>
	<package: #'BLMetamodel-Generated'>
	^self
]

{ #category : #meta }
BLPhaseGenerated class >> metamodel [

	^ BLMetamodelGenerator metamodel
]

{ #category : #meta }
BLPhaseGenerated class >> requirements [

	^ {  }
]

{ #category : #meta }
BLPhaseGenerated class >> statefulTraits [

	<statefulTraits>
	^ {FmxNGTNamed}
]

{ #category : #accessing }
BLPhaseGenerated >> codePhase [

	<MSEProperty: #codePhase type: #String>
	<MSEComment: 'The code phase (see xml file)'>
	^ codePhase
]

{ #category : #accessing }
BLPhaseGenerated >> codePhase: anObject [

	codePhase := anObject

]

{ #category : #accessing }
BLPhaseGenerated >> codeValue [

	<MSEProperty: #codeValue type: #String>
	<MSEComment: 'The code value (see xml file)'>
	^ codeValue
]

{ #category : #accessing }
BLPhaseGenerated >> codeValue: anObject [

	codeValue := anObject

]

{ #category : #accessing }
BLPhaseGenerated >> realClassName [

	<MSEProperty: #realClassName type: #String>
	<MSEComment: 'The realClassName (see xml file)'>
	^ realClassName
]

{ #category : #accessing }
BLPhaseGenerated >> realClassName: anObject [

	realClassName := anObject

]
