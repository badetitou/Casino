Class {
	#name : #CSNModelExporter,
	#superclass : #Object,
	#instVars : [
		'model',
		'context'
	],
	#category : #'Casino-Model-Exporter'
}

{ #category : #actions }
CSNModelExporter class >> export: aBLMooseModel [
	self new model: aBLMooseModel; export
]

{ #category : #accessing }
CSNModelExporter >> context [
	^ context
]

{ #category : #run }
CSNModelExporter >> export [
	self prepareExport.
	self visit: model.
	self postExport 
]

{ #category : #accessing }
CSNModelExporter >> model [
	^ model
]

{ #category : #accessing }
CSNModelExporter >> model: anObject [
	model := anObject
]

{ #category : #run }
CSNModelExporter >> postExport [
	"can do something here"
]

{ #category : #api }
CSNModelExporter >> prepareExport [
	"can be override"
]

{ #category : #accessing }
CSNModelExporter >> root [
	^ self context root
]

{ #category : #visiting }
CSNModelExporter >> visit: anElement [
	^ anElement accept: self
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitAction: anAction [
	^ self visitOriginedEntity: anAction
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitActionAppel: anActionAppel [
	^ self visitAction: anActionAppel
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitActionService: anActionService [
	^ self visitAction: anActionService
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitAttribute: aBLAttribute [
	^ ''
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitCell: aBLCell [
	^ self visitWidget: aBLCell
]

{ #category : #visiting }
CSNModelExporter >> visitLayout: aBLLayout [
	^ self
]

{ #category : #visiting }
CSNModelExporter >> visitMooseModel: aMooseModel [
	self subclassResponsibility 
]

{ #category : #visiting }
CSNModelExporter >> visitOriginedEntity: anElement [
	anElement prepareAcceptFor: self.
	anElement writeCodeWith: self.
	anElement visitSuccessorWith: self 
]

{ #category : #visiting }
CSNModelExporter >> visitPage: aBLPage [
	^ self visitOriginedEntity: aBLPage
]

{ #category : #visiting }
CSNModelExporter >> visitPageMetier: aBLPageMetier [
	^ self visitUIContainer: aBLPageMetier 
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIAbsoluteHeight: aBLUIAbsoluteHeight [
	^ self
		visitUIHeight:
			aBLUIAbsoluteHeight
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIAbsoluteWidth: aBLUIAbsoluteWidth [
	^ self visitUIWidth: aBLUIAbsoluteWidth
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIButton: aBLUIButton [
	^ self visitUIContainer: aBLUIButton
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUICanvas: aCanvas [
	^ self visitUIContainer: aCanvas
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIClass: aBLUIClass [
	^ self visitAttribute: aBLUIClass
]

{ #category : #visiting }
CSNModelExporter >> visitUIContainer: aBLUIContainer [
	^ self visitWidget: aBLUIContainer
]

{ #category : #visiting }
CSNModelExporter >> visitUIDisabled: aBLUIDisabled [
	^ self visitAttribute: aBLUIDisabled
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIFieldset: aBLUIFieldset [
	^ self visitUIPanel: aBLUIFieldset
]

{ #category : #visiting }
CSNModelExporter >> visitUIGridLayout: aBLUIGridLayout [
	^ self visitLayout: aBLUIGridLayout
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIHeading1: aBLUIHeading1 [
	^ self visitUIContainer: aBLUIHeading1
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIHeading2: aBLUIHeading2 [
	^ self visitUIContainer: aBLUIHeading2
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIHeading3: aBLUIHeading3 [
	^ self visitUIContainer: aBLUIHeading3
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIHeading4: aBLUIHeading4 [
	^ self visitUIContainer: aBLUIHeading4
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIHeading5: aBLUIHeading5 [
	^ self visitUIContainer: aBLUIHeading5
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIHeading6: aBLUIHeading6 [
	^ self visitUIContainer: aBLUIHeading6
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIHeight: aBLUIHeight [
	^ self visitAttribute: aBLUIHeight
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIHorizontalLayout: aBLUIHorizontalLayout [
	^ self visitLayout: aBLUIHorizontalLayout
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIImage: aBLUIImage [
	^ self visitUILeaf: aBLUIImage
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInput: aBLUIInput [
	^ self visitUILeaf: aBLUIInput
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInputCheckbox: aBLUIInputCheckbox [
	^ self visitUIInput: aBLUIInputCheckbox
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInputColor: aBLUIInputColor [
	^ self visitUIInput: aBLUIInputColor
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInputDate: aBLUIInputDate [
	^ self visitUIInput: aBLUIInputDate
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInputDatetimeLocal: aBLUIInputDatetimeLocal [
	^ self visitUIInput: aBLUIInputDatetimeLocal
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInputEmail: aBLUIInputEmail [
	^ self
		visitUIInputText:
			aBLUIInputEmail
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInputFile: aBLUIInputFile [
	^ self visitUIInput: aBLUIInputFile
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInputMonth: aBLUIInputMonth [
	^ self visitUIInput: aBLUIInputMonth
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInputNumber: aBLUIInputNumber [
	^ self visitUIInput: aBLUIInputNumber
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInputPassword: aBLUIInputPassword [
	^ self
		visitUIInputText:
			aBLUIInputPassword
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInputRadio: aBLUIInputRadio [
	^ self visitUIInput: aBLUIInputRadio
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInputRange: aBLUIInputRange [
	^ self visitUIInput: aBLUIInputRange
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInputReset: aBLUIInputReset [
	^ self visitUIInput: aBLUIInputReset
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInputSearch: aBLUIInputSearch [
	^ self visitUIInput: aBLUIInputSearch
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInputSubmit: aBLUIInputSubmit [
	^ self visitUIInput: aBLUIInputSubmit
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInputTel: aBLUIInputTel [
	^ self visitUIInput: aBLUIInputTel
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInputText: aBLUIInputText [
	^ self visitUIInput: aBLUIInputText
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInputTime: aBLUIInputTime [
	^ self visitUIInput: aBLUIInputTime
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInputUrl: aBLUIInputUrl [
	^ self visitUIInput: aBLUIInputUrl
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIInputWeek: aBLUIInputWeek [
	^ self visitUIInput: aBLUIInputWeek
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUILabel: aBLUILabel [
	^ self visitAttribute: aBLUILabel
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUILeaf: aBLUILeaf [
	^ self visitWidget: aBLUILeaf
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUILink: aBLUILink [
	^ self visitUILeaf: aBLUILink
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIList: aBLUIList [
	^ self
		visitUILeaf:
			aBLUIList
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIName: aBLUIName [
	^ self visitAttribute: aBLUIName
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIOrderedList: aBLUIOrderedList [
	^ self visitUIList: aBLUIOrderedList
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIPanel: aBLUIPanel [
	^ self visitUIContainer: aBLUIPanel
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIParagraph: aBLUIParagraph [
	^ self visitUILeaf: aBLUIParagraph
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIPlaceholder: aBLUIPlaceholder [
	^ self visitAttribute: aBLUIPlaceholder
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIRelativeHeight: aBLUIRelativeHeight [
	^ self
		visitUIHeight:
			aBLUIRelativeHeight
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIRelativeWidth: aBLUIRelativeWidth [
	^ self visitUIWidth: aBLUIRelativeWidth
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUISelect: aBLUISelect [
	^ self visitUILeaf: aBLUISelect
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUITab: aBLUITab [
	^ self visitUIContainer: aBLUITab
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUITabManager: aBLUITabManager [
	^ self visitUIContainer: aBLUITabManager 
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUITable: aBLUITable [
	^ self visitUIContainer: aBLUITable
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUITextarea: aBLUITextarea [
	^ self visitUILeaf: aBLUITextarea
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUITitle: aBLUITitle [
	^ self visitAttribute: aBLUITitle
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUITree: aBLUITree [
	^ self visitWidget: aBLUITree
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIUnorderedList: aBLUIUnorderedList [
	^ self visitUIList: aBLUIUnorderedList
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIValue: aBLUIValue [
	^ self visitAttribute: aBLUIValue
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIVerticalLayout: aBLUIVerticalLayout [
	^ self visitLayout: aBLUIVerticalLayout
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitUIWidth: aBLUIWidth [
	^ self visitAttribute: aBLUIWidth
]

{ #category : #visiting }
CSNModelExporter >> visitWidget: aBLPhase [
	^ self visitOriginedEntity: aBLPhase 
]
