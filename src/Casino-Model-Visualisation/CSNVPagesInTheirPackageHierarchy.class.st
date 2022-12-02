"
## Usage

```st
CSNVPagesInTheirPackageHierarchy new
	pages: rhCSNModel allCSNPage;
	build;
	vizualization 
```
"
Class {
	#name : #CSNVPagesInTheirPackageHierarchy,
	#superclass : #Object,
	#instVars : [
		'pages',
		'vizualization'
	],
	#category : #'Casino-Model-Visualisation-PagesInTheirPackageHierarchy'
}

{ #category : #accessing }
CSNVPagesInTheirPackageHierarchy >> build [

	"rhCSNModel := MooseModel root first.
identity.
"

	| pagesShapes packages packagesShapes eb |
	vizualization := RSCanvas new.

	pagesShapes := pages collect: [ :page | 
		               RSEllipse new
			               popup;
			               draggable;
			               model: page;
			               color: Color blue;
			               size: 7;
			               yourself ].

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

	RSTreeLayout new on: vizualization nodes.
	vizualization @ RSCanvasController.
	vizualization zoomToFit
]

{ #category : #accessing }
CSNVPagesInTheirPackageHierarchy >> pages [

	^ pages
]

{ #category : #accessing }
CSNVPagesInTheirPackageHierarchy >> pages: anObject [

	pages := anObject
]

{ #category : #accessing }
CSNVPagesInTheirPackageHierarchy >> vizualization [

	^ vizualization
]
