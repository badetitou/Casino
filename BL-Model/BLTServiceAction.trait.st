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
	^ #(serviceAction)
]

{ #category : #generator }
BLTServiceAction classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
BLTServiceAction >> serviceAction [

	<generated>
	<container>

	^ serviceAction
]

{ #category : #accessing }
BLTServiceAction >> serviceAction: anObject [

	<generated>
	serviceAction := anObject

]
