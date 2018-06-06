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
	^ #(widget)
]

{ #category : #generator }
BLTWidget classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
BLTWidget >> widget [

	<generated>
	<container>

	^ widget
]

{ #category : #accessing }
BLTWidget >> widget: anObject [

	<generated>
	widget := anObject

]
