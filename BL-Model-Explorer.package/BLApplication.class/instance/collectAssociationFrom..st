accessing
collectAssociationFrom: invoc
	| phase |
	phase :=  self searchCalledPhaseFromInvocation: invoc .
	"self haltIf: ['*PhaseDag*' match: phase value mooseName]."
	^ (self searchCandidatesInvokingPhaseFromAssociation: invoc) collect: [ :from | Association new key: from value: phase ]
	
	