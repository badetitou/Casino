private
searchAffectationForInvocation: anInvocation
	"The mooseVariable if there is an affactation
	else nil
	
	1. We look for a local variable
	2. We look for a class variable 
		2.1 Because we don't have enought information with famix. We've supposed that the affectation is not to far from the access of the variable. So we've write 5 'space'. But it's not sure
	"

	^ ((anInvocation from localVariables select: [ :el | el sourceAnchor isNotNil ])
		select:
			[ :localVariable | localVariable sourceAnchor startPos < anInvocation sourceAnchor startPos and: [ localVariable sourceAnchor endPos > anInvocation sourceAnchor endPos ] ])
		at: 1
		ifAbsent: [ ((anInvocation from accesses select: #isWrite)
				select:
					[ :access | access sourceAnchor startPos < anInvocation sourceAnchor startPos and: [ access sourceAnchor endPos + 5 > anInvocation sourceAnchor startPos ] ])
				at: 1
				ifAbsent: [ ^ nil ] ]