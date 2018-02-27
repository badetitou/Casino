initialization
initialize
	super initialize.
	container := FMMultiMultivalueLink on: self opposite: #metiers.
	widgets := FMMultivalueLink on: self opposite: #containerMetier: