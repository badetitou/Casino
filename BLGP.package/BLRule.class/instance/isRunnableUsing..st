initialization
isRunnableUsing: aContext
	"Check is all the BLRuleCondition are true"
	self conditions ifEmpty: [ ^ false ].
	^ self conditions allSatisfy: [ :condition | condition isRunnableUsing: aContext ]