Class {
	#name : #BLRuleExecutionCreateClass,
	#superclass : #BLRuleExecution,
	#category : 'BLGP'
}

{ #category : #'as yet unclassified' }
BLRuleExecutionCreateClass >> runInContext: aContext withName: aString [
	aContext add:( FAMIXClass new name: aString) 
]
