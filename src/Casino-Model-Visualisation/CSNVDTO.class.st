Class {
	#name : #CSNVDTO,
	#superclass : #Object,
	#instVars : [
		'dtos',
		'canvas',
		'dtosShape',
		'eb'
	],
	#category : #'Casino-Model-Visualisation'
}

{ #category : #'as yet unclassified' }
CSNVDTO >> forModel: aCSNModel [

	dtos := aCSNModel allWithSubTypesOf: CSNBuBusinessType.

	canvas := RSCanvas new.

	dtosShape := dtos
		             collect: [ :dto | 
			             | ellipse |
			             ellipse := RSLabel new
				                        size: 10;
				                        text: ((dto name withoutSuffix: 'GWT') withoutSuffix: 'DTO');
				                        model: dto;
				                        color: Color black;
				                        yourself.

			             "(dto name endsWith: 'DTOGWT') ifTrue: [ ellipse color: Color blue ] ifFalse: [ ellipse color: Color green ]."
			             ellipse ]
		             as: RSGroup.

	canvas addAll: dtosShape.


	eb := RSEdgeBuilder arrowedLine.
	eb canvas: canvas.
	eb color: Color gray.
	eb moveBehind.
	eb shapes: dtosShape.
	eb connectToAll: #dependencies.

	RSForceBasedLayout new
		charge: -500;
		on: dtosShape.

	dtosShape @ RSPopup.
	dtosShape @ RSDraggable.

	canvas @ RSCanvasController
]
