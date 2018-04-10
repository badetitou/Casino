examples
generateModelWithTwoPhasesAndOnePageMetier
	| model phase1 phase2 pageMetier1 |
	model := MooseModel new.
	phase1 := BLPhase new
		name: #Phase1;
		realClassName: #fr::bl::Phase1;
		codeValue: #codeValue;
		codePhase: #codePhase.
	phase2 := BLPhase new
		name: #Phase2;
		realClassName: #fr::bl::Phase2;
		codeValue: #codeValue;
		codePhase: #codePhase.
	pageMetier1 := BLPageMetier new name: #PageMetier1.
	phase1 metiers add: pageMetier1.
	model name: #generateModelWithTwoPhasesAndOnePageMetier.
	model add: phase1.
	model add: phase2.
	model add: pageMetier1.
	^ model