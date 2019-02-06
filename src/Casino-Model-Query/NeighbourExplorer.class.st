"
""Generate BlApp""
aw := AnalyseCommand new.
fileName := 'D:\Users\benoit.verhaeghe\Documents\PFE\Source\BLCoreIncubatorGwt\src\fr\bl\application.module.xml'.
""fileName := '/home/badetitou/Document/PFE/Source/BLCoreIncubatorGwt/src/fr/bl/application.module.xml'.""
xml := aw getXmlFile: fileName.
mseFile := StandardFileStream fileNamed:  'D:\Users\benoit.verhaeghe\Documents\PFE\GeneralXmlui.mse' .
""mseFile := StandardFileStream fileNamed:  '/home/badetitou/Document/PFE/GeneralXmlui.mse' .""
mooseModel := MooseModel importFromMSEStream: mseFile .
mooseModel rootFolder: 'D:\Users\benoit.verhaeghe\Documents\PFE'.
""mooseModel rootFolder: '/home/badetitou/Document/PFE/'.""
blApp := BLApplication new model: mooseModel; applicationXml: xml ; sourceApp: './Source/BLCoreIncubatorGwt/'; sourceCore: './Source/BLCore-6.1.4/'.

blApp modelPhases.

blApp resetCache.
blApp linkViewPPContentWXmlUIService.

blApp linkFromConstructor.

blApp resetCache.
blApp linkFromConstructorWithoutSuperCall.

blApp linkXmlUi.
blApp linkPhasePageMetierToPhasePageMetierFromConstructor.

blApp linkForAbstractTabPhase.

blApp modelPageMetier.
blApp linkXmlUiPhaseAndPageMetier.
blApp linkPageMetierToPageMetier.

{blApp modelPhases , blApp modelPageMetier } flatten select: [ :a | '*XMLUi' match: a superclass mooseName ].

""Reset Work""
MooseModel resetRoot.
MooseModel resetMeta.

""Generate Bl Model""
model := MooseModel new name: 'blMooseModel'; yourself.
BLMooseModelCreator runOn: model from: blApp.
ne := NeighbourExplorer new.
ne model: model.
model allBLAction.
ne openGlamour.

""Add Model to moose panel""
MooseModel root add: model.

"
Class {
	#name : #NeighbourExplorer,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Casino-Model-Query-Neighbour'
}

{ #category : #accessing }
NeighbourExplorer >> buildLegend: legend [
]

{ #category : #accessing }
NeighbourExplorer >> legend: b [
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

{ #category : #accessing }
NeighbourExplorer >> model [
	^ model
]

{ #category : #accessing }
NeighbourExplorer >> model: aBLModel [
	model :=  aBLModel
]

{ #category : #accessing }
NeighbourExplorer >> openGlamour [
	^ GLMCompositePresentation new tabulator
		with: [ :t | 
			t
				row: [ :r | 
					r
						column: #index;
						column: #neighbour ].
			t transmit
				to: #index;
				andShow: [ :composite | 
					composite list
						title: 'Phase';
						format: [ :each | each name ] ].
			t transmit
				from: #index;
				to: #neighbour;
				andShow: [ :composite | 
					composite roassal2
						title: 'Neighbour';
						initializeView: [ RTMondrian new ];
						painting: [ :view :aBLPhase | self viewNeighbourOf: aBLPhase toRTMondrian: view ] ] ];
		title: 'Neighbour Explorer';
		openOn: self model allBLPage
]

{ #category : #'view creation' }
NeighbourExplorer >> viewNeighbourOf: aBLPhase toRTMondrian: b [
	b shape rectangle color: [ :cl | cl color ].
	b
		nodes:
			{{aBLPhase}.
			aBLPhase businessPage.
			(aBLPhase businessPage collect: #recursiveElements)} flattened.
	b shape line
		arrowedLine;
		withBorderAttachPoint.
	b edges
		useAssociations:
			{aBLPhase allAssociations.
			(aBLPhase businessPage collect: #allAssociations).
			((aBLPhase businessPage collect: #recursiveElements) flattened collect: #allAssociations)}
				flattened.
	b layout horizontalTree.
	b view elements when: TRMouseClick do: [ :evt | evt element model inspect ].
	self legend: b.
	^ b
]
