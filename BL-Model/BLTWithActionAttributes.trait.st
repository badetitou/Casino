Trait {
	#name : #BLTWithActionAttributes,
	#instVars : [
		'#actionAttributes => FMMany type: #BLTWithBehaviors opposite: #behaviors'
	],
	#category : 'BL-Model-Traits'
}

{ #category : #meta }
BLTWithActionAttributes classSide >> annotation [

	<generated>
	<ignoreInTraitUsers>
	<MSEClass: #TWithActionAttributes super: #Trait>
	<generated>
	<package: #'BL-Model'>
	^self
]

{ #category : #generator }
BLTWithActionAttributes classSide >> generatedSlotNames [
	<generated>
	'BLTWithActionAttributes class>>#generatedSlotNames'.
	^ #(actionAttributes)
]

{ #category : #generator }
BLTWithActionAttributes classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
BLTWithActionAttributes >> actionAttributes [

	<generated>
	^ actionAttributes
]

{ #category : #accessing }
BLTWithActionAttributes >> actionAttributes: anObject [

	<generated>
	actionAttributes value: anObject

]
