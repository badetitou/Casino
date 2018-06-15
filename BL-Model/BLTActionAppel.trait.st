Trait {
	#name : #BLTActionAppel,
	#instVars : [
		'#actionAppel => FMOne type: #BLTWithActionAppels opposite: #actionAppels',
		'#phase => FMOne type: #BLTWithActionAppels opposite: #actionAppels'
	],
	#category : 'BL-Model-Traits'
}

{ #category : #meta }
BLTActionAppel classSide >> annotation [

	<generated>
	<ignoreInTraitUsers>
	<MSEClass: #TActionAppel super: #Trait>
	<generated>
	<package: #'BL-Model'>
	^self
]

{ #category : #generator }
BLTActionAppel classSide >> generatedSlotNames [
	<generated>
	'BLTActionAppel class>>#generatedSlotNames'.
	^ #(actionAppelOwner)
]

{ #category : #generator }
BLTActionAppel classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
BLTActionAppel >> actionAppelOwner [

	<generated>
	^ actionAppelOwner
]

{ #category : #accessing }
BLTActionAppel >> actionAppelOwner: anObject [

	<generated>
	actionAppelOwner := anObject

]
