Trait {
	#name : #BLTServiceAction,
	#instVars : [
		'#serviceAction => FMOne type: #BLTWithServiceActions opposite: #serviceActions'
	],
	#category : 'BL-Model-Traits'
}

{ #category : #meta }
BLTServiceAction classSide >> annotation [

	<generated>
	<ignoreInTraitUsers>
	<MSEClass: #TServiceAction super: #Trait>
	<generated>
	<package: #'BL-Model'>
	^self
]

{ #category : #generator }
BLTServiceAction classSide >> generatedSlotNames [
	<generated>
	'BLTServiceAction class>>#generatedSlotNames'.
	^ #(serviceActionOwner)
]

{ #category : #generator }
BLTServiceAction classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
BLTServiceAction >> serviceActionOwner [

	<generated>
	<container>

	^ serviceActionOwner
]

{ #category : #accessing }
BLTServiceAction >> serviceActionOwner: anObject [

	<generated>
	serviceActionOwner := anObject

]
