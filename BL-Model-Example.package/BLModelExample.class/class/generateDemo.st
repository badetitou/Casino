examples
generateDemo
	| model phase2 pageMetier21 phase1 pageMetier11 pageMetier12 pageMetier13 |
	model := MooseModel new.
	model name: 'demos'.
	phase2 := BLPhase new
		name: #phase2;
		realClassName: #fr::bl::phase2;
		codeValue: #codeValue;
		codePhase: #codePhase.
	pageMetier21 := BLPageMetier new name: #page1.
	phase2 metiers add: pageMetier21.
	phase1 := BLPhase new
		name: #phase1;
		realClassName: #fr::bl::phase2;
		codeValue: #codeValue;
		codePhase: #codePhase.
	pageMetier11 := BLPageMetier new name: #page1.
	pageMetier12 := BLPageMetier new name: #page2.
	pageMetier13 := BLPageMetier new name: #page3.
	phase1 metiers add: pageMetier11.
	phase1 metiers add: pageMetier12.
	phase1 metiers add: pageMetier13.
	model
		addAll:
			{phase1.
			pageMetier11.
			pageMetier12.
			pageMetier13.
						phase2.
						pageMetier21 }.
	^ model