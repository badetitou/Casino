Class {
	#name : #CSNJavaAddWidgetVisitor,
	#superclass : #CSNModelVisitor,
	#instVars : [
		'widgetToAdd',
		'sourceInvocation',
		'factory'
	],
	#category : #'Casino-Model-Importer-Java'
}

{ #category : #adding }
CSNJavaAddWidgetVisitor >> addWidget: aWidgetToAdd to: aWidget withInvocationOfAdd: aSourceInvocation usingFactory: aFactory [

	^ self
		  widgetToAdd: aWidgetToAdd;
		  sourceInvocation: aSourceInvocation;
		  factory: aFactory;
		  visit: aWidget
]

{ #category : #accessing }
CSNJavaAddWidgetVisitor >> factory [

	^ factory
]

{ #category : #accessing }
CSNJavaAddWidgetVisitor >> factory: anObject [

	factory := anObject
]

{ #category : #accessing }
CSNJavaAddWidgetVisitor >> sourceInvocation [

	^ sourceInvocation
]

{ #category : #accessing }
CSNJavaAddWidgetVisitor >> sourceInvocation: anObject [

	sourceInvocation := anObject
]

{ #category : #visiting }
CSNJavaAddWidgetVisitor >> visitCSNWidget: aCSNWidget [

	^ aCSNWidget
		addWidget: self widgetToAdd
		withInvocationOfAdd: self sourceInvocation
		usingFactory: self factory
]

{ #category : #accessing }
CSNJavaAddWidgetVisitor >> widgetToAdd [

	^ widgetToAdd
]

{ #category : #accessing }
CSNJavaAddWidgetVisitor >> widgetToAdd: anObject [

	widgetToAdd := anObject
]
