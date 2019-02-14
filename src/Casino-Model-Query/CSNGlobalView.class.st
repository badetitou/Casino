"
""Model should be a BL UI Model""

BLGlobalView new openViewForModel: model
"
Class {
	#name : #CSNGlobalView,
	#superclass : #Object,
	#category : #'Casino-Model-Query-RoassalGlobal'
}

{ #category : #'view creation' }
CSNGlobalView >> legend: b [
	| lb |
	lb := RTLegendBuilder new.
	lb view: b view.
	lb left.
	lb onDemand: 'Legende'.
	lb addColor: CSNPage color text: 'Phase'.
	lb addColor: CSNWidget color text: 'Widget'.
	lb addColor: CSNUIContainer color text: #CSNUIContainer.
	lb addColor: CSNBusinessPage color text: 'Page Metier'.
	lb addColor: CSNLayout color text: 'Layout'.
	lb addLineColor: Color gray text: 'Contain'.
	lb addLineColor: Color blue text: 'Link action'.
	lb build
]

{ #category : #'view creation' }
CSNGlobalView >> openViewForModel: aBLModel [
	| b |
	b := RTMondrian new.
	b shape circle color: [ :cl | cl color ].
	b nodes: (aBLModel allCSNWidget , aBLModel allCSNService, aBLModel allCSNLayout) asSet asOrderedCollection.
	(b shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	(b shape line arrowedLine
		headOffset: 1.0;
		color: [ :e | 
			((e key isKindOf: CSNWidget) and: [ e value isKindOf: CSNPage ])
				ifTrue: [ Color blue ]
				ifFalse: [ Color gray ] ]) shape head
		baseSize: 5.0;
		size: 8.
	b edges useAssociations: {(aBLModel allCSNWidget collect: #allAssociations). aBLModel allCSNLayout collect: #allAssociations} flattened.
	b layout force strength: 0.4.
	b view pushBackEdges.
	self legend: b.
	^ b
]
