definition
defineRelations
	(uiContainer <>-* widget) withNavigation.
	(widget <>-* actionAppel) withNavigation.
	(widget <>-* attribute) withNavigation.
	(actionAppel *- phase) withNavigation.
	(phase *-* pageMetier) withNavigation.
	(service <>-* serviceAction) withNavigation.
	(actionAttribute *-* behavior) withNavigation