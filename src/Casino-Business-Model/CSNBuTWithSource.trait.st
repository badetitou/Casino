"
I contain a reference to the original source.
"
Trait {
	#name : #CSNBuTWithSource,
	#instVars : [
		'#source => FMProperty'
	],
	#category : #'Casino-Business-Model-Traits'
}

{ #category : #meta }
CSNBuTWithSource classSide >> annotation [

	<FMClass: #TWithSource super: #Object>
	<package: #'Casino-Business-Model'>
	<generated>
	^self
]

{ #category : #accessing }
CSNBuTWithSource >> source [

	<FMProperty: #source type: #Object>
	<generated>
	^ source
]

{ #category : #accessing }
CSNBuTWithSource >> source: anObject [
	<generated>
	source := anObject
]
