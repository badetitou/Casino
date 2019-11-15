"
I am a copy of class CSNQSGlobalView. This comment is copied from there, and might not be entirely accurate

Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CSNQRGlobalView,
	#superclass : #TLObject,
	#category : #'Casino-Model-Query'
}

{ #category : #'as yet unclassified' }
CSNQRGlobalView class >> generalViewForModel: aGUIModel [
	| visu |
	visu := TLVisualization fromEntities: aGUIModel allCSNWidget.
	visu layout: TLTreeLayout.
	^ visu
]

{ #category : #'as yet unclassified' }
CSNQRGlobalView class >> pageExplorerFor: aGUIModel [
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
CSNQRGlobalView >> legend: b [
	| lb |	
	lb := RTLegendBuilder new.	
	lb view: b view.	
	lb left.	
	lb onDemand: 'Legende'.	
	lb addColor: CSNPage color text: 'Phase'.	
	lb addColor: CSNWidget color text: 'Widget'.		
	lb addColor: Color red text: 'Layout'.	
	lb addLineColor: Color gray text: 'Contain'.	
	lb addLineColor: Color blue text: 'Link action'.	
	lb build
]

{ #category : #'see class side' }
CSNQRGlobalView >> openFirework: aCSNModel [
	| b nodes |
	nodes := aCSNModel allCSNWidget , aCSNModel allCSNLayout.
	b := RTMondrian new.
	b shape circle color: [ :cl | cl color ].
	b nodes: nodes.
	b edges useAssociations: (nodes collect: [ :widget | widget children collect: [ :child | widget -> child ] ]) flatten.
	b layout force strength: 0.4.
	b view pushBackEdges.
	^ b
]

{ #category : #'see class side' }
CSNQRGlobalView >> openViewForModel: aCSNModel [
	| b |
	b := RTMondrian new.
	b shape circle color: [ :cl | cl color ].
	b nodes: (aCSNModel allCSNWidget , aCSNModel allCSNService , aCSNModel allCSNLayout) asSet asOrderedCollection.
	(b shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	(b shape line arrowedLine
		headOffset: 1.0;
		color: [ :e | ((e key isKindOf: CSNWidget) and: [ e value isKindOf: CSNPage ]) ifTrue: [ Color blue ] ifFalse: [ Color gray ] ]) shape head
		baseSize: 5.0;
		size: 8.
	"b edges useAssociations: {(aBLModel allCSNWidget collect: #allAssociations). aBLModel allCSNLayout collect: #allAssociations} flattened."
	b layout force strength: 0.4.
	b view pushBackEdges.
	self legend: b.
	^ b
]

{ #category : #'see class side' }
CSNQRGlobalView >> openViewForModel: aBLModel andExplorePage: aPage [
	| b |
	b := RTExploraBuilder new.
	b shape circle color: [ :cls | cls color ].
	b
		layout: [ RTClusterLayout new ];
		onClickExplore: [ :cls | cls children ];
		withPopup;
		dragChildren;
		node: aPage.
	"	b view canvas color: Color white."
	b build.
	"self	
		legend: b."
	^ b
]

{ #category : #'see class side' }
CSNQRGlobalView >> seeClassSide [
]
