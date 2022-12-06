Class {
	#name : #CSNVPGMVizualization,
	#superclass : #Object,
	#instVars : [
		'modules',
		'vModules',
		'vPages',
		'vPackages',
		'vizualization',
		'colorPaletteModules'
	],
	#category : #'Casino-Model-Visualisation-PackagesGroupModule'
}

{ #category : #accessing }
CSNVPGMVizualization >> build [

	| packageShapes eb |
	vizualization := RSCanvas new.
	packageShapes := vPackages collect: [ :vPackage | 
		                 RSEllipse new
			                 popup;
			                 draggable;
			                 model: vPackage model;
			                 color:
				                 (colorPaletteModules scale:
						                  (self moduleOfVPackage: vPackage));
			                 size: 7;
			                 yourself ].


	vizualization addAll: packageShapes.

	eb := RSLineBuilder arrowedLine.
	eb
		canvas: vizualization;
		withBorderAttachPoint;
		moveBehind;
		source: vPackages
		connectFrom: [ :vPackage | vPackage model ]
		toAll: [ :vPackage | (vPackage children collect: #model) asSet ].

	RSTreeLayout new on: vizualization nodes.
	vizualization @ RSCanvasController.
	vizualization zoomToFit
]

{ #category : #accessing }
CSNVPGMVizualization >> initialize [

	super initialize.
	vModules := OrderedCollection new.
	vPages := OrderedCollection new.
	vPackages := OrderedCollection new.
	colorPaletteModules := RSColorPalette qualitative flatui120
]

{ #category : #accessing }
CSNVPGMVizualization >> moduleOfVPackage: aVPackage [

	| module |
	module := nil.
	aVPackage allChildren do: [ :child | 
		(child isKindOf: CSNVPage) ifTrue: [ 
			module
				ifNil: [ module := child module ]
				ifNotNil: [ child module = module ifFalse: [ ^ nil ] ] ] ]
]

{ #category : #accessing }
CSNVPGMVizualization >> modules [

	^ modules
]

{ #category : #accessing }
CSNVPGMVizualization >> modules: anObject [

	modules := anObject
]

{ #category : #accessing }
CSNVPGMVizualization >> modulesToModel [

	"I transform my modules source as a model"

	modules do: [ :module | 
		| vModule |
		vModule := vModules add: CSNVModule new.
		module pages do: [ :page | 
			| vPage |
			vPage := vPages add: CSNVPage new.
			vPage module: vModule.
			vPage model: page ] ].

	vPages do: [ :vPage | 
		vPage model source ifNotNil: [ :p | 
			(p source atScope: FamixTPackage) do: [ :package | 
				| supPackage subVPackage |
				subVPackage := vPackages
					               detect: [ :vPackage | vPackage model = package ]
					               ifNone: [ 
						               | vPackage |
						               vPackage := vPackages add: CSNVPackage new.
						               vPackage model: package ].
				subVPackage addPage: vPage.
				supPackage := package parentPackage.
				[ supPackage isNotNil ] whileTrue: [ 
					| supVPackage |
					supVPackage := vPackages
						               detect: [ :vPackage | 
						               vPackage model = supPackage ]
						               ifNone: [ 
							               | vPackage |
							               vPackage := vPackages add: CSNVPackage new.
							               vPackage model: supPackage ].
					supVPackage addPackage: subVPackage.
					subVPackage := supVPackage.
					supPackage := supPackage parentPackage ] ] ] ]
]

{ #category : #accessing }
CSNVPGMVizualization >> vizualization [

	^ vizualization
]
