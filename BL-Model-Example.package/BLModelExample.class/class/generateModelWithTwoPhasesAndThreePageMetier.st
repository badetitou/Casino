examples
generateModelWithTwoPhasesAndThreePageMetier
	| model phase1 phase2 pageMetier11 pageMetier21 pageMetier22 |
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
	pageMetier11 := BLPageMetier new name: #PageMetier11.
	pageMetier21 := BLPageMetier new name: #PageMetier21.
	pageMetier22 := BLPageMetier new name: #PageMetier22.
	phase1 metiers add: pageMetier11.
	phase2 metiers add: pageMetier21.
	phase2 metiers add: pageMetier22.
	model name: #generateModelWithTwoPhasesAndThreePageMetier.
	model add: phase1.
	model add: phase2.
	model add: pageMetier11.
	model add: pageMetier21.
	model add: pageMetier22.
	^ model