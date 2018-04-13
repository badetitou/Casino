examples
generateModelWithOnePhaseWithPageMetierAndRecursiveWidget
	| model phase1 pageMetier11 widget1 widget11 widget12 |
	model := MooseModel new.
	phase1 := BLPhase new
		name: #Phase1;
		realClassName: #fr::bl::Phase1;
		codeValue: #codeValue;
		codePhase: #codePhase.
	pageMetier11 := BLPageMetier new name: #PageMetier11.
	widget1 := BLWidget new name: #widget1.
	widget11 := BLWidget new name: #widget11.
	widget12 := BLWidget new name: #widget12.
	phase1 metiers add: pageMetier11.
	pageMetier11 widgets add: widget1.
	widget1 widgets add: widget11.
	widget1 widgets add: widget12.
	model name: #generateModelWithOnePhaseWithPageMetierAndRecursiveWidget.
	model add: phase1.
	model add: pageMetier11.
	model add: widget1.
	model add: widget11.
	model add: widget12.
	^ model