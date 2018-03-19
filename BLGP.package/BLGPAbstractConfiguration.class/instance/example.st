example
example
	"
	self new example print
	"

	| e |
	e := GPEngine new.
	e configuration: BLGPAbstractConfiguration  new.
	e execute.
	^ e pickBestIndividual