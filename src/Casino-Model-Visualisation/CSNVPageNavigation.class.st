Class {
	#name : #CSNVPageNavigation,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Casino-Model-Visualisation-PageNavigation'
}

{ #category : #'as yet unclassified' }
CSNVPageNavigation >> forModel: aCSNModel [

	| canvas pagesShape eb |
	canvas := RSCanvas new.
	pagesShape := aCSNModel allCSNPage collect: [ :page | 
		              RSEllipse new
			              popup;
			              draggable;
			              model: page;
			              color: Color blue;
			              size: 5;
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
		charge: -600;
		on: canvas nodes.
	canvas @ RSCanvasController.
	canvas zoomToFit.
	^ canvas
]
