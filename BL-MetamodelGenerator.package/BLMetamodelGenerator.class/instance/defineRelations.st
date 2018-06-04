definition
defineRelations
	uiContainer <>-* widget.
	widget <>-* actionAppel.
	widget <>-* attribute.
	actionAppel *- phase.
	phase *-* pageMetier.
	service <>-* serviceAction.
	actionAttribute *-* behavior 