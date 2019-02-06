Class {
	#name : #CSNModelExporter,
	#superclass : #Object,
	#instVars : [
		'model',
		'root'
	],
	#category : #'Casino-Model-Exporter'
}

{ #category : #actions }
CSNModelExporter class >> export: aBLMooseModel [
	self new model: aBLMooseModel; export
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
	^ root
]

{ #category : #visiting }
CSNModelExporter >> visit: anElement [
	^ anElement accept: self
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLAttribute: aBLAttribute [
	^ ''
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLCell: aBLCell [
	^ self visitBLWidget: aBLCell
]

{ #category : #visiting }
CSNModelExporter >> visitBLLayout: aBLLayout [
	^ self
]

{ #category : #visiting }
CSNModelExporter >> visitBLOriginedEntity: anElement [
	anElement prepareAcceptFor: self.
	anElement writeCodeWith: self.
	anElement visitSuccessorWith: self 
]

{ #category : #visiting }
CSNModelExporter >> visitBLPage: aBLPage [
	^ self visitBLOriginedEntity: aBLPage
]

{ #category : #visiting }
CSNModelExporter >> visitBLPageMetier: aBLPageMetier [
	^ self visitBLUIContainer: aBLPageMetier 
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIAbsoluteHeight: aBLUIAbsoluteHeight [
	^ self
		visitBLUIHeight:
			aBLUIAbsoluteHeight
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIAbsoluteWidth: aBLUIAbsoluteWidth [
	^ self visitBLUIWidth: aBLUIAbsoluteWidth
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIButton: aBLUIButton [
	^ self
		visitBLUILeaf:
			aBLUIButton
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIClass: aBLUIClass [
	^ self visitBLAttribute: aBLUIClass
]

{ #category : #visiting }
CSNModelExporter >> visitBLUIContainer: aBLUIContainer [
	^ self visitBLWidget: aBLUIContainer
]

{ #category : #visiting }
CSNModelExporter >> visitBLUIDisabled: aBLUIDisabled [
	^ self visitBLAttribute: aBLUIDisabled
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIFieldset: aBLUIFieldset [
	^ self visitBLUIPanel: aBLUIFieldset
]

{ #category : #visiting }
CSNModelExporter >> visitBLUIGridLayout: aBLUIGridLayout [
	^ self visitBLLayout: aBLUIGridLayout
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIHeading1: aBLUIHeading1 [
	^ self visitBLUIContainer: aBLUIHeading1
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIHeading2: aBLUIHeading2 [
	^ self visitBLUIContainer: aBLUIHeading2
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIHeading3: aBLUIHeading3 [
	^ self visitBLUIContainer: aBLUIHeading3
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIHeading4: aBLUIHeading4 [
	^ self visitBLUIContainer: aBLUIHeading4
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIHeading5: aBLUIHeading5 [
	^ self visitBLUIContainer: aBLUIHeading5
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIHeading6: aBLUIHeading6 [
	^ self visitBLUIContainer: aBLUIHeading6
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIHeight: aBLUIHeight [
	^ self visitBLAttribute: aBLUIHeight
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIHorizontalLayout: aBLUIHorizontalLayout [
	^ self visitBLLayout: aBLUIHorizontalLayout
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIImage: aBLUIImage [
	^ self visitBLUILeaf: aBLUIImage
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInput: aBLUIInput [
	^ self visitBLUILeaf: aBLUIInput
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInputCheckbox: aBLUIInputCheckbox [
	^ self visitBLUIInput: aBLUIInputCheckbox
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInputColor: aBLUIInputColor [
	^ self visitBLUIInput: aBLUIInputColor
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInputDate: aBLUIInputDate [
	^ self visitBLUIInput: aBLUIInputDate
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInputDatetimeLocal: aBLUIInputDatetimeLocal [
	^ self visitBLUIInput: aBLUIInputDatetimeLocal
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInputEmail: aBLUIInputEmail [
	^ self
		visitBLUIInputText:
			aBLUIInputEmail
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInputFile: aBLUIInputFile [
	^ self visitBLUIInput: aBLUIInputFile
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInputMonth: aBLUIInputMonth [
	^ self visitBLUIInput: aBLUIInputMonth
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInputNumber: aBLUIInputNumber [
	^ self visitBLUIInput: aBLUIInputNumber
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInputPassword: aBLUIInputPassword [
	^ self
		visitBLUIInputText:
			aBLUIInputPassword
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInputRadio: aBLUIInputRadio [
	^ self visitBLUIInput: aBLUIInputRadio
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInputRange: aBLUIInputRange [
	^ self visitBLUIInput: aBLUIInputRange
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInputReset: aBLUIInputReset [
	^ self visitBLUIInput: aBLUIInputReset
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInputSearch: aBLUIInputSearch [
	^ self visitBLUIInput: aBLUIInputSearch
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInputSubmit: aBLUIInputSubmit [
	^ self visitBLUIInput: aBLUIInputSubmit
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInputTel: aBLUIInputTel [
	^ self visitBLUIInput: aBLUIInputTel
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInputText: aBLUIInputText [
	^ self visitBLUIInput: aBLUIInputText
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInputTime: aBLUIInputTime [
	^ self visitBLUIInput: aBLUIInputTime
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInputUrl: aBLUIInputUrl [
	^ self visitBLUIInput: aBLUIInputUrl
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIInputWeek: aBLUIInputWeek [
	^ self visitBLUIInput: aBLUIInputWeek
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUILabel: aBLUILabel [
	^ self visitBLAttribute: aBLUILabel
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUILeaf: aBLUILeaf [
	^ self visitBLWidget: aBLUILeaf
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUILink: aBLUILink [
	^ self visitBLUILeaf: aBLUILink
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIList: aBLUIList [
	^ self
		visitBLUILeaf:
			aBLUIList
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIName: aBLUIName [
	^ self visitBLAttribute: aBLUIName
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIOrderedList: aBLUIOrderedList [
	^ self visitBLUIList: aBLUIOrderedList
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIPanel: aBLUIPanel [
	^ self visitBLUIContainer: aBLUIPanel
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIParagraph: aBLUIParagraph [
	^ self visitBLUILeaf: aBLUIParagraph
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIPlaceholder: aBLUIPlaceholder [
	^ self visitBLAttribute: aBLUIPlaceholder
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIRelativeHeight: aBLUIRelativeHeight [
	^ self
		visitBLUIHeight:
			aBLUIRelativeHeight
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIRelativeWidth: aBLUIRelativeWidth [
	^ self visitBLUIWidth: aBLUIRelativeWidth
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUISelect: aBLUISelect [
	^ self visitBLUILeaf: aBLUISelect
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUITab: aBLUITab [
	^ self visitBLUIContainer: aBLUITab
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUITabManager: aBLUITabManager [
	^ self visitBLUIContainer: aBLUITabManager 
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUITable: aBLUITable [
	^ self visitBLUIContainer: aBLUITable
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUITextarea: aBLUITextarea [
	^ self visitBLUILeaf: aBLUITextarea
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUITitle: aBLUITitle [
	^ self visitBLAttribute: aBLUITitle
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUITree: aBLUITree [
	^ self visitBLWidget: aBLUITree
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIUnorderedList: aBLUIUnorderedList [
	^ self visitBLUIList: aBLUIUnorderedList
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIValue: aBLUIValue [
	^ self visitBLAttribute: aBLUIValue
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIVerticalLayout: aBLUIVerticalLayout [
	^ self visitBLLayout: aBLUIVerticalLayout
]

{ #category : #'as yet unclassified' }
CSNModelExporter >> visitBLUIWidth: aBLUIWidth [
	^ self visitBLAttribute: aBLUIWidth
]

{ #category : #visiting }
CSNModelExporter >> visitBLWidget: aBLPhase [
	^ self visitBLOriginedEntity: aBLPhase 
]

{ #category : #visiting }
CSNModelExporter >> visitMooseModel: aMooseModel [
	self subclassResponsibility 
]
