Trait {
	#name : #BLTWithAttributes,
	#instVars : [
		'#attributes => FMMany type: #BLTAttribute opposite: #attribute'
	],
	#category : 'BL-Model-Traits'
}

{ #category : #meta }
BLTWithAttributes classSide >> annotation [

	<generated>
	<ignoreInTraitUsers>
	<MSEClass: #TWithAttributes super: #Trait>
	<generated>
	<package: #'BL-Model'>
	^self
]

{ #category : #generator }
BLTWithAttributes classSide >> generatedSlotNames [
	<generated>
	^ #(attributes)
]

{ #category : #generator }
BLTWithAttributes classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
BLTWithAttributes >> attributes [

	<generated>
	^ attributes
]

{ #category : #accessing }
BLTWithAttributes >> attributes: anObject [

	<generated>
	attributes value: anObject

]
