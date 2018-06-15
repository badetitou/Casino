Trait {
	#name : #BLTWithActionAppels,
	#instVars : [
		'#actionAppels => FMMany type: #BLTActionAppel opposite: #actionAppel'
	],
	#category : 'BL-Model-Traits'
}

{ #category : #meta }
BLTWithActionAppels classSide >> annotation [

	<generated>
	<ignoreInTraitUsers>
	<MSEClass: #TWithActionAppels super: #Trait>
	<generated>
	<package: #'BL-Model'>
	^self
]

{ #category : #generator }
BLTWithActionAppels classSide >> generatedSlotNames [
	<generated>
	'BLTWithActionAppels class>>#generatedSlotNames'.
	^ #(actionAppels)
]

{ #category : #generator }
BLTWithActionAppels classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
BLTWithActionAppels >> actionAppels [

	<generated>
	^ actionAppels
]

{ #category : #accessing }
BLTWithActionAppels >> actionAppels: anObject [

	<generated>
	actionAppels value: anObject

]
