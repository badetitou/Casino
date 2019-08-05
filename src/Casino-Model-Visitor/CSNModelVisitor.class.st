Class {
	#name : #CSNModelVisitor,
	#superclass : #Object,
	#category : #'Casino-Model-Visitor'
}

{ #category : #visiting }
CSNModelVisitor >> visit: anElement [
	^ anElement accept: self
]

{ #category : #generated }
CSNModelVisitor >> visitCSNAction: aCSNAction [
	^ self visitCSNOriginedEntity: aCSNAction
]

{ #category : #generated }
CSNModelVisitor >> visitCSNActionAppel: aCSNActionAppel [
	^ self visitCSNAction: aCSNActionAppel
]

{ #category : #generated }
CSNModelVisitor >> visitCSNActionService: aCSNActionService [
	^ self visitCSNAction: aCSNActionService
]

{ #category : #generated }
CSNModelVisitor >> visitCSNAttribute: aCSNAttribute [
	^ self visitCSNOriginedEntity: aCSNAttribute
]

{ #category : #generated }
CSNModelVisitor >> visitCSNAutoComplete: aCSNAutoComplete [
	^ self visitCSNInput: aCSNAutoComplete
]

{ #category : #generated }
CSNModelVisitor >> visitCSNBusinessPage: aCSNBusinessPage [
	^ self visitCSNContainer: aCSNBusinessPage
]

{ #category : #generated }
CSNModelVisitor >> visitCSNChart: aCSNChart [
	^ self visitCSNContainer: aCSNChart
]

{ #category : #generated }
CSNModelVisitor >> visitCSNClickHandler: aCSNClickHandler [
	^ self visitCSNAction: aCSNClickHandler
]

{ #category : #generated }
CSNModelVisitor >> visitCSNContainer: aCSNContainer [
	^ self visitCSNWidget: aCSNContainer
]

{ #category : #generated }
CSNModelVisitor >> visitCSNCoreCellWidth: aCSNCoreCellWidth [
	^ self visitCSNAttribute: aCSNCoreCellWidth
]

{ #category : #generated }
CSNModelVisitor >> visitCSNCoreColSpan: aCSNCoreColSpan [
	^ self visitCSNAttribute: aCSNCoreColSpan
]

{ #category : #generated }
CSNModelVisitor >> visitCSNCoreHorizontalAlignement: aCSNCoreHorizontalAlignement [
	^ self visitCSNAttribute: aCSNCoreHorizontalAlignement
]

{ #category : #generated }
CSNModelVisitor >> visitCSNCoreRowSpan: aCSNCoreRowSpan [
	^ self visitCSNAttribute: aCSNCoreRowSpan
]

{ #category : #generated }
CSNModelVisitor >> visitCSNCoreVerticalAlignement: aCSNCoreVerticalAlignement [
	^ self visitCSNAttribute: aCSNCoreVerticalAlignement
]

{ #category : #generated }
CSNModelVisitor >> visitCSNDialog: aCSNDialog [
	^ self visitCSNContainer: aCSNDialog
]

{ #category : #generated }
CSNModelVisitor >> visitCSNDynamicFieldset: aCSNDynamicFieldset [
	^ self visitCSNAttribute: aCSNDynamicFieldset
]

{ #category : #generated }
CSNModelVisitor >> visitCSNGroupFieldset: aCSNGroupFieldset [
	^ self visitCSNAttribute: aCSNGroupFieldset
]

{ #category : #generated }
CSNModelVisitor >> visitCSNHTML: aCSNHTML [
	^ self visitCSNContainer: aCSNHTML
]

{ #category : #generated }
CSNModelVisitor >> visitCSNInput: aCSNInput [
	^ self visitCSNContainer: aCSNInput
]

{ #category : #generated }
CSNModelVisitor >> visitCSNLBorderLayout: aCSNLBorderLayout [
	^ self visitCSNLLayout: aCSNLBorderLayout
]

{ #category : #generated }
CSNModelVisitor >> visitCSNLCell: aCSNLCell [
	^ self visitCSNWidget: aCSNLCell
]

{ #category : #generated }
CSNModelVisitor >> visitCSNLGridLayout: aCSNLGridLayout [
	^ self visitCSNLLayout: aCSNLGridLayout
]

{ #category : #generated }
CSNModelVisitor >> visitCSNLHorizontalLayout: aCSNLHorizontalLayout [
	^ self visitCSNLLayout: aCSNLHorizontalLayout
]

{ #category : #generated }
CSNModelVisitor >> visitCSNLLayout: aCSNLLayout [
	^ self
]

{ #category : #generated }
CSNModelVisitor >> visitCSNLVerticalLayout: aCSNLVerticalLayout [
	^ self visitCSNLLayout: aCSNLVerticalLayout
]

{ #category : #generated }
CSNModelVisitor >> visitCSNLeaf: aCSNLeaf [
	^ self visitCSNWidget: aCSNLeaf
]

{ #category : #generated }
CSNModelVisitor >> visitCSNLightFieldset: aCSNLightFieldset [
	^ self visitCSNAttribute: aCSNLightFieldset
]

{ #category : #generated }
CSNModelVisitor >> visitCSNModal: aCSNModal [
	^ self visitCSNVariableAttribute: aCSNModal
]

{ #category : #generated }
CSNModelVisitor >> visitCSNModel: aCSNModel [
	^ self visitCSNVariableAttribute: aCSNModel
]

{ #category : #generated }
CSNModelVisitor >> visitCSNOpen: aCSNOpen [
	^ self visitCSNVariableAttribute: aCSNOpen
]

{ #category : #generated }
CSNModelVisitor >> visitCSNOriginedEntity: aCSNOriginedEntity [
	aCSNOriginedEntity prepareAcceptFor: self.
	aCSNOriginedEntity writeCodeWith: self.
	aCSNOriginedEntity visitSuccessorWith: self 
]

{ #category : #generated }
CSNModelVisitor >> visitCSNPage: aCSNPage [
	^ self visitCSNContainer: aCSNPage
]

{ #category : #generated }
CSNModelVisitor >> visitCSNProgressBar: aCSNProgressBar [
	^ self visitCSNContainer: aCSNProgressBar
]

{ #category : #generated }
CSNModelVisitor >> visitCSNRichTextArea: aCSNRichTextArea [
	^ self visitCSNInput: aCSNRichTextArea
]

{ #category : #generated }
CSNModelVisitor >> visitCSNService: aCSNService [
	^ self visitCSNOriginedEntity: aCSNService
]

{ #category : #generated }
CSNModelVisitor >> visitCSNServiceAPI: aCSNServiceAPI [
	^ self visitCSNOriginedEntity: aCSNServiceAPI
]

{ #category : #generated }
CSNModelVisitor >> visitCSNSplitButton: aCSNSplitButton [
	^ self visitCSNInput: aCSNSplitButton
]

{ #category : #generated }
CSNModelVisitor >> visitCSNSwitch: aCSNSwitch [
	^ self visitCSNInput: aCSNSwitch
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIAbsoluteHeight: aCSNUIAbsoluteHeight [
	^ self visitCSNUIHeight: aCSNUIAbsoluteHeight
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIAbsoluteWidth: aCSNUIAbsoluteWidth [
	^ self visitCSNUIWidth: aCSNUIAbsoluteWidth
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIAlt: aCSNUIAlt [
	^ self visitCSNAttribute: aCSNUIAlt
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIButton: aCSNUIButton [
	^ self visitCSNContainer: aCSNUIButton
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUICanvas: aCSNUICanvas [
	^ self visitCSNContainer: aCSNUICanvas
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIClass: aCSNUIClass [
	^ self visitCSNAttribute: aCSNUIClass
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIDisabled: aCSNUIDisabled [
	^ self visitCSNAttribute: aCSNUIDisabled
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIFieldset: aCSNUIFieldset [
	^ self visitCSNUIPanel: aCSNUIFieldset
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIHeading1: aCSNUIHeading1 [
	^ self visitCSNLeaf: aCSNUIHeading1
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIHeading2: aCSNUIHeading2 [
	^ self visitCSNLeaf: aCSNUIHeading2
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIHeading3: aCSNUIHeading3 [
	^ self visitCSNLeaf: aCSNUIHeading3
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIHeading4: aCSNUIHeading4 [
	^ self visitCSNLeaf: aCSNUIHeading4
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIHeading5: aCSNUIHeading5 [
	^ self visitCSNLeaf: aCSNUIHeading5
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIHeading6: aCSNUIHeading6 [
	^ self visitCSNLeaf: aCSNUIHeading6
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIHeight: aCSNUIHeight [
	^ self visitCSNAttribute: aCSNUIHeight
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIId: aCSNUIId [
	^ self visitCSNAttribute: aCSNUIId
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIImage: aCSNUIImage [
	^ self visitCSNLeaf: aCSNUIImage
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInput: aCSNUIInput [
	^ self visitCSNLeaf: aCSNUIInput
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInputCheckbox: aCSNUIInputCheckbox [
	^ self visitCSNUIInput: aCSNUIInputCheckbox
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInputColor: aCSNUIInputColor [
	^ self visitCSNUIInput: aCSNUIInputColor
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInputDate: aCSNUIInputDate [
	^ self visitCSNUIInput: aCSNUIInputDate
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInputDatetimeLocal: aCSNUIInputDatetimeLocal [
	^ self visitCSNUIInput: aCSNUIInputDatetimeLocal
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInputEmail: aCSNUIInputEmail [
	^ self visitCSNUIInputText: aCSNUIInputEmail
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInputFile: aCSNUIInputFile [
	^ self visitCSNUIInput: aCSNUIInputFile
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInputMonth: aCSNUIInputMonth [
	^ self visitCSNUIInput: aCSNUIInputMonth
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInputNumber: aCSNUIInputNumber [
	^ self visitCSNUIInput: aCSNUIInputNumber
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInputPassword: aCSNUIInputPassword [
	^ self visitCSNUIInputText: aCSNUIInputPassword
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInputRadio: aCSNUIInputRadio [
	^ self visitCSNUIInput: aCSNUIInputRadio
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInputRange: aCSNUIInputRange [
	^ self visitCSNUIInput: aCSNUIInputRange
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInputReset: aCSNUIInputReset [
	^ self visitCSNUIInput: aCSNUIInputReset
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInputSearch: aCSNUIInputSearch [
	^ self visitCSNUIInput: aCSNUIInputSearch
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInputSubmit: aCSNUIInputSubmit [
	^ self visitCSNUIInput: aCSNUIInputSubmit
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInputTel: aCSNUIInputTel [
	^ self visitCSNUIInput: aCSNUIInputTel
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInputText: aCSNUIInputText [
	^ self visitCSNUIInput: aCSNUIInputText
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInputTime: aCSNUIInputTime [
	^ self visitCSNUIInput: aCSNUIInputTime
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInputUrl: aCSNUIInputUrl [
	^ self visitCSNUIInput: aCSNUIInputUrl
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIInputWeek: aCSNUIInputWeek [
	^ self visitCSNUIInput: aCSNUIInputWeek
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUILabel: aCSNUILabel [
	^ self visitCSNAttribute: aCSNUILabel
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUILink: aCSNUILink [
	^ self visitCSNLeaf: aCSNUILink
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIList: aCSNUIList [
	^ self visitCSNLeaf: aCSNUIList
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIMax: aCSNUIMax [
	^ self visitCSNAttribute: aCSNUIMax
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIMaxlength: aCSNUIMaxlength [
	^ self visitCSNAttribute: aCSNUIMaxlength
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIMin: aCSNUIMin [
	^ self visitCSNAttribute: aCSNUIMin
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIName: aCSNUIName [
	^ self visitCSNAttribute: aCSNUIName
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIOrderedList: aCSNUIOrderedList [
	^ self visitCSNUIList: aCSNUIOrderedList
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIPanel: aCSNUIPanel [
	^ self visitCSNContainer: aCSNUIPanel
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIParagraph: aCSNUIParagraph [
	^ self visitCSNLeaf: aCSNUIParagraph
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIPlaceholder: aCSNUIPlaceholder [
	^ self visitCSNAttribute: aCSNUIPlaceholder
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIReadonly: aCSNUIReadonly [
	^ self visitCSNAttribute: aCSNUIReadonly
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIRelativeHeight: aCSNUIRelativeHeight [
	^ self visitCSNUIHeight: aCSNUIRelativeHeight
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIRelativeWidth: aCSNUIRelativeWidth [
	^ self visitCSNUIWidth: aCSNUIRelativeWidth
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIRequired: aCSNUIRequired [
	^ self visitCSNAttribute: aCSNUIRequired
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUISelect: aCSNUISelect [
	^ self visitCSNUIInput: aCSNUISelect
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUISize: aCSNUISize [
	^ self visitCSNAttribute: aCSNUISize
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUISrc: aCSNUISrc [
	^ self visitCSNAttribute: aCSNUISrc
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIStyle: aCSNUIStyle [
	^ self visitCSNAttribute: aCSNUIStyle
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUITab: aCSNUITab [
	^ self visitCSNContainer: aCSNUITab
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUITabManager: aCSNUITabManager [
	^ self visitCSNContainer: aCSNUITabManager
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUITable: aCSNUITable [
	^ self visitCSNContainer: aCSNUITable
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUITextarea: aCSNUITextarea [
	^ self visitCSNLeaf: aCSNUITextarea
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUITitle: aCSNUITitle [
	^ self visitCSNAttribute: aCSNUITitle
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUITree: aCSNUITree [
	^ self visitCSNContainer: aCSNUITree
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIUnorderedList: aCSNUIUnorderedList [
	^ self visitCSNUIList: aCSNUIUnorderedList
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIValue: aCSNUIValue [
	^ self visitCSNAttribute: aCSNUIValue
]

{ #category : #generated }
CSNModelVisitor >> visitCSNUIWidth: aCSNUIWidth [
	^ self visitCSNAttribute: aCSNUIWidth
]

{ #category : #generated }
CSNModelVisitor >> visitCSNVariableAttribute: aCSNVariableAttribute [
	^ self visitCSNAttribute: aCSNVariableAttribute
]

{ #category : #generated }
CSNModelVisitor >> visitCSNWidget: aCSNWidget [
	^ self visitCSNOriginedEntity: aCSNWidget
]
