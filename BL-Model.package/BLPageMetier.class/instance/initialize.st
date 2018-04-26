initialization
initialize
	super initialize.
	containerPhase := FMMultiMultivalueLink on: self opposite: #metiers.
	widgets := FMMultivalueLink on: self opposite: #containerMetier:.
	containerMetier := FMMultiMultivalueLink on: self opposite: #metiers.
	metiers := FMMultiMultivalueLink on: self opposite: #containerMetier