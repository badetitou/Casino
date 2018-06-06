Trait {
	#name : #BLTWithServiceActions,
	#instVars : [
		'#serviceActions => FMMany type: #BLTServiceAction opposite: #serviceActionOwner'
	],
	#category : 'BL-Model-Traits'
}

{ #category : #meta }
BLTWithServiceActions classSide >> annotation [

	<generated>
	<ignoreInTraitUsers>
	<MSEClass: #TWithServiceActions super: #Trait>
	<generated>
	<package: #'BL-Model'>
	^self
]

{ #category : #generator }
BLTWithServiceActions classSide >> generatedSlotNames [
	<generated>
	^ #(serviceActions)
]

{ #category : #generator }
BLTWithServiceActions classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
BLTWithServiceActions >> serviceActions [

	<generated>
	^ serviceActions
]

{ #category : #accessing }
BLTWithServiceActions >> serviceActions: anObject [

	<generated>
	serviceActions value: anObject

]
