Trait {
	#name : #BLTAttribute,
	#instVars : [
		'#attribute => FMOne type: #BLTWithAttributes opposite: #attributes'
	],
	#category : 'BL-Model-Traits'
}

{ #category : #meta }
BLTAttribute classSide >> annotation [

	<generated>
	<ignoreInTraitUsers>
	<MSEClass: #TAttribute super: #Trait>
	<generated>
	<package: #'BL-Model'>
	^self
]

{ #category : #generator }
BLTAttribute classSide >> generatedSlotNames [
	<generated>
	^ #(attribute)
]

{ #category : #generator }
BLTAttribute classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
BLTAttribute >> attribute [

	<generated>
	<container>

	^ attribute
]

{ #category : #accessing }
BLTAttribute >> attribute: anObject [

	<generated>
	attribute := anObject

]
