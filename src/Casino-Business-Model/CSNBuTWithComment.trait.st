"
I contain a comment concerning the associated entity
"
Trait {
	#name : #CSNBuTWithComment,
	#instVars : [
		'#comment => FMProperty'
	],
	#category : #'Casino-Business-Model-Traits'
}

{ #category : #meta }
CSNBuTWithComment classSide >> annotation [

	<FMClass: #TWithComment super: #Object>
	<package: #'Casino-Business-Model'>
	<generated>
	^self
]

{ #category : #accessing }
CSNBuTWithComment >> comment [

	<FMProperty: #comment type: #String>
	<generated>
	^ comment
]

{ #category : #accessing }
CSNBuTWithComment >> comment: anObject [
	<generated>
	comment := anObject
]
