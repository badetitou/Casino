"
I do the link between this meta-model and the behavioral model (and so the code executed when an event occur)
"
Class {
	#name : #BLBehavior,
	#superclass : #BLOriginedEntity,
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLBehavior class >> annotation [

	<MSEClass: #Behavior super: #BLOriginedEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLBehavior class >> generatedSlotNames [
	<generated>
	'BLBehavior class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
BLBehavior class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLBehavior class >> requirements [

	<generated>
	^ {  }
]
