as yet unclassified
openViewForModel: aBLModel
	| b |
	b := RTMondrian new.
	b shape rectangle color: [ :cl | cl color ].
	b nodes: aBLModel allBLPhase , aBLModel allBLPageMetier , aBLModel allBLWidget.
	b layout force strength: 0.4.
	b view pushBackEdges.
	^ b