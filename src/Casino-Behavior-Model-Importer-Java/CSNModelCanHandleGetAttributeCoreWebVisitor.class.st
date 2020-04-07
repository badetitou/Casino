Class {
	#name : #CSNModelCanHandleGetAttributeCoreWebVisitor,
	#superclass : #CSNModelBehaviorImporterVisitor,
	#category : #'Casino-Behavior-Model-Importer-Java-Visitor'
}

{ #category : #api }
CSNModelCanHandleGetAttributeCoreWebVisitor >> visitCSNAttribute: aCSNAttribute [
	<generated>
	^ false
]

{ #category : #api }
CSNModelCanHandleGetAttributeCoreWebVisitor >> visitCSNUILabel: aCSNUILabel [
	<generated>
	^ ({CSNUILink} anySatisfy: [ :possibleWidgetType | entity isOfType: possibleWidgetType ]) and: [ source signature beginsWith: 'getText' ]
]

{ #category : #api }
CSNModelCanHandleGetAttributeCoreWebVisitor >> visitCSNUIValue: aCSNUIValue [
	<generated>
	^ ({CSNUIInput} anySatisfy: [ :possibleWidgetType | entity isOfType: possibleWidgetType ]) and: [ source signature beginsWith: 'getText' ]
]
