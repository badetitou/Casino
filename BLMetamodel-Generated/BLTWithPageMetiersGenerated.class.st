Class {
	#name : #BLTWithPageMetiersGenerated,
	#superclass : #FmxTraitEntity,
	#instVars : [
		'#pageMetiers => FMMany type: #BLTWithPhaseNotStandalones opposite: #phaseNotStandalones'
	],
	#category : 'BLMetamodel-Generated-Traits'
}

{ #category : #meta }
BLTWithPageMetiersGenerated class >> annotation [

	<ignoreInTraitUsers>
	<MSEClass: #TWithPageMetiers super: #FmxTraitEntity>
	<package: #'BLMetamodel-Generated'>
	^self
]

{ #category : #accessing }
BLTWithPageMetiersGenerated >> pageMetiers [

	^ pageMetiers
]

{ #category : #accessing }
BLTWithPageMetiersGenerated >> pageMetiers: anObject [

	pageMetiers value: anObject

]
