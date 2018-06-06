Class {
	#name : #BLRuleCondition,
	#superclass : #Object,
	#instVars : [
		'attributName'
	],
	#category : 'BLGP'
}

{ #category : #accessing }
BLRuleCondition >> attributName [
	^ attributName
]

{ #category : #accessing }
BLRuleCondition >> attributName: anObject [
	attributName := anObject
]

{ #category : #testing }
BLRuleCondition >> isVerifiedUsing: aContext [
	self subclassResponsibility
]
