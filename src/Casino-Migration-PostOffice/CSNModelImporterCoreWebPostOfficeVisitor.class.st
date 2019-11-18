Class {
	#name : #CSNModelImporterCoreWebPostOfficeVisitor,
	#superclass : #CSNModelImporterCoreWebVisitor,
	#category : #'Casino-Migration-PostOffice'
}

{ #category : #visitor }
CSNModelImporterCoreWebPostOfficeVisitor >> visitCSNUIInputDate: aCSNUIInputDate [
	^ (#('BLTextBoxDate' 'BLTextBoxDatePicker' 'DatePicker' 'ThotTextBoxDatePicker') includes: source invokedClassName)
		ifTrue: [ (self createWidgetInput: aCSNUIInputDate)
				addAttribute: ((self create: CSNUIPlaceholder) attributeValue: (source parameters at: 1 ifAbsent: [ '' ]));
				parametersAt: #type put: 'date';
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebPostOfficeVisitor >> visitCSNUISelect: aCSNUISelect [
	^ (#('BLListBox' 'ListBox' 'BLMultiCombo' 'BLThotListBox') includes: source invokedClassName) 
		ifTrue: [ self createWidgetInput: aCSNUISelect ] 
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebPostOfficeVisitor >> visitCSNUITab: aCSNUITab [
	^ ('ThotSideBarItem' = source invokedClassName) 
		ifTrue: [ (self createWidget: aCSNUITab) ] 
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebPostOfficeVisitor >> visitCSNUITabManager: aCSNUITabManager [
	^ (#('TabSubPanel' 'ThotDeckSidePanel') includes: source invokedClassName) 
		ifTrue: [ (self createWidget: aCSNUITabManager) ] 
		ifFalse: [ nil ]
]
