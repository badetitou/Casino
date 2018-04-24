as yet unclassified
openViewForModel: aBLModel
	| b |
	b := RTMondrian new.
	b shape circle color: [ :cl | cl color ].
	b nodes: aBLModel allBLPhase , aBLModel allBLPageMetier , aBLModel allBLWidget , aBLModel allBLService.
	b edges
		useAssociations:
			((aBLModel allBLPhase collect: #allAssociations) , (aBLModel allBLPageMetier collect: #allAssociations)
				, (aBLModel allBLWidget collect: #allAssociations)) flatten.
	b layout force strength: 0.4.
	b view pushBackEdges.
	^ b