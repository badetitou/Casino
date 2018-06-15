Trait {
	#name : #BLTWithBehaviors,
	#instVars : [
		'#behaviors => FMMany type: #BLTWithActionAttributes opposite: #actionAttributes'
	],
	#category : 'BL-Model-Traits'
}

{ #category : #meta }
BLTWithBehaviors classSide >> annotation [

	<generated>
	<ignoreInTraitUsers>
	<MSEClass: #TWithBehaviors super: #Trait>
	<generated>
	<package: #'BL-Model'>
	^self
]

{ #category : #generator }
BLTWithBehaviors classSide >> generatedSlotNames [
	<generated>
	'BLTWithBehaviors class>>#generatedSlotNames'.
	^ #(behaviors)
]

{ #category : #generator }
BLTWithBehaviors classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
BLTWithBehaviors >> behaviors [

	<generated>
	^ behaviors
]

{ #category : #accessing }
BLTWithBehaviors >> behaviors: anObject [

	<generated>
	behaviors value: anObject

]
