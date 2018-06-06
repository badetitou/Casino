"
I encapsulate a BLWidget and i add to it a intance variable ""variable""
"
Class {
	#name : #BLWidgetContainer,
	#superclass : #Object,
	#instVars : [
		'blWidget',
		'variable'
	],
	#category : 'BL-Model-Importer-Java'
}

{ #category : #accessing }
BLWidgetContainer >> affectedActions [
	^ variable
]

{ #category : #accessing }
BLWidgetContainer >> affectedActions: anObject [
	variable := anObject
]

{ #category : #accessing }
BLWidgetContainer >> blWidget [
	^ blWidget
]

{ #category : #accessing }
BLWidgetContainer >> blWidget: anObject [
	blWidget := anObject
]

{ #category : #accessing }
BLWidgetContainer >> variable [
	(self affectedActions isKindOf: FAMIXAccess) ifTrue: [ ^ self affectedActions variable ].
	^ self affectedActions
]
