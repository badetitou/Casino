Class {
	#name : #BLRule,
	#superclass : #GPNode,
	#instVars : [
		'conditions',
		'executions'
	],
	#category : 'BLGP'
}

{ #category : #api }
BLRule >> addCondition: aCondition [
	self conditions add: aCondition 
]

{ #category : #api }
BLRule >> addExecution: anExecution [
	self executions  add: anExecution
]

{ #category : #accessing }
BLRule >> conditions [
	^ conditions
]

{ #category : #api }
BLRule >> evaluateUsing: aContext [
	(self isRunnableUsing: aContext)
		ifTrue: [ self run ]
]

{ #category : #initialization }
BLRule >> evaluateUsing: aContext to: aModel [
	(self isRunnableUsing: aContext)
		ifTrue: [ self run ]
]

{ #category : #accessing }
BLRule >> executions [
	^ executions
]

{ #category : #initialization }
BLRule >> initialize [
	super initialize.
	conditions := OrderedCollection new.
	executions := OrderedCollection new.
	self evaluationBlock: [ :child :ctx |  ]
]

{ #category : #initialization }
BLRule >> isRunnableUsing: aContext [
	"Check is all the BLRuleCondition are true"
	self conditions ifEmpty: [ ^ false ].
	^ self conditions allSatisfy: [ :condition | condition isRunnableUsing: aContext ]
]

{ #category : #initialization }
BLRule >> leftModel [
	^ leftModel
]

{ #category : #accessing }
BLRule >> leftModel: anObject [
	leftModel := anObject
]

{ #category : #initialization }
BLRule >> rightModel [
	^ rightModel
]

{ #category : #accessing }
BLRule >> rightModel: anObject [
	rightModel := anObject
]

{ #category : #private }
BLRule >> run [
	self notYetImplemented
]
