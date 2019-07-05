Class {
	#name : #CSNGlobalView,
	#superclass : #TLObject,
	#category : #'Casino-Model-Query'
}

{ #category : #'as yet unclassified' }
CSNGlobalView class >> generalViewForModel: aGUIModel [
	| visu |
	visu := TLCycleDependencies  new 
	 	entities: {"aGUIModel allCSNCell."aGUIModel allCSNWidget. "aGUIModel allCSNLayout"} flattened;
		property: [ :each | each atScope: CSNWidget  ];
		widthBlock: [ :each | 6 ];
		heightBlock: [ :each | 6 ];
		yourself.
	^ visu
]

{ #category : #'as yet unclassified' }
CSNGlobalView class >> pageExplorerFor: aGUIModel [
	| visu |
	(visu := TLVisualization fromEntities: aGUIModel allCSNPage)
		layout:
			(TLTreeLayout new
				useOutgoingLinks;
				leavesGap: 50;
				levelGap: 30;
				yourself);
		addInteraction: (TLExpandCollapseNodesAction property: [ :n | (n isKindOf: CSNPage) ifTrue: [ n businessPage ] ifFalse: [ n subWidgets ] ]) onClick.
	visu styleSheet nodeLabel: #asString position: #top.
	^ visu
]

{ #category : #'see class side' }
CSNGlobalView >> seeClassSide [
]
