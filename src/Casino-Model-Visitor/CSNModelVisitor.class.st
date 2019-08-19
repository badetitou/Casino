Class {
	#name : #CSNModelVisitor,
	#superclass : #Object,
	#category : #'Casino-Model-Visitor'
}

{ #category : #generated }
CSNModelVisitor class >> visitCSNAction: aCSNAction [
	^ self visitCSNOriginedEntity: aCSNAction
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNActionAppel: aCSNActionAppel [
	^ self visitCSNAction: aCSNActionAppel
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNActionService: aCSNActionService [
	^ self visitCSNAction: aCSNActionService
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNAttribute: aCSNAttribute [
	^ self visitCSNOriginedEntity: aCSNAttribute
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNAutoComplete: aCSNAutoComplete [
	^ self visitCSNInput: aCSNAutoComplete
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNBusinessPage: aCSNBusinessPage [
	^ self visitCSNContainer: aCSNBusinessPage
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNChart: aCSNChart [
	^ self visitCSNContainer: aCSNChart
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNClickHandler: aCSNClickHandler [
	^ self visitCSNAction: aCSNClickHandler
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNContainer: aCSNContainer [
	^ self visitCSNWidget: aCSNContainer
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNCoreCellWidth: aCSNCoreCellWidth [
	^ self visitCSNAttribute: aCSNCoreCellWidth
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNCoreColSpan: aCSNCoreColSpan [
	^ self visitCSNAttribute: aCSNCoreColSpan
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNCoreHorizontalAlignement: aCSNCoreHorizontalAlignement [
	^ self visitCSNAttribute: aCSNCoreHorizontalAlignement
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNCoreRowSpan: aCSNCoreRowSpan [
	^ self visitCSNAttribute: aCSNCoreRowSpan
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNCoreVerticalAlignement: aCSNCoreVerticalAlignement [
	^ self visitCSNAttribute: aCSNCoreVerticalAlignement
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNDialog: aCSNDialog [
	^ self visitCSNContainer: aCSNDialog
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNDynamicFieldset: aCSNDynamicFieldset [
	^ self visitCSNAttribute: aCSNDynamicFieldset
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNGroupFieldset: aCSNGroupFieldset [
	^ self visitCSNAttribute: aCSNGroupFieldset
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNHTML: aCSNHTML [
	^ self visitCSNContainer: aCSNHTML
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNInput: aCSNInput [
	^ self visitCSNContainer: aCSNInput
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNLBorderLayout: aCSNLBorderLayout [
	^ self visitCSNLLayout: aCSNLBorderLayout
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNLCell: aCSNLCell [
	^ self visitCSNWidget: aCSNLCell
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNLGridLayout: aCSNLGridLayout [
	^ self visitCSNLLayout: aCSNLGridLayout
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNLHorizontalLayout: aCSNLHorizontalLayout [
	^ self visitCSNLLayout: aCSNLHorizontalLayout
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNLLayout: aCSNLLayout [
	^ self visitCSNOriginedEntity: aCSNLLayout
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNLVerticalLayout: aCSNLVerticalLayout [
	^ self visitCSNLLayout: aCSNLVerticalLayout
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNLeaf: aCSNLeaf [
	^ self visitCSNWidget: aCSNLeaf
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNLightFieldset: aCSNLightFieldset [
	^ self visitCSNAttribute: aCSNLightFieldset
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNModal: aCSNModal [
	^ self visitCSNVariableAttribute: aCSNModal
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNModel: aCSNModel [
	^ self visitCSNVariableAttribute: aCSNModel
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNOpen: aCSNOpen [
	^ self visitCSNVariableAttribute: aCSNOpen
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNOriginedEntity: aCSNOriginedEntity [
	^ self subclassResponsibility
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNPage: aCSNPage [
	^ self visitCSNContainer: aCSNPage
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNProgressBar: aCSNProgressBar [
	^ self visitCSNContainer: aCSNProgressBar
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNRichTextArea: aCSNRichTextArea [
	^ self visitCSNInput: aCSNRichTextArea
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNService: aCSNService [
	^ self visitCSNOriginedEntity: aCSNService
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNServiceAPI: aCSNServiceAPI [
	^ self visitCSNOriginedEntity: aCSNServiceAPI
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNSplitButton: aCSNSplitButton [
	^ self visitCSNInput: aCSNSplitButton
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNSwitch: aCSNSwitch [
	^ self visitCSNInput: aCSNSwitch
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIAbsoluteHeight: aCSNUIAbsoluteHeight [
	^ self visitCSNUIHeight: aCSNUIAbsoluteHeight
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIAbsoluteWidth: aCSNUIAbsoluteWidth [
	^ self visitCSNUIWidth: aCSNUIAbsoluteWidth
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIAlt: aCSNUIAlt [
	^ self visitCSNAttribute: aCSNUIAlt
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIButton: aCSNUIButton [
	^ self visitCSNContainer: aCSNUIButton
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUICanvas: aCSNUICanvas [
	^ self visitCSNContainer: aCSNUICanvas
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIClass: aCSNUIClass [
	^ self visitCSNAttribute: aCSNUIClass
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIDisabled: aCSNUIDisabled [
	^ self visitCSNAttribute: aCSNUIDisabled
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIFieldset: aCSNUIFieldset [
	^ self visitCSNUIPanel: aCSNUIFieldset
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIHeading1: aCSNUIHeading1 [
	^ self visitCSNLeaf: aCSNUIHeading1
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIHeading2: aCSNUIHeading2 [
	^ self visitCSNLeaf: aCSNUIHeading2
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIHeading3: aCSNUIHeading3 [
	^ self visitCSNLeaf: aCSNUIHeading3
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIHeading4: aCSNUIHeading4 [
	^ self visitCSNLeaf: aCSNUIHeading4
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIHeading5: aCSNUIHeading5 [
	^ self visitCSNLeaf: aCSNUIHeading5
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIHeading6: aCSNUIHeading6 [
	^ self visitCSNLeaf: aCSNUIHeading6
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIHeight: aCSNUIHeight [
	^ self visitCSNAttribute: aCSNUIHeight
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIId: aCSNUIId [
	^ self visitCSNAttribute: aCSNUIId
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIImage: aCSNUIImage [
	^ self visitCSNLeaf: aCSNUIImage
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInput: aCSNUIInput [
	^ self visitCSNLeaf: aCSNUIInput
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInputCheckbox: aCSNUIInputCheckbox [
	^ self visitCSNUIInput: aCSNUIInputCheckbox
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInputColor: aCSNUIInputColor [
	^ self visitCSNUIInput: aCSNUIInputColor
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInputDate: aCSNUIInputDate [
	^ self visitCSNUIInput: aCSNUIInputDate
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInputDatetimeLocal: aCSNUIInputDatetimeLocal [
	^ self visitCSNUIInput: aCSNUIInputDatetimeLocal
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInputEmail: aCSNUIInputEmail [
	^ self visitCSNUIInputText: aCSNUIInputEmail
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInputFile: aCSNUIInputFile [
	^ self visitCSNUIInput: aCSNUIInputFile
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInputMonth: aCSNUIInputMonth [
	^ self visitCSNUIInput: aCSNUIInputMonth
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInputNumber: aCSNUIInputNumber [
	^ self visitCSNUIInput: aCSNUIInputNumber
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInputPassword: aCSNUIInputPassword [
	^ self visitCSNUIInputText: aCSNUIInputPassword
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInputRadio: aCSNUIInputRadio [
	^ self visitCSNUIInput: aCSNUIInputRadio
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInputRange: aCSNUIInputRange [
	^ self visitCSNUIInput: aCSNUIInputRange
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInputReset: aCSNUIInputReset [
	^ self visitCSNUIInput: aCSNUIInputReset
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInputSearch: aCSNUIInputSearch [
	^ self visitCSNUIInput: aCSNUIInputSearch
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInputSubmit: aCSNUIInputSubmit [
	^ self visitCSNUIInput: aCSNUIInputSubmit
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInputTel: aCSNUIInputTel [
	^ self visitCSNUIInput: aCSNUIInputTel
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInputText: aCSNUIInputText [
	^ self visitCSNUIInput: aCSNUIInputText
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInputTime: aCSNUIInputTime [
	^ self visitCSNUIInput: aCSNUIInputTime
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInputUrl: aCSNUIInputUrl [
	^ self visitCSNUIInput: aCSNUIInputUrl
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIInputWeek: aCSNUIInputWeek [
	^ self visitCSNUIInput: aCSNUIInputWeek
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUILabel: aCSNUILabel [
	^ self visitCSNAttribute: aCSNUILabel
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUILink: aCSNUILink [
	^ self visitCSNLeaf: aCSNUILink
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIList: aCSNUIList [
	^ self visitCSNLeaf: aCSNUIList
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIMax: aCSNUIMax [
	^ self visitCSNAttribute: aCSNUIMax
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIMaxlength: aCSNUIMaxlength [
	^ self visitCSNAttribute: aCSNUIMaxlength
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIMin: aCSNUIMin [
	^ self visitCSNAttribute: aCSNUIMin
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIName: aCSNUIName [
	^ self visitCSNAttribute: aCSNUIName
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIOrderedList: aCSNUIOrderedList [
	^ self visitCSNUIList: aCSNUIOrderedList
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIPanel: aCSNUIPanel [
	^ self visitCSNContainer: aCSNUIPanel
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIParagraph: aCSNUIParagraph [
	^ self visitCSNLeaf: aCSNUIParagraph
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIPlaceholder: aCSNUIPlaceholder [
	^ self visitCSNAttribute: aCSNUIPlaceholder
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIReadonly: aCSNUIReadonly [
	^ self visitCSNAttribute: aCSNUIReadonly
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIRelativeHeight: aCSNUIRelativeHeight [
	^ self visitCSNUIHeight: aCSNUIRelativeHeight
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIRelativeWidth: aCSNUIRelativeWidth [
	^ self visitCSNUIWidth: aCSNUIRelativeWidth
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIRequired: aCSNUIRequired [
	^ self visitCSNAttribute: aCSNUIRequired
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUISelect: aCSNUISelect [
	^ self visitCSNUIInput: aCSNUISelect
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUISize: aCSNUISize [
	^ self visitCSNAttribute: aCSNUISize
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUISrc: aCSNUISrc [
	^ self visitCSNAttribute: aCSNUISrc
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIStyle: aCSNUIStyle [
	^ self visitCSNAttribute: aCSNUIStyle
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUITab: aCSNUITab [
	^ self visitCSNContainer: aCSNUITab
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUITabManager: aCSNUITabManager [
	^ self visitCSNContainer: aCSNUITabManager
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUITable: aCSNUITable [
	^ self visitCSNContainer: aCSNUITable
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUITextarea: aCSNUITextarea [
	^ self visitCSNLeaf: aCSNUITextarea
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUITitle: aCSNUITitle [
	^ self visitCSNAttribute: aCSNUITitle
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUITree: aCSNUITree [
	^ self visitCSNContainer: aCSNUITree
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIUnorderedList: aCSNUIUnorderedList [
	^ self visitCSNUIList: aCSNUIUnorderedList
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIValue: aCSNUIValue [
	^ self visitCSNAttribute: aCSNUIValue
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNUIWidth: aCSNUIWidth [
	^ self visitCSNAttribute: aCSNUIWidth
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNVariableAttribute: aCSNVariableAttribute [
	^ self visitCSNAttribute: aCSNVariableAttribute
]

{ #category : #generated }
CSNModelVisitor class >> visitCSNWidget: aCSNWidget [
	^ self visitCSNOriginedEntity: aCSNWidget
]

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
CSNModelVisitor >> visitCSNUICustomWidget: aCSNUICustomWidget [
	^ self visitCSNContainer: aCSNUICustomWidget
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
