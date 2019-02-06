Class {
	#name : #WidgetAnalysisView,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Casino-Model-Query-Fireworks'
}

{ #category : #'instance creation' }
WidgetAnalysisView class >> newWithModel: aMooseModel [
	^ self new model: aMooseModel; yourself
]

{ #category : #accessing }
WidgetAnalysisView >> gwtNamespace [
	^ 'com::google::gwt::*'
]

{ #category : #testing }
WidgetAnalysisView >> isClassFromGWT: aClass [
	^ self gwtNamespace match: aClass container mooseName
]

{ #category : #accessing }
WidgetAnalysisView >> model [
	^ model
]

{ #category : #accessing }
WidgetAnalysisView >> model: aMooseModel [
	model := aMooseModel
]

{ #category : #accessing }
WidgetAnalysisView >> modelWidget [
	 ^ self model allModelClasses
				select: [ :e | 
					(e superclassHierarchy contains: [ :a | a name = 'Widget' ])
						and: (self widgetNamespace match: e container mooseName) ]
]

{ #category : #accessing }
WidgetAnalysisView >> widgetNamespace [
	^ 'fr::bl::client::core::refui::*'
]
