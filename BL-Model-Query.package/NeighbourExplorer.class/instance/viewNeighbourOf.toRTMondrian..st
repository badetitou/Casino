view creation
viewNeighbourOf: aBLPhase toRTMondrian: b
	b shape rectangle color: [ :cl | cl color ].
	b
		nodes:
			{{aBLPhase}.
			aBLPhase metiers.
			aBLPhase widgets.
			(aBLPhase actions collect: #appelant) asSet} flatten.
	b shape line
		arrowedLine;
		withBorderAttachPoint;
		color: [ :assoc | self computeColorForAssociation: assoc ].
	b edges
		useAssociations:
			{aBLPhase linkToMetier.
			aBLPhase linkToWidgets.
			aBLPhase actions} flatten.
	b layout horizontalTree.
	^ b