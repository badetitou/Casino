Class {
	#name : #BLRuleConditionExitsClass,
	#superclass : #BLRuleCondition,
	#category : 'BLGP'
}

{ #category : #testing }
BLRuleConditionExitsClass >> isVerifiedUsing: aContext [
	^ aContext select: [ :a | a isClass and: [ a name = attributName ] ]
]
