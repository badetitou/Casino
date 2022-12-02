Class {
	#name : #CSNVPagesWithModulesInTheirPackageHierarchy,
	#superclass : #Object,
	#instVars : [
		'modules',
		'vizualization',
		'colorPalettePages'
	],
	#category : #'Casino-Model-Visualisation-PagesInTheirPackageHierarchy'
}

{ #category : #accessing }
CSNVPagesWithModulesInTheirPackageHierarchy >> build [


	| pagesShapes packages packagesShapes eb pages |
	vizualization := RSCanvas new.

	pages := modules flatCollect: #pages.
	pagesShapes :=  modules flatCollect: [ :module | module pages collect: [ :page | 
		              RSBox new
			              popup;
			              draggable;
			              model: page;
			              color: (colorPalettePages scale: module);
			              size: 7;
			              yourself ] ].

	vizualization addAll: pagesShapes.

	packages := (pages
		             collect: [ :p | 
		             p source ifNotNil: [ 
			             p source allAtScope: FamixTPackage ] ]
		             thenReject: #isNil) flattened asSet.

	packagesShapes := packages collect: [ :package | 
		                  RSEllipse new
			                  popup;
			                  draggable;
			                  model: package;
			                  color: Color brown;
			                  size: 7;
			                  yourself ].

	vizualization addAll: packagesShapes.

	eb := RSLineBuilder arrowedLine.
	eb
		canvas: vizualization;
		withBorderAttachPoint;
		moveBehind;
		source: packages
		connectFrom: [ :package | package parentPackage ]
		to: [ :package | package ].


	eb := RSLineBuilder arrowedLine.
	eb
		canvas: vizualization;
		withBorderAttachPoint;
		moveBehind;
		source: pages connectFrom: [ :page | 
			page source ifNotNil: [ :s | (s atScope: FamixTPackage) anyOne ] ]
		to: [ :page | page ].

	RSTreeLayout  new on: vizualization nodes.
	vizualization @ RSCanvasController.
	vizualization zoomToFit
]

{ #category : #accessing }
CSNVPagesWithModulesInTheirPackageHierarchy >> colorPalettePages [

	^ colorPalettePages
]

{ #category : #accessing }
CSNVPagesWithModulesInTheirPackageHierarchy >> colorPalettePages: anObject [

	colorPalettePages := anObject
]

{ #category : #accessing }
CSNVPagesWithModulesInTheirPackageHierarchy >> initialize [
	super initialize.
	colorPalettePages := RSColorPalette qualitative flatui120.
]

{ #category : #accessing }
CSNVPagesWithModulesInTheirPackageHierarchy >> modules [

	^ modules
]

{ #category : #accessing }
CSNVPagesWithModulesInTheirPackageHierarchy >> modules: anObject [

	modules := anObject
]

{ #category : #accessing }
CSNVPagesWithModulesInTheirPackageHierarchy >> vizualization [

	^ vizualization
]
