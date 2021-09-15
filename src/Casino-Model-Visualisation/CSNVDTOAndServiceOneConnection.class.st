Class {
	#name : #CSNVDTOAndServiceOneConnection,
	#superclass : #Object,
	#instVars : [
		'dtos',
		'canvas',
		'dtosShape',
		'eb',
		'serviceEndpoints',
		'servicesShape',
		'shapes'
	],
	#category : #'Casino-Model-Visualisation'
}

{ #category : #'as yet unclassified' }
CSNVDTOAndServiceOneConnection >> forModel: aCasinoModel [

	dtos := aCasinoModel allWithSubTypesOf: CSNBuBusinessType.
	serviceEndpoints := aCasinoModel allWithSubTypesOf: CSNServiceAPI.

	canvas := RSCanvas new.

	dtosShape := dtos
		             collect: [ :dto | 
			             | ellipse |
			             ellipse := RSEllipse new
				                        size: 20;
				                        model: dto;
				                        color: Color black;
				                        yourself.
			             ellipse ]
		             as: RSGroup.

	servicesShape := serviceEndpoints
		                 collect: [ :serviceEndpoint | 
			                 | ellipse |
			                 ellipse := RSBox new
				                            size: 20;
				                            model: serviceEndpoint;
				                            color: Color blue;
				                            yourself.
			                 ellipse ]
		                 as: RSGroup.

	shapes := dtosShape , servicesShape.

	canvas addAll: shapes.

	eb := RSLineBuilder arrowedLine.
	eb canvas: canvas.
	eb color: Color gray.
	eb moveBehind.
	eb
		fromShapes: servicesShape;
		toShapes: dtosShape.
	eb width: 5.
	eb connectToAll: [ :service | { (service allUsedType at: #returnType) } flattened ifEmpty: (service allUsedType at: #parameters) ].

	RSForceBasedLayout new
		charge: -500;
		on: shapes.

	shapes @ RSPopup.
	shapes @ RSDraggable.

	canvas @ RSCanvasController
]
