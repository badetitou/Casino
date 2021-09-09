Class {
	#name : #CSNModelImporterOfficeVisitor,
	#superclass : #CSNModelImporterCoreWebVisitor,
	#category : #'Casino-Migration-Omaje'
}

{ #category : #visiting }
CSNModelImporterOfficeVisitor >> visitCSNUIParagraph: aCSNUIParagraph [
	"BLLabelItem is override in BLOffice"
  ^(#('BLLabel' 'Label' 'FactoryBLLabel' 'ComponentUtils' 'InlineLabel' 'BLTextInputItem') includes: source invokedClassName) ifTrue: [ | paragraph |
        paragraph := self createWidget: aCSNUIParagraph.
        'ComponentUtils' = source invokedClassName ifTrue: [ self attributeFor: paragraph fromComponentUtilsForInvocation: source ] ifFalse: [ paragraph
                 addAttribute: ((self create: CSNUILabel) attributeValue: (source parameters at: 1 ifAbsent: [ '' ]));
                 addAttribute: ((self create: CSNUIClass) attributeValue: ((source parameters size = 2 ifTrue: [ ((source parameters at: 2) prefixMatchesRegex: 'BLLabel\..*') ifTrue: [ source parameters at: 2 ] ifFalse: [ 'NIVEAU2' ] ] ifFalse: [ source parameters at: 3 ifAbsent: [ 'NIVEAU2' ] ]) removePrefix: 'BLLabel.')) ].
        paragraph ] ifFalse: [ nil ]
]
