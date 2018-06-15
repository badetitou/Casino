Trait {
	#name : #BLTAction,
	#instVars : [
		'#actionOwner => FMOne type: #BLTWithActions opposite: #actions'
	],
	#category : #'BL-Model-Traits'
}

{ #category : #meta }
BLTAction classSide >> annotation [

	<generated>
	<ignoreInTraitUsers>
	<MSEClass: #TAction super: #Trait>
	<generated>
	<package: #'BL-Model'>
	^self
]

{ #category : #generator }
BLTAction classSide >> generatedSlotNames [
	<generated>
	'BLTAction class>>#generatedSlotNames'.
	^ #(actionOwner)
]

{ #category : #generator }
BLTAction classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
BLTAction >> actionOwner [

	<generated>
	<container>

	^ actionOwner
]

{ #category : #accessing }
BLTAction >> actionOwner: anObject [

	<generated>
	actionOwner := anObject

]
