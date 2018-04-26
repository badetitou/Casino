private
searchAffectationForInvocation: anInvocation
	"The mooseVariable if there is an affactation
	else nil
	
	1. We look for a local variable
	2. We look for a class variable 
		2.1 Because we don't have enought information with famix. We've supposed that the affectation is not to far from the access of the variable. So we've write 5 'space'. But it's not sure
	3. We look in declaration in the class
	"

	^ anInvocation affectation 