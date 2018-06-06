Class {
	#name : #BLTWithPhaseNotStandalonesGenerated,
	#superclass : #FmxTraitEntity,
	#instVars : [
		'#phaseNotStandalones => FMMany type: #BLTWithPageMetiers opposite: #pageMetiers'
	],
	#category : 'BLMetamodel-Generated-Traits'
}

{ #category : #meta }
BLTWithPhaseNotStandalonesGenerated class >> annotation [

	<ignoreInTraitUsers>
	<MSEClass: #TWithPhaseNotStandalones super: #FmxTraitEntity>
	<package: #'BLMetamodel-Generated'>
	^self
]

{ #category : #accessing }
BLTWithPhaseNotStandalonesGenerated >> phaseNotStandalones [

	^ phaseNotStandalones
]

{ #category : #accessing }
BLTWithPhaseNotStandalonesGenerated >> phaseNotStandalones: anObject [

	phaseNotStandalones value: anObject

]
