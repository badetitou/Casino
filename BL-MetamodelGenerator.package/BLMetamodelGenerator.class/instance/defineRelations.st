definition
defineRelations
	uiContainer <>-* widget.
	widget <>-* actionAppel.
	widget <>-* attribute. 
	actionAppel -* phase.
	phase *-* widget.
	service <>-* serviceAction.
	actionAttribute *-* behavior.