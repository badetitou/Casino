initialization
initialize
	super initialize.
	actionsAppel := FMMultivalueLink on: self opposite: #appelant:.
	widgets := FMMultivalueLink on: self opposite: #containerWidget:.
	parameters := Dictionary new.
	attributes := OrderedCollection new