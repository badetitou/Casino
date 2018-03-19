example
example
	"
	self new example print
	" 

	| e |
	e := GPEngine new.
	e configuration: GPKnapsackConfiguration new.
	e execute.
	^ e pickBestIndividual