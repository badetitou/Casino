"
We can precise here importation rules for Omaje specific widget
"
Class {
	#name : #CSNModelImporterOmajeVisitor,
	#superclass : #CSNModelImporterCoreWebVisitor,
	#category : #'Casino-Migration-Omaje'
}

{ #category : #visiting }
CSNModelImporterOmajeVisitor >> visitCSNUIPanel: aCSNUIPanel [
	^ ('BLImageUploadPanel' ~= source invokedClassName
		and: [ 'BLFileUploadPanel' ~= source invokedClassName
				and: [ 'OmajeUploadPanel' ~= source invokedClassName
						and: [ 'TabSubPanel' ~= source invokedClassName
								and: [ (#('FlexTable' 'BLFlexTable' 'BLGrid' 'Grid') includes: source invokedClassName) or: [ source invokedClassName endsWith: 'Panel' ] ] ] ] ])
		ifTrue: [ self createWidgetPanel: aCSNUIPanel ]
		ifFalse: [ nil ]
]
