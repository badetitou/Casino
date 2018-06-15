Trait {
	#name : #BLTWithPageMetiers,
	#instVars : [
		'#pageMetiers => FMMany type: #BLTWithPhases opposite: #phases'
	],
	#category : 'BL-Model-Traits'
}

{ #category : #meta }
BLTWithPageMetiers classSide >> annotation [

	<generated>
	<ignoreInTraitUsers>
	<MSEClass: #TWithPageMetiers super: #Trait>
	<generated>
	<package: #'BL-Model'>
	^self
]

{ #category : #generator }
BLTWithPageMetiers classSide >> generatedSlotNames [
	<generated>
	'BLTWithPageMetiers class>>#generatedSlotNames'.
	^ #(pageMetiers)
]

{ #category : #generator }
BLTWithPageMetiers classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
BLTWithPageMetiers >> pageMetiers [

	<generated>
	^ pageMetiers
]

{ #category : #accessing }
BLTWithPageMetiers >> pageMetiers: anObject [

	<generated>
	pageMetiers value: anObject

]
