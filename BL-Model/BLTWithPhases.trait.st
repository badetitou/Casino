Trait {
	#name : #BLTWithPhases,
	#instVars : [
		'#phases => FMMany type: #BLTWithPageMetiers opposite: #pageMetiers'
	],
	#category : 'BL-Model-Traits'
}

{ #category : #meta }
BLTWithPhases classSide >> annotation [

	<generated>
	<ignoreInTraitUsers>
	<MSEClass: #TWithPhases super: #Trait>
	<generated>
	<package: #'BL-Model'>
	^self
]

{ #category : #generator }
BLTWithPhases classSide >> generatedSlotNames [
	<generated>
	^ #(phases)
]

{ #category : #generator }
BLTWithPhases classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
BLTWithPhases >> phases [

	<generated>
	^ phases
]

{ #category : #accessing }
BLTWithPhases >> phases: anObject [

	<generated>
	phases value: anObject

]
