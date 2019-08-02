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

{ #category : #generated }
CSNModelExporter >> visitCSNAction: aCSNAction [
	^ self visitCSNOriginedEntity: aCSNAction
]

{ #category : #generated }
CSNModelExporter >> visitCSNActionAppel: aCSNActionAppel [
	^ self visitCSNAction: aCSNActionAppel
]

{ #category : #generated }
CSNModelExporter >> visitCSNActionService: aCSNActionService [
	^ self visitCSNAction: aCSNActionService
]

{ #category : #generated }
CSNModelExporter >> visitCSNAttribute: aCSNAttribute [
	^ self visitCSNOriginedEntity: aCSNAttribute
]

{ #category : #generated }
CSNModelExporter >> visitCSNAutoComplete: aCSNAutoComplete [
	^ self visitCSNInput: aCSNAutoComplete
]

{ #category : #generated }
CSNModelExporter >> visitCSNBusinessPage: aCSNBusinessPage [
	^ self visitCSNContainer: aCSNBusinessPage
]

{ #category : #generated }
CSNModelExporter >> visitCSNChart: aCSNChart [
	^ self visitCSNContainer: aCSNChart
]

{ #category : #generated }
CSNModelExporter >> visitCSNClickHandler: aCSNClickHandler [
	^ self visitCSNAction: aCSNClickHandler
]

{ #category : #generated }
CSNModelExporter >> visitCSNContainer: aCSNContainer [
	^ self visitCSNWidget: aCSNContainer
]

{ #category : #generated }
CSNModelExporter >> visitCSNCoreCellWidth: aCSNCoreCellWidth [
	^ self visitCSNAttribute: aCSNCoreCellWidth
]

{ #category : #generated }
CSNModelExporter >> visitCSNCoreColSpan: aCSNCoreColSpan [
	^ self visitCSNAttribute: aCSNCoreColSpan
]

{ #category : #generated }
CSNModelExporter >> visitCSNCoreHorizontalAlignement: aCSNCoreHorizontalAlignement [
	^ self visitCSNAttribute: aCSNCoreHorizontalAlignement
]

{ #category : #generated }
CSNModelExporter >> visitCSNCoreRowSpan: aCSNCoreRowSpan [
	^ self visitCSNAttribute: aCSNCoreRowSpan
]

{ #category : #generated }
CSNModelExporter >> visitCSNCoreVerticalAlignement: aCSNCoreVerticalAlignement [
	^ self visitCSNAttribute: aCSNCoreVerticalAlignement
]

{ #category : #generated }
CSNModelExporter >> visitCSNDialog: aCSNDialog [
	^ self visitCSNContainer: aCSNDialog
]

{ #category : #generated }
CSNModelExporter >> visitCSNDynamicFieldset: aCSNDynamicFieldset [
	^ self visitCSNAttribute: aCSNDynamicFieldset
]

{ #category : #generated }
CSNModelExporter >> visitCSNGroupFieldset: aCSNGroupFieldset [
	^ self visitCSNAttribute: aCSNGroupFieldset
]

{ #category : #generated }
CSNModelExporter >> visitCSNHTML: aCSNHTML [
	^ self visitCSNContainer: aCSNHTML
]

{ #category : #generated }
CSNModelExporter >> visitCSNInput: aCSNInput [
	^ self visitCSNContainer: aCSNInput
]

{ #category : #generated }
CSNModelExporter >> visitCSNLBorderLayout: aCSNLBorderLayout [
	^ self visitCSNLLayout: aCSNLBorderLayout
]

{ #category : #generated }
CSNModelExporter >> visitCSNLCell: aCSNLCell [
	^ self visitCSNWidget: aCSNLCell
]

{ #category : #generated }
CSNModelExporter >> visitCSNLGridLayout: aCSNLGridLayout [
	^ self visitCSNLLayout: aCSNLGridLayout
]

{ #category : #generated }
CSNModelExporter >> visitCSNLHorizontalLayout: aCSNLHorizontalLayout [
	^ self visitCSNLLayout: aCSNLHorizontalLayout
]

{ #category : #generated }
CSNModelExporter >> visitCSNLLayout: aCSNLLayout [
	^ self
]

{ #category : #generated }
CSNModelExporter >> visitCSNLVerticalLayout: aCSNLVerticalLayout [
	^ self visitCSNLLayout: aCSNLVerticalLayout
]

{ #category : #generated }
CSNModelExporter >> visitCSNLeaf: aCSNLeaf [
	^ self visitCSNWidget: aCSNLeaf
]

{ #category : #generated }
CSNModelExporter >> visitCSNLightFieldset: aCSNLightFieldset [
	^ self visitCSNAttribute: aCSNLightFieldset
]

{ #category : #generated }
CSNModelExporter >> visitCSNModal: aCSNModal [
	^ self visitCSNVariableAttribute: aCSNModal
]

{ #category : #generated }
CSNModelExporter >> visitCSNModel: aCSNModel [
	^ self visitCSNVariableAttribute: aCSNModel
]

{ #category : #generated }
CSNModelExporter >> visitCSNOpen: aCSNOpen [
	^ self visitCSNVariableAttribute: aCSNOpen
]

{ #category : #generated }
CSNModelExporter >> visitCSNOriginedEntity: aCSNOriginedEntity [
	aCSNOriginedEntity prepareAcceptFor: self.
	aCSNOriginedEntity writeCodeWith: self.
	aCSNOriginedEntity visitSuccessorWith: self 
]

{ #category : #generated }
CSNModelExporter >> visitCSNPage: aCSNPage [
	^ self visitCSNContainer: aCSNPage
]

{ #category : #generated }
CSNModelExporter >> visitCSNProgressBar: aCSNProgressBar [
	^ self visitCSNContainer: aCSNProgressBar
]

{ #category : #generated }
CSNModelExporter >> visitCSNRichTextArea: aCSNRichTextArea [
	^ self visitCSNInput: aCSNRichTextArea
]

{ #category : #generated }
CSNModelExporter >> visitCSNService: aCSNService [
	^ self visitCSNOriginedEntity: aCSNService
]

{ #category : #generated }
CSNModelExporter >> visitCSNServiceAPI: aCSNServiceAPI [
	^ self visitCSNOriginedEntity: aCSNServiceAPI
]

{ #category : #generated }
CSNModelExporter >> visitCSNSplitButton: aCSNSplitButton [
	^ self visitCSNInput: aCSNSplitButton
]

{ #category : #generated }
CSNModelExporter >> visitCSNSwitch: aCSNSwitch [
	^ self visitCSNInput: aCSNSwitch
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIAbsoluteHeight: aCSNUIAbsoluteHeight [
	^ self visitCSNUIHeight: aCSNUIAbsoluteHeight
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIAbsoluteWidth: aCSNUIAbsoluteWidth [
	^ self visitCSNUIWidth: aCSNUIAbsoluteWidth
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIAlt: aCSNUIAlt [
	^ self visitCSNAttribute: aCSNUIAlt
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIButton: aCSNUIButton [
	^ self visitCSNContainer: aCSNUIButton
]

{ #category : #generated }
CSNModelExporter >> visitCSNUICanvas: aCSNUICanvas [
	^ self visitCSNContainer: aCSNUICanvas
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIClass: aCSNUIClass [
	^ self visitCSNAttribute: aCSNUIClass
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIDisabled: aCSNUIDisabled [
	^ self visitCSNAttribute: aCSNUIDisabled
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIFieldset: aCSNUIFieldset [
	^ self visitCSNUIPanel: aCSNUIFieldset
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIHeading1: aCSNUIHeading1 [
	^ self visitCSNLeaf: aCSNUIHeading1
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIHeading2: aCSNUIHeading2 [
	^ self visitCSNLeaf: aCSNUIHeading2
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIHeading3: aCSNUIHeading3 [
	^ self visitCSNLeaf: aCSNUIHeading3
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIHeading4: aCSNUIHeading4 [
	^ self visitCSNLeaf: aCSNUIHeading4
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIHeading5: aCSNUIHeading5 [
	^ self visitCSNLeaf: aCSNUIHeading5
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIHeading6: aCSNUIHeading6 [
	^ self visitCSNLeaf: aCSNUIHeading6
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIHeight: aCSNUIHeight [
	^ self visitCSNAttribute: aCSNUIHeight
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIId: aCSNUIId [
	^ self visitCSNAttribute: aCSNUIId
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIImage: aCSNUIImage [
	^ self visitCSNLeaf: aCSNUIImage
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInput: aCSNUIInput [
	^ self visitCSNLeaf: aCSNUIInput
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInputCheckbox: aCSNUIInputCheckbox [
	^ self visitCSNUIInput: aCSNUIInputCheckbox
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInputColor: aCSNUIInputColor [
	^ self visitCSNUIInput: aCSNUIInputColor
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInputDate: aCSNUIInputDate [
	^ self visitCSNUIInput: aCSNUIInputDate
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInputDatetimeLocal: aCSNUIInputDatetimeLocal [
	^ self visitCSNUIInput: aCSNUIInputDatetimeLocal
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInputEmail: aCSNUIInputEmail [
	^ self visitCSNUIInputText: aCSNUIInputEmail
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInputFile: aCSNUIInputFile [
	^ self visitCSNUIInput: aCSNUIInputFile
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInputMonth: aCSNUIInputMonth [
	^ self visitCSNUIInput: aCSNUIInputMonth
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInputNumber: aCSNUIInputNumber [
	^ self visitCSNUIInput: aCSNUIInputNumber
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInputPassword: aCSNUIInputPassword [
	^ self visitCSNUIInputText: aCSNUIInputPassword
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInputRadio: aCSNUIInputRadio [
	^ self visitCSNUIInput: aCSNUIInputRadio
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInputRange: aCSNUIInputRange [
	^ self visitCSNUIInput: aCSNUIInputRange
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInputReset: aCSNUIInputReset [
	^ self visitCSNUIInput: aCSNUIInputReset
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInputSearch: aCSNUIInputSearch [
	^ self visitCSNUIInput: aCSNUIInputSearch
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInputSubmit: aCSNUIInputSubmit [
	^ self visitCSNUIInput: aCSNUIInputSubmit
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInputTel: aCSNUIInputTel [
	^ self visitCSNUIInput: aCSNUIInputTel
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInputText: aCSNUIInputText [
	^ self visitCSNUIInput: aCSNUIInputText
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInputTime: aCSNUIInputTime [
	^ self visitCSNUIInput: aCSNUIInputTime
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInputUrl: aCSNUIInputUrl [
	^ self visitCSNUIInput: aCSNUIInputUrl
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIInputWeek: aCSNUIInputWeek [
	^ self visitCSNUIInput: aCSNUIInputWeek
]

{ #category : #generated }
CSNModelExporter >> visitCSNUILabel: aCSNUILabel [
	^ self visitCSNAttribute: aCSNUILabel
]

{ #category : #generated }
CSNModelExporter >> visitCSNUILink: aCSNUILink [
	^ self visitCSNLeaf: aCSNUILink
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIList: aCSNUIList [
	^ self visitCSNLeaf: aCSNUIList
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIMax: aCSNUIMax [
	^ self visitCSNAttribute: aCSNUIMax
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIMaxlength: aCSNUIMaxlength [
	^ self visitCSNAttribute: aCSNUIMaxlength
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIMin: aCSNUIMin [
	^ self visitCSNAttribute: aCSNUIMin
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIName: aCSNUIName [
	^ self visitCSNAttribute: aCSNUIName
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIOrderedList: aCSNUIOrderedList [
	^ self visitCSNUIList: aCSNUIOrderedList
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIPanel: aCSNUIPanel [
	^ self visitCSNContainer: aCSNUIPanel
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIParagraph: aCSNUIParagraph [
	^ self visitCSNLeaf: aCSNUIParagraph
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIPlaceholder: aCSNUIPlaceholder [
	^ self visitCSNAttribute: aCSNUIPlaceholder
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIReadonly: aCSNUIReadonly [
	^ self visitCSNAttribute: aCSNUIReadonly
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIRelativeHeight: aCSNUIRelativeHeight [
	^ self visitCSNUIHeight: aCSNUIRelativeHeight
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIRelativeWidth: aCSNUIRelativeWidth [
	^ self visitCSNUIWidth: aCSNUIRelativeWidth
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIRequired: aCSNUIRequired [
	^ self visitCSNAttribute: aCSNUIRequired
]

{ #category : #generated }
CSNModelExporter >> visitCSNUISelect: aCSNUISelect [
	^ self visitCSNUIInput: aCSNUISelect
]

{ #category : #generated }
CSNModelExporter >> visitCSNUISize: aCSNUISize [
	^ self visitCSNAttribute: aCSNUISize
]

{ #category : #generated }
CSNModelExporter >> visitCSNUISrc: aCSNUISrc [
	^ self visitCSNAttribute: aCSNUISrc
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIStyle: aCSNUIStyle [
	^ self visitCSNAttribute: aCSNUIStyle
]

{ #category : #generated }
CSNModelExporter >> visitCSNUITab: aCSNUITab [
	^ self visitCSNContainer: aCSNUITab
]

{ #category : #generated }
CSNModelExporter >> visitCSNUITabManager: aCSNUITabManager [
	^ self visitCSNContainer: aCSNUITabManager
]

{ #category : #generated }
CSNModelExporter >> visitCSNUITable: aCSNUITable [
	^ self visitCSNContainer: aCSNUITable
]

{ #category : #generated }
CSNModelExporter >> visitCSNUITextarea: aCSNUITextarea [
	^ self visitCSNLeaf: aCSNUITextarea
]

{ #category : #generated }
CSNModelExporter >> visitCSNUITitle: aCSNUITitle [
	^ self visitCSNAttribute: aCSNUITitle
]

{ #category : #generated }
CSNModelExporter >> visitCSNUITree: aCSNUITree [
	^ self visitCSNContainer: aCSNUITree
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIUnorderedList: aCSNUIUnorderedList [
	^ self visitCSNUIList: aCSNUIUnorderedList
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIValue: aCSNUIValue [
	^ self visitCSNAttribute: aCSNUIValue
]

{ #category : #generated }
CSNModelExporter >> visitCSNUIWidth: aCSNUIWidth [
	^ self visitCSNAttribute: aCSNUIWidth
]

{ #category : #generated }
CSNModelExporter >> visitCSNVariableAttribute: aCSNVariableAttribute [
	^ self visitCSNAttribute: aCSNVariableAttribute
]

{ #category : #generated }
CSNModelExporter >> visitCSNWidget: aCSNWidget [
	^ self visitCSNOriginedEntity: aCSNWidget
]

{ #category : #visiting }
CSNModelExporter >> visitMooseModel: aMooseModel [
	self subclassResponsibility 
]
