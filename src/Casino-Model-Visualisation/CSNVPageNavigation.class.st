"
## Usage example

```st
CSNVPageNavigation new 
	withoutPages: (evolModel allCSNPage select: [:page | page name beginsWith: 'BureauAccueil']);
	forModel: evolModel
```
"
Class {
	#name : #CSNVPageNavigation,
	#superclass : #Object,
	#instVars : [
		'model',
		'withoutPages'
	],
	#category : #'Casino-Model-Visualisation-PageNavigation'
}

{ #category : #api }
CSNVPageNavigation >> forModel: aCSNModel [

	| canvas pagesShape eb interaction |
	canvas := RSCanvas new.
	pagesShape := (aCSNModel allCSNPage difference: self withoutPages  ) collect: [ :page | 
		              RSEllipse new
			              popup;
			              draggable;
			              model: page;
			              color: Color blue;
			              size: 7;
			              yourself ].
	canvas addAll: pagesShape.
	eb := RSLineBuilder arrowedLine.
	eb
		canvas: canvas;
		withBorderAttachPoint;
		moveBehind;
		connectFromAll: [ :page | 
			page caller flatCollect: [ :c | c atScope: CSNPage ] ].
		
	RSForceBasedLayout new
		charge: -100;
		on: canvas nodes.
	canvas edges @ RSHighlightable red.
	interaction := RSHighlightable red
		withLines;
		yourself.
	canvas edges do: #withBorder.
	canvas @ RSCanvasController.
	canvas nodes @ interaction.
	canvas zoomToFit.
	^ canvas
]

{ #category : #initialization }
CSNVPageNavigation >> initialize [ 
	super initialize.
	withoutPages := OrderedCollection new
]

{ #category : #accessing }
CSNVPageNavigation >> withoutPages [

	^ withoutPages
]

{ #category : #accessing }
CSNVPageNavigation >> withoutPages: anObject [

	withoutPages := anObject
]
