definition
defineRelations
	phaseNotStandalone *-* pageMetier

	"pageMetier <>-* widget.
	phaseStandalone <>-* widget"

	"widget *-* action.
	actionAsynchrone *-* service.
	actionAppel *- phase"