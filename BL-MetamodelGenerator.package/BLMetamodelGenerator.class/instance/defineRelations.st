definition
defineRelations
	uiContainer <>-* widget.
	widget <>-* actionAppel.
	widget <>-* attribute.
	phase -* actionAppel.
	phase *-* pageMetier.
	service <>-* serviceAction.
	actionAttribute *-* behavior 