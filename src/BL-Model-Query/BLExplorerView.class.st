Class {
	#name : #BLExplorerView,
	#superclass : #Object,
	#category : #'BL-Model-Query-RoassalGlobal'
}

{ #category : #'view creation' }
BLExplorerView >> legend: b [
	| lb |
	lb := RTLegendBuilder new.
	lb view: b view.
	lb left.
	lb textSize: 5.
	lb addText: 'Legende'.
	lb addColor: BLPage color text: 'Phase'.
	lb addColor: BLWidget color text: 'Widget'.
	lb addColor: BLBusinessPage color text: 'Page Metier'.
	lb addLineColor: Color gray text: 'Contain'.
	lb addLineColor: Color blue text: 'Link action'.
	lb build
]

{ #category : #'view creation' }
BLExplorerView >> openViewForModel: aBLModel andPage: aPage [
	| b |
	b := RTExploraBuilder new.
	b shape circle color: [ :cls | cls color ];
		withTextAbove: #name height: 1.
	b
		layout: [ RTClusterLayout new
				horizontalGap: 1];
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
