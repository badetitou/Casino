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
