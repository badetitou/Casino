examples
generateDemo
	| model phase2 pageMetier1 |
	model := MooseModel new.
	model name: 'demos'.
	phase2 := BLPhase new
		name: #phase2;
		realClassName: #fr::bl::phase2;
		codeValue: #codeValue;
		codePhase: #codePhase.
	pageMetier1 := BLPageMetier new name: #page1.
	phase2 metiers add: pageMetier1.
	model addAll: {phase2 . pageMetier1}.
	^ model