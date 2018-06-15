Trait {
	#name : #BLTWidget,
	#instVars : [
		'#widget => FMOne type: #BLTWithWidgets opposite: #widgets'
	],
	#category : 'BL-Model-Traits'
}

{ #category : #meta }
BLTWidget classSide >> annotation [

	<generated>
	<ignoreInTraitUsers>
	<MSEClass: #TWidget super: #Trait>
	<generated>
	<package: #'BL-Model'>
	^self
]

{ #category : #generator }
BLTWidget classSide >> generatedSlotNames [
	<generated>
	'BLTWidget class>>#generatedSlotNames'.
	^ #(widgetOwner)
]

{ #category : #generator }
BLTWidget classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
BLTWidget >> widgetOwner [

	<generated>
	<container>

	^ widgetOwner
]

{ #category : #accessing }
BLTWidget >> widgetOwner: anObject [

	<generated>
	widgetOwner := anObject

]
