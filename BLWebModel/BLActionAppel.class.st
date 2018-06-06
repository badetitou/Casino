Class {
	#name : #BLActionAppel,
	#superclass : #BLAction,
	#category : 'BLWebModel'
}

{ #category : #accessing }
BLActionAppel >> appelant [
	<MSEProperty: #appelant type: #BLWidget opposite: #actionsAppel>
	<MSEComment: 'All Famix accesses pointing to this structural entity'>
	<source>
	^ appelant
]

{ #category : #accessing }
BLActionAppel >> appelant: aBLWidget [
	appelant := aBLWidget
]

{ #category : #accessing }
BLActionAppel >> call [
	<MSEProperty: #call type: #BLPhase opposite: #actions>
	<MSEComment: 'All Famix accesses pointing to this structural entity'>
	<target>
	^ call
]

{ #category : #accessing }
BLActionAppel >> call: aBLPhase [
	call := aBLPhase
]

{ #category : #initialization }
BLActionAppel >> initialize [
	super initialize.
]

{ #category : #accessing }
BLActionAppel >> to [
	^ self call
]

{ #category : #accessing }
BLActionAppel >> to: aBLPhase [
	self call: aBLPhase
]
