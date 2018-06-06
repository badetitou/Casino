Class {
	#name : #BLCreateClass,
	#superclass : #BLRule,
	#category : 'BLGP'
}

{ #category : #initialization }
BLCreateClass >> initialize [
	super initialize.
	self addCondition: BLRuleConditionExitsClass new
]

{ #category : #testing }
BLCreateClass >> isRunnableUsing: aContext [
	"Check is all the BLRuleCondition are true"

	^ aContext isKindOf: FAMIXClass
]
