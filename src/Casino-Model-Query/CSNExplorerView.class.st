Class {
	#name : #CSNExplorerView,
	#superclass : #Object,
	#category : #'Casino-Model-Query-RoassalGlobal'
}

{ #category : #'view creation' }
CSNExplorerView >> legend: b [
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
CSNExplorerView >> openViewForModel: aBLModel andPage: aPage [
	| b |
	b := RTExploraBuilder new.
	b shape circle color: [ :cls | cls color ];
		withTextAbove: #name height: 1.
	b
		layout: [ RTClusterLayout new];
		onClickExplore: [ :cls | cls outgoingElement ];
		withPopup;
		dragChildren;
		node: aPage.
	"	b view canvas color: Color white."
	b build.
	"self
		legend: b."
	^ b
]
