accessing
initialize
	super initialize.
	metiers := FMMultiMultivalueLink on: self opposite: #container.
	actions := FMMultivalueLink on: self opposite: #call: