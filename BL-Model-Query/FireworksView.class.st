Class {
	#name : #FireworksView,
	#superclass : #Object,
	#category : 'BL-Model-Query-Fireworks'
}

{ #category : #'view creation' }
FireworksView >> openViewForModel: aBLModel [
	| b |
	b := RTMondrian new.
	b shape circle color: [ :cl | cl color ].
	b nodes: aBLModel allBLPhase , aBLModel allBLWidget.
	b edges useAssociations: (aBLModel allBLPhase collect: #recursiveWidgetAssoc) flatten.
	b layout force strength: 0.4.
	b view pushBackEdges.
	^ b
]
