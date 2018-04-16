examples
generateDemoLinkBetweenPhases
	| model phase2 pageMetier21 phase1 pageMetier11 pageMetier12 pageMetier13 home pageMetierHome widget1 widget2 actionAppel |
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
	home := BLPhase new
		name: #home;
		realClassName: #fr::bl::phase2;
		codeValue: #codeValue;
		codePhase: #codePhase.
	pageMetierHome := BLPageMetier new name: #pageHome.
	widget1 := BLLinkLabel new name: 'widget1'.
	widget1 attributes at: 'label' put: 'goPhase1'.
	widget2 := BLLinkButton new name: 'widget2'.
	widget1 attributes at: 'label' put: 'goPhase2'.
	home metiers add: pageMetierHome.
	pageMetierHome widgets add: widget1.
	pageMetierHome widgets add: widget2.
	actionAppel := BLActionAppel new.
	widget1 actionsAppel add: actionAppel.
	phase1 actions add: actionAppel.
	model
		addAll:
			{phase1.
			pageMetier11.
			pageMetier12.
			pageMetier13.
			phase2.
			pageMetier21.
			home.
			pageMetierHome.
			widget1.
			widget2}.
	^ model