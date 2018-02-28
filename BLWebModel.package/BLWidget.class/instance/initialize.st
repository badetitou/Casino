accessing
initialize
	super initialize.
	actionsAppel := FMMultivalueLink on: self opposite: #call:.
	actionsAsynchrone := FMMultivalueLink on: self opposite: #call: