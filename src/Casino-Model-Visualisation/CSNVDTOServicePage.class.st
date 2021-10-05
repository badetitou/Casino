Class {
	#name : #CSNVDTOServicePage,
	#superclass : #Object,
	#instVars : [
		'dtos',
		'canvas',
		'dtosShape',
		'eb',
		'serviceEndpoints',
		'pages',
		'servicesShape',
		'pagesShapes',
		'shapes'
	],
	#category : #'Casino-Model-Visualisation'
}

{ #category : #'as yet unclassified' }
CSNVDTOServicePage >> forModel: aCasinoModel [

	dtos := aCasinoModel allWithSubTypesOf: CSNBuBusinessType.
	serviceEndpoints := aCasinoModel allWithSubTypesOf: CSNServiceAPI.
	pages := aCasinoModel allWithSubTypesOf: CSNPage.


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

	pagesShapes := pages
		               collect: [ :page | 
			               | ellipse |
			               ellipse := RSBox new
				                          size: 20;
				                          model: page;
				                          color: Color red;
				                          yourself.
			               ellipse ]
		               as: RSGroup.


	shapes := dtosShape , servicesShape , pagesShapes.

	canvas addAll: shapes.

	"link service and DTO"
	eb := RSLineBuilder arrowedLine.
	eb canvas: canvas.
	eb color: Color gray.
	eb moveBehind.
	eb
		fromShapes: servicesShape;
		toShapes: dtosShape.
	eb width: 5.
	eb connectToAll: [ :service | service allUsedType ].

	"link DTO with DTO"
	eb := RSLineBuilder arrowedLine.
	eb canvas: canvas.
	eb color: Color green.
	eb moveBehind.
	eb shapes: dtosShape.
	eb width: 5.
	eb connectToAll: #dependencies.
	RSForceBasedLayout new
		charge: -500;
		on: shapes.

	"Link Service with Page"
	eb := RSLineBuilder arrowedLine.
	eb canvas: canvas.
	eb color: Color gray.
	eb moveBehind.
	eb
		fromShapes: pagesShapes;
		toShapes: servicesShape.
	eb width: 5.
	eb connectToAll: [ :page | 
		((page allToScope: CSNWidget) flatCollect: [ :widget | 
			 widget actions collect: [ :action | action behavior collect: [ :behavior | (behavior toScope: CSNBCall) collect: #distantService ] ] ]) flattened ].
	RSForceBasedLayout new
		charge: -500;
		on: shapes.


	shapes @ RSPopup.
	shapes @ RSDraggable.
	canvas @ RSCanvasController
]
