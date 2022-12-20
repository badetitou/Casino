Class {
	#name : #CSNVNodeStyler,
	#superclass : #HNodeStyler,
	#category : #'Casino-Model-Visualisation-Modules-Card'
}

{ #category : #'as yet unclassified' }
CSNVNodeStyler >> emptyComposite [

	^ RSComposite new padding: (Margin
			   left: 0
			   right: 0
			   top: 0
			   bottom: 0)
]

{ #category : #'as yet unclassified' }
CSNVNodeStyler >> propertiesListFor: aCSNVNode [

	| subInfoShapes |
	aCSNVNode propertiesDic ifEmpty: [ ^ self emptyComposite ].
	subInfoShapes := aCSNVNode propertiesDic associationsCollect: [ :info | 
		                 RSLabel new
			                 model: info;
			                 text: info key , ': ' , info value printString;
			                 color: (self color rsValue: aCSNVNode);
			                 yourself ].
	RSVerticalLineLayout new
		gapSize: 1.5;
		on: subInfoShapes.
	^ RSComposite new
		  shapes: subInfoShapes;
		  padding: (Margin
				   left: 0
				   right: 0
				   top: 3
				   bottom: 8);
		  yourself
]
