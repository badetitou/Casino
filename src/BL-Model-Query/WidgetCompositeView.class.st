Class {
	#name : #WidgetCompositeView,
	#superclass : #WidgetAnalysisView,
	#instVars : [
		'compositeModels'
	],
	#category : #'BL-Model-Query-Composite'
}

{ #category : #accessing }
WidgetCompositeView >> compositeModels [
	^ compositeModels
]

{ #category : #accessing }
WidgetCompositeView >> computeComposite [
	self modelWidget do: [ :widgetFamixClass | self compositeModels add: (self computeModelFor: widgetFamixClass)  ].
]

{ #category : #accessing }
WidgetCompositeView >> computeModelFor: widgetFamixClass [
	| widgetModel |
	widgetModel := MooseModel new name: widgetFamixClass name; yourself.
	widgetModel add: widgetFamixClass.
	self containedTypeOf: widgetFamixClass to: widgetModel.
	^ widgetModel
]

{ #category : #accessing }
WidgetCompositeView >> containedTypeOf: widgetFamixClass to: widgetModel [
	widgetModel addAll: widgetFamixClass types.
	widgetFamixClass types do: [ :type | self containedTypeOf: type to: widgetModel  ]
]

{ #category : #initialization }
WidgetCompositeView >> initialize [
	super initialize.
	compositeModels := OrderedCollection new
]

{ #category : #accessing }
WidgetCompositeView >> openGlamour [
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
						title: 'Models';
						format: [ :each | each name ] ].
			t transmit
				from: #index;
				to: #neighbour;
				andShow: [ :composite | 
					composite roassal2
						title: 'Composition';
						initializeView: [ RTMondrian new ];
						painting: [ :view :aModel | self viewCompositeOf: aModel toRTMondrian: view ] ] ];
		title: 'Widget Composite';
		openOn: self compositeModels
]

{ #category : #accessing }
WidgetCompositeView >> viewCompositeOf: aModel toRTMondrian: b [
	b shape circle.
	b nodes: aModel allModelClasses.
	(b shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	b edges connectFrom: #typeContainer.
	b layout tree.
	b view pushBackEdges.
	^ b
]
