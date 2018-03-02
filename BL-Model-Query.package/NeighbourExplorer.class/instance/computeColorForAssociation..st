view creation
computeColorForAssociation: assoc
	"model allBLAction
		do: [ :action | 
			(action key = assoc key and: [ action value = assoc value ])
				ifTrue: [ ^ action color ] ]."
	^ Color gray