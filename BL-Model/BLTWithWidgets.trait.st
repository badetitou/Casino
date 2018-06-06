Trait {
	#name : #BLTWithWidgets,
	#instVars : [
		'#widgets => FMMany type: #BLTWidget opposite: #widgetOwner'
	],
	#category : 'BL-Model-Traits'
}

{ #category : #meta }
BLTWithWidgets classSide >> annotation [

	<generated>
	<ignoreInTraitUsers>
	<MSEClass: #TWithWidgets super: #Trait>
	<generated>
	<package: #'BL-Model'>
	^self
]

{ #category : #generator }
BLTWithWidgets classSide >> generatedSlotNames [
	<generated>
	^ #(widgets)
]

{ #category : #generator }
BLTWithWidgets classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
BLTWithWidgets >> widgets [

	<generated>
	^ widgets
]

{ #category : #accessing }
BLTWithWidgets >> widgets: anObject [

	<generated>
	widgets value: anObject

]
