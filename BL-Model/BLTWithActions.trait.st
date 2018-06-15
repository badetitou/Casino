Trait {
	#name : #BLTWithActions,
	#instVars : [
		'#actions => FMMany type: #BLTAction opposite: #actionOwner'
	],
	#category : #'BL-Model-Traits'
}

{ #category : #meta }
BLTWithActions classSide >> annotation [

	<generated>
	<ignoreInTraitUsers>
	<MSEClass: #TWithActions super: #Trait>
	<generated>
	<package: #'BL-Model'>
	^self
]

{ #category : #generator }
BLTWithActions classSide >> generatedSlotNames [
	<generated>
	'BLTWithActions class>>#generatedSlotNames'.
	^ #(actions)
]

{ #category : #generator }
BLTWithActions classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
BLTWithActions >> actions [

	<generated>
	^ actions
]

{ #category : #accessing }
BLTWithActions >> actions: anObject [

	<generated>
	actions value: anObject

]
