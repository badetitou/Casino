adding
addLinkBetweenServiceAndAttribute
	self listOfServiceAction do: [ :serviceAction | 
		| classContainer |
		classContainer := serviceAction source incomingInvocations collect: [ :invocation | invocation from belongsTo ].
		(self model allBLActionsAttribute select: [:action | classContainer includes: action source  ]) do: [ :action | action addService: serviceAction  ] ]