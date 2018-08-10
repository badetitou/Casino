Class {
	#name : #BLHTML,
	#superclass : #BLUIContainer,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLHTML class >> annotation [
	<MSEClass: #BLHTML super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #accessing }
BLHTML >> getDom [
	^ ((self widgets asOrderedCollection
				sort:
					[ :widget1 :widget2 | widget1 source sourceAnchor startPos < widget2 source sourceAnchor startPos ])
				flatCollect: [ :widget | String crlf , widget getDom , String crlf ]) 
]

{ #category : #accessing }
BLHTML >> getSelector [
	^ ''
]
