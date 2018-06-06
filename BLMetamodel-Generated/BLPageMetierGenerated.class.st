Class {
	#name : #BLPageMetierGenerated,
	#superclass : #MooseEntity,
	#category : 'BLMetamodel-Generated-Entities'
}

{ #category : #meta }
BLPageMetierGenerated class >> annotation [

	<MSEClass: #PageMetier super: #MooseEntity>
	<package: #'BLMetamodel-Generated'>
	^self
]

{ #category : #meta }
BLPageMetierGenerated class >> metamodel [

	^ BLMetamodelGenerator metamodel
]

{ #category : #meta }
BLPageMetierGenerated class >> requirements [

	^ {  }
]

{ #category : #meta }
BLPageMetierGenerated class >> statefulTraits [

	<statefulTraits>
	^ {BLTWithPhaseNotStandalones}
]
