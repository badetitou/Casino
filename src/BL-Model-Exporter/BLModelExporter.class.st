Class {
	#name : #BLModelExporter,
	#superclass : #Object,
	#instVars : [
		'model',
		'root'
	],
	#category : 'BL-Model-Exporter'
}

{ #category : #actions }
BLModelExporter class >> export: aBLMooseModel [
	self new model: aBLMooseModel; export
]

{ #category : #run }
BLModelExporter >> export [
	self prepareExport.
	self visit: model.
	self postExport 
]

{ #category : #accessing }
BLModelExporter >> model [
	^ model
]

{ #category : #accessing }
BLModelExporter >> model: anObject [
	model := anObject
]

{ #category : #run }
BLModelExporter >> postExport [
	"can do something here"
]

{ #category : #api }
BLModelExporter >> prepareExport [
	"can be override"
]

{ #category : #accessing }
BLModelExporter >> root [
	^ root
]

{ #category : #visiting }
BLModelExporter >> visit: anElement [
	^ anElement accept: self
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLAttribute: aBLAttribute [
	^ ''
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLCell: aBLCell [
	^ self visitBLWidget: aBLCell
]

{ #category : #visiting }
BLModelExporter >> visitBLLayout: aBLLayout [
	^ self
]

{ #category : #visiting }
BLModelExporter >> visitBLOriginedEntity: anElement [
	anElement prepareAcceptFor: self.
	anElement writeCodeWith: self.
	anElement visitSuccessorWith: self 
]

{ #category : #visiting }
BLModelExporter >> visitBLPage: aBLPage [
	^ self visitBLOriginedEntity: aBLPage
]

{ #category : #visiting }
BLModelExporter >> visitBLPageMetier: aBLPageMetier [
	^ self visitBLUIContainer: aBLPageMetier 
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIAbsoluteHeight: aBLUIAbsoluteHeight [
	^ self
		visitBLUIHeight:
			aBLUIAbsoluteHeight
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIAbsoluteWidth: aBLUIAbsoluteWidth [
	^ self visitBLUIWidth: aBLUIAbsoluteWidth
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIButton: aBLUIButton [
	^ self
		visitBLUILeaf:
			aBLUIButton
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIClass: aBLUIClass [
	^ self visitBLAttribute: aBLUIClass
]

{ #category : #visiting }
BLModelExporter >> visitBLUIContainer: aBLUIContainer [
	^ self visitBLWidget: aBLUIContainer
]

{ #category : #visiting }
BLModelExporter >> visitBLUIDisabled: aBLUIDisabled [
	^ self visitBLAttribute: aBLUIDisabled
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIFieldset: aBLUIFieldset [
	^ self visitBLUIPanel: aBLUIFieldset
]

{ #category : #visiting }
BLModelExporter >> visitBLUIGridLayout: aBLUIGridLayout [
	^ self visitBLLayout: aBLUIGridLayout
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIHeading1: aBLUIHeading1 [
	^ self visitBLUIContainer: aBLUIHeading1
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIHeading2: aBLUIHeading2 [
	^ self visitBLUIContainer: aBLUIHeading2
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIHeading3: aBLUIHeading3 [
	^ self visitBLUIContainer: aBLUIHeading3
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIHeading4: aBLUIHeading4 [
	^ self visitBLUIContainer: aBLUIHeading4
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIHeading5: aBLUIHeading5 [
	^ self visitBLUIContainer: aBLUIHeading5
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIHeading6: aBLUIHeading6 [
	^ self visitBLUIContainer: aBLUIHeading6
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIHeight: aBLUIHeight [
	^ self visitBLAttribute: aBLUIHeight
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIHorizontalLayout: aBLUIHorizontalLayout [
	^ self visitBLLayout: aBLUIHorizontalLayout
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIImage: aBLUIImage [
	^ self visitBLUILeaf: aBLUIImage
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInput: aBLUIInput [
	^ self visitBLUILeaf: aBLUIInput
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputCheckbox: aBLUIInputCheckbox [
	^ self visitBLUIInput: aBLUIInputCheckbox
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputColor: aBLUIInputColor [
	^ self visitBLUIInput: aBLUIInputColor
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputDate: aBLUIInputDate [
	^ self visitBLUIInput: aBLUIInputDate
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputDatetimeLocal: aBLUIInputDatetimeLocal [
	^ self visitBLUIInput: aBLUIInputDatetimeLocal
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputEmail: aBLUIInputEmail [
	^ self
		visitBLUIInputText:
			aBLUIInputEmail
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputFile: aBLUIInputFile [
	^ self visitBLUIInput: aBLUIInputFile
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputMonth: aBLUIInputMonth [
	^ self visitBLUIInput: aBLUIInputMonth
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputNumber: aBLUIInputNumber [
	^ self visitBLUIInput: aBLUIInputNumber
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputPassword: aBLUIInputPassword [
	^ self
		visitBLUIInputText:
			aBLUIInputPassword
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputRadio: aBLUIInputRadio [
	^ self visitBLUIInput: aBLUIInputRadio
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputRange: aBLUIInputRange [
	^ self visitBLUIInput: aBLUIInputRange
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputReset: aBLUIInputReset [
	^ self visitBLUIInput: aBLUIInputReset
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputSearch: aBLUIInputSearch [
	^ self visitBLUIInput: aBLUIInputSearch
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputSubmit: aBLUIInputSubmit [
	^ self visitBLUIInput: aBLUIInputSubmit
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputTel: aBLUIInputTel [
	^ self visitBLUIInput: aBLUIInputTel
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputText: aBLUIInputText [
	^ self visitBLUIInput: aBLUIInputText
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputTime: aBLUIInputTime [
	^ self visitBLUIInput: aBLUIInputTime
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputUrl: aBLUIInputUrl [
	^ self visitBLUIInput: aBLUIInputUrl
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputWeek: aBLUIInputWeek [
	^ self visitBLUIInput: aBLUIInputWeek
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUILabel: aBLUILabel [
	^ self visitBLAttribute: aBLUILabel
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUILeaf: aBLUILeaf [
	^ self visitBLWidget: aBLUILeaf
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUILink: aBLUILink [
	^ self visitBLUILeaf: aBLUILink
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIList: aBLUIList [
	^ self
		visitBLUILeaf:
			aBLUIList
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIName: aBLUIName [
	^ self visitBLAttribute: aBLUIName
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIOrderedList: aBLUIOrderedList [
	^ self visitBLUIList: aBLUIOrderedList
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIPanel: aBLUIPanel [
	^ self visitBLUIContainer: aBLUIPanel
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIParagraph: aBLUIParagraph [
	^ self visitBLUILeaf: aBLUIParagraph
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIPlaceholder: aBLUIPlaceholder [
	^ self visitBLAttribute: aBLUIPlaceholder
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIRelativeHeight: aBLUIRelativeHeight [
	^ self
		visitBLUIHeight:
			aBLUIRelativeHeight
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIRelativeWidth: aBLUIRelativeWidth [
	^ self visitBLUIWidth: aBLUIRelativeWidth
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUISelect: aBLUISelect [
	^ self visitBLUILeaf: aBLUISelect
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUITab: aBLUITab [
	^ self visitBLUIContainer: aBLUITab
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUITabManager: aBLUITabManager [
	^ self visitBLUIContainer: aBLUITabManager 
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUITable: aBLUITable [
	^ self visitBLUIContainer: aBLUITable
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUITextarea: aBLUITextarea [
	^ self visitBLUILeaf: aBLUITextarea
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUITitle: aBLUITitle [
	^ self visitBLAttribute: aBLUITitle
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUITree: aBLUITree [
	^ self visitBLWidget: aBLUITree
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIUnorderedList: aBLUIUnorderedList [
	^ self visitBLUIList: aBLUIUnorderedList
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIValue: aBLUIValue [
	^ self visitBLAttribute: aBLUIValue
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIVerticalLayout: aBLUIVerticalLayout [
	^ self visitBLLayout: aBLUIVerticalLayout
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIWidth: aBLUIWidth [
	^ self visitBLAttribute: aBLUIWidth
]

{ #category : #visiting }
BLModelExporter >> visitBLWidget: aBLPhase [
	^ self visitBLOriginedEntity: aBLPhase 
]

{ #category : #visiting }
BLModelExporter >> visitMooseModel: aMooseModel [
	self subclassResponsibility 
]
