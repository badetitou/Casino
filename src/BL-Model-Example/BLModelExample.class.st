"
You can use me to create little model to tests the application
"
Class {
	#name : #BLModelExample,
	#superclass : #Object,
	#category : 'BL-Model-Example'
}

{ #category : #examples }
BLModelExample class >> generateDemo [
	| model phase2 pageMetier21 phase1 pageMetier11 pageMetier12 pageMetier13 home pageMetierHome widget1 widget2 widget3 widget4 widget5 actionAppel |
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
	widget1 := BLUIInputButton new name: 'widget1'.
	widget1 attributes at: 'label' put: 'goPhase1'.
	widget2 := BLUIInputButton new name: 'widget2'.
	widget2 attributes at: 'label' put: 'goPhase2'.
	home metiers add: pageMetierHome.
	pageMetierHome widgets add: widget1.
	pageMetierHome widgets add: widget2.
	actionAppel := BLActionAppel new.
	widget1 actionsAppel add: actionAppel.
	phase1 actions add: actionAppel.
	widget3 := BLUIInputButton new name: 'widget3'.
	widget3 attributes at: 'label' put: 'widget3'.
	widget4 := BLUIInputButton new name: 'widget4'.
	widget4 attributes at: 'label' put: 'widget4'.
	widget5 := BLUIInputButton new name: 'widget5'.
	widget5 attributes at: 'label' put: 'widget5'.
	pageMetier11 widgets add: widget3.
	pageMetier12 widgets add: widget4.
	pageMetier13 widgets add: widget5.
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
			widget2.
			widget3.
			widget4.
			widget5}.
	^ model
]

{ #category : #examples }
BLModelExample class >> generateDemoLinkBetweenPhases [
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
	phase1 pageMetiers add: pageMetier11.
	phase1 pageMetiers add: pageMetier12.
	phase1 pageMetiers add: pageMetier13.
	home := BLPhase new
		name: #home;
		realClassName: #fr::bl::phase2;
		codeValue: #codeValue;
		codePhase: #codePhase.
	pageMetierHome := BLPageMetier new name: #pageHome.
	widget1 := SSInputText new name: 'widget1'.
	widget1 attributes at: 'label' put: 'goPhase1'.
	widget2 := SSInputText new name: 'widget2'.
	widget1 attributes at: 'label' put: 'goPhase2'.
	home pageMetiers add: pageMetierHome.
	pageMetierHome widgets add: widget1.
	pageMetierHome widgets add: widget2.
	actionAppel := BLActionAppel new.
	widget1 actions add: actionAppel.
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
]

{ #category : #examples }
BLModelExample class >> generateModelWithOnePhase [
	| model |
	model := MooseModel new.
	model name: #generateModelWithOnePhase.
	model
		add:
			(BLPhase new
				name: #Phase1;
				realClassName: #fr::bl::Phase1;
				codeValue: #codeValue;
				codePhase: #codePhase).
	^ model
]

{ #category : #examples }
BLModelExample class >> generateModelWithOnePhaseWithPageMetierAndRecursiveWidget [
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
]

{ #category : #examples }
BLModelExample class >> generateModelWithTwoPhasesAndOnePageMetier [
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
]

{ #category : #examples }
BLModelExample class >> generateModelWithTwoPhasesAndThreePageMetier [
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
]

{ #category : #examples }
BLModelExample class >> generateModelWithTwoPhasesAndThreePageMetierAnd1Widget [
	| model phase1 phase2 pageMetier11 pageMetier21 pageMetier22 widget1 |
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
	widget1 := BLWidget new name: #widget1.
	phase1 pageMetiers add: pageMetier11.
	phase2 pageMetiers add: pageMetier21.
	phase2 pageMetiers add: pageMetier22.
	pageMetier22 widgets add: widget1.
	model name: #generateModelWithTwoPhasesAndThreePageMetierAnd1Widget.
	model add: phase1.
	model add: phase2.
	model add: pageMetier11.
	model add: pageMetier21.
	model add: pageMetier22.
	model add: widget1.
	^ model
]
