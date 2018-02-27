accessing
initialize
	super initialize.
	metiers := FMMultiMultivalueLink on: self opposite: #container.
	widgets := FMMultivalueLink on: self opposite: #containerPhase: