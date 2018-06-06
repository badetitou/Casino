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
	^ #(actionAppel phase)
]

{ #category : #generator }
BLTActionAppel classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
BLTActionAppel >> actionAppel [

	<generated>
	<container>

	^ actionAppel
]

{ #category : #accessing }
BLTActionAppel >> actionAppel: anObject [

	<generated>
	actionAppel := anObject

]

{ #category : #accessing }
BLTActionAppel >> phase [

	<generated>
	^ phase
]

{ #category : #accessing }
BLTActionAppel >> phase: anObject [

	<generated>
	phase := anObject

]
