Class {
	#name : #CSNVSimpleVisualizationBuilder,
	#superclass : #HSimpleVisualizationBuilder,
	#category : #'Casino-Model-Visualisation-Modules-Card'
}

{ #category : #hooks }
CSNVSimpleVisualizationBuilder >> buildCompositeEmptyNodeIn: shape [

	| node box rect titleGroup subInfoShapes |
	node := shape model.
	titleGroup := self nodeStyler labelAndIconFor: node.
	shape addAll: titleGroup.

	subInfoShapes := self nodeStyler propertiesListFor: node.
	shape add: subInfoShapes.
	RSVerticalLineLayout new
		gapSize: 1.5;
		on: shape children.

	rect := shape children encompassingRectangle.
	box := RSBox new
		       model: node;
		       position: rect floatCenter;
		       extent: rect extent + 10;
		       cornerRadius: self fullCornerRadius;
		       color: (self colorFor: node);
		       border: (self borderFor: node);
		       yourself.
	shape add: box.
	box pushBack.
	shape schildren: #(  ).

	shape
		propertyAt: #background put: box;
		adjustToChildren
]

{ #category : #hooks }
CSNVSimpleVisualizationBuilder >> buildCompositeFullNodeIn: shape [

	| childrenShapes node titleGroup title titleBox children boxChildren titleRadius boxChildrenRadius list subInfoShapes |
	node := shape model.
	
	titleGroup := self nodeStyler labelAndIconFor: node.
	subInfoShapes := self nodeStyler propertiesListFor: node.
	titleGroup add: subInfoShapes.
	RSVerticalLineLayout new
		gapSize: 1.5;
		on: titleGroup.


	titleBox := RSBox new
		            extent: titleGroup extent + 10;
		            color: ((self colorFor: node) alpha: 0.7);
		            position: titleGroup position;
		            yourself.
	title := RSComposite new
		         add: titleBox;
		         addAll: titleGroup;
		         adjustToChildren;
		         yourself.
	shape propertyAt: #background put: titleBox.
	childrenShapes := self childrenFor: node.
	self layoutOn: childrenShapes parent: node.

	shape schildren: childrenShapes.
	childrenShapes do: [ :child | child sparent: shape ].
	children := childrenShapes asShape padding: 10.
	childrenShapes do: [ :child | child model position: child position ].
	title width < children width
		ifTrue: [ 
			titleBox width: children width.
			title adjustToChildren ]
		ifFalse: [ children width: title width ].
	boxChildren := self boxChildrenFor: node.
	titleRadius := self topCornerRadius.
	boxChildrenRadius := self bottomCornerRadius.
	list := { 
		        title.
		        children }.
	self nodeStyler position = #below ifTrue: [ 
		titleRadius := self bottomCornerRadius.
		boxChildrenRadius := self topCornerRadius.
		list := { 
			        children.
			        title } ].
	RSVerticalLineLayout new
		gapSize: 0;
		on: list.
	titleBox cornerRadius: titleRadius.
	boxChildren
		cornerRadius: boxChildrenRadius;
		fromRectangle: children encompassingRectangle.


	shape
		add: title;
		add: boxChildren;
		add: children.

	shape adjustToChildren
]

{ #category : #hooks }
CSNVSimpleVisualizationBuilder >> initialize [

	super initialize.
	self nodeStyler: CSNVNodeStyler new
]
