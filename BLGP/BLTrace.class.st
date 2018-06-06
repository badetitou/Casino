Class {
	#name : #BLTrace,
	#superclass : #GPNode,
	#instVars : [
		'rightModel'
	],
	#category : 'BLGP'
}

{ #category : #initialization }
BLTrace >> addChild: aNode [
	children add: aNode.
	aNode rightModel: self rightModel 
]

{ #category : #initialization }
BLTrace >> initialize [
	super initialize.
	self rightModel: MooseModel new. 
	self printBlock: [ :child :cxt | 'Trace : ' ].
	self
		evaluationBlock: [ :child :cxt | 
			child do: [ :ch | ch evaluateUsing: cxt ].
			self rightModel ]
]

{ #category : #accessing }
BLTrace >> rightModel [
	^ rightModel 
]

{ #category : #accessing }
BLTrace >> rightModel: anObject [
	rightModel := anObject
]
