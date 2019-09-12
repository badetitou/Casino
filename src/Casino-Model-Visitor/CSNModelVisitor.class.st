Class {
	#name : #CSNModelVisitor,
	#superclass : #Object,
	#category : #'Casino-Model-Visitor'
}

{ #category : #visiting }
CSNModelVisitor class >> visitCSNAction: aCSNAction [
	<generated>
	^ self visitCSNOriginedEntity: aCSNAction
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNActionAppel: aCSNActionAppel [
	<generated>
	^ self visitCSNAction: aCSNActionAppel
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNActionService: aCSNActionService [
	<generated>
	^ self visitCSNAction: aCSNActionService
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNAttribute: aCSNAttribute [
	<generated>
	^ self visitCSNOriginedEntity: aCSNAttribute
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNBusinessPage: aCSNBusinessPage [
	<generated>
	^ self visitCSNContainer: aCSNBusinessPage
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNContainer: aCSNContainer [
	<generated>
	^ self visitCSNWidget: aCSNContainer
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLAbsolutePosition: aCSNLAbsolutePosition [
	<generated>
	^ self visitCSNLPosition: aCSNLAbsolutePosition
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLAbsoluteSize: aCSNLAbsoluteSize [
	<generated>
	^ self visitCSNLSize: aCSNLAbsoluteSize
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLAlignement: aCSNLAlignement [
	<generated>
	^ self visitCSNLPosition: aCSNLAlignement
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLBorderLayout: aCSNLBorderLayout [
	<generated>
	^ self visitCSNLLayout: aCSNLBorderLayout
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLCell: aCSNLCell [
	<generated>
	^ self visitCSNWidget: aCSNLCell
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLCenterAlignement: aCSNLCenterAlignement [
	<generated>
	^ self visitCSNLAlignement: aCSNLCenterAlignement
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLEastAlignement: aCSNLEastAlignement [
	<generated>
	^ self visitCSNLAlignement: aCSNLEastAlignement
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLGridLayout: aCSNLGridLayout [
	<generated>
	^ self visitCSNLLayout: aCSNLGridLayout
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLHorizontalLayout: aCSNLHorizontalLayout [
	<generated>
	^ self visitCSNLLayout: aCSNLHorizontalLayout
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLLayout: aCSNLLayout [
	<generated>
	^ self visitCSNOriginedEntity: aCSNLLayout
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLNorthAlignement: aCSNLNorthAlignement [
	<generated>
	^ self visitCSNLAlignement: aCSNLNorthAlignement
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLNorthEastAlignement: aCSNLNorthEastAlignement [
	<generated>
	^ self visitCSNLAlignement: aCSNLNorthEastAlignement
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLNorthWestAlignement: aCSNLNorthWestAlignement [
	<generated>
	^ self visitCSNLAlignement: aCSNLNorthWestAlignement
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLPosition: aCSNLPosition [
	<generated>
	^ self visitCSNOriginedEntity: aCSNLPosition
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLRelativePosition: aCSNLRelativePosition [
	<generated>
	^ self visitCSNLPosition: aCSNLRelativePosition
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLRelativeSize: aCSNLRelativeSize [
	<generated>
	^ self visitCSNLSize: aCSNLRelativeSize
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLSize: aCSNLSize [
	<generated>
	^ self visitCSNOriginedEntity: aCSNLSize
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLSouthAlignement: aCSNLSouthAlignement [
	<generated>
	^ self visitCSNLAlignement: aCSNLSouthAlignement
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLSouthEastAlignement: aCSNLSouthEastAlignement [
	<generated>
	^ self visitCSNLAlignement: aCSNLSouthEastAlignement
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLSouthWestAlignement: aCSNLSouthWestAlignement [
	<generated>
	^ self visitCSNLAlignement: aCSNLSouthWestAlignement
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLVerticalLayout: aCSNLVerticalLayout [
	<generated>
	^ self visitCSNLLayout: aCSNLVerticalLayout
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLWestAlignement: aCSNLWestAlignement [
	<generated>
	^ self visitCSNLAlignement: aCSNLWestAlignement
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNLeaf: aCSNLeaf [
	<generated>
	^ self visitCSNWidget: aCSNLeaf
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNOriginedEntity: aCSNAction [
	^ self subclassResponsibility
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNPage: aCSNPage [
	<generated>
	^ self visitCSNContainer: aCSNPage
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNService: aCSNService [
	<generated>
	^ self visitCSNOriginedEntity: aCSNService
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNServiceAPI: aCSNServiceAPI [
	<generated>
	^ self visitCSNOriginedEntity: aCSNServiceAPI
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIAbsoluteHeight: aCSNUIAbsoluteHeight [
	<generated>
	^ self visitCSNUIHeight: aCSNUIAbsoluteHeight
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIAbsoluteWidth: aCSNUIAbsoluteWidth [
	<generated>
	^ self visitCSNUIWidth: aCSNUIAbsoluteWidth
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIAlt: aCSNUIAlt [
	<generated>
	^ self visitCSNAttribute: aCSNUIAlt
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIButton: aCSNUIButton [
	<generated>
	^ self visitCSNContainer: aCSNUIButton
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICWAutoComplete: aCSNUICWAutoComplete [
	<generated>
	^ self visitCSNUIInput: aCSNUICWAutoComplete
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICWChart: aCSNUICWChart [
	<generated>
	^ self visitCSNContainer: aCSNUICWChart
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICWClickHandler: aCSNUICWClickHandler [
	<generated>
	^ self visitCSNAction: aCSNUICWClickHandler
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICWCoreCellWidth: aCSNUICWCoreCellWidth [
	<generated>
	^ self visitCSNAttribute: aCSNUICWCoreCellWidth
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICWCoreColSpan: aCSNUICWCoreColSpan [
	<generated>
	^ self visitCSNAttribute: aCSNUICWCoreColSpan
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICWCoreHorizontalAlignement: aCSNUICWCoreHorizontalAlignement [
	<generated>
	^ self visitCSNAttribute: aCSNUICWCoreHorizontalAlignement
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICWCoreRowSpan: aCSNUICWCoreRowSpan [
	<generated>
	^ self visitCSNAttribute: aCSNUICWCoreRowSpan
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICWCoreVerticalAlignement: aCSNUICWCoreVerticalAlignement [
	<generated>
	^ self visitCSNAttribute: aCSNUICWCoreVerticalAlignement
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICWDialog: aCSNUICWDialog [
	<generated>
	^ self visitCSNContainer: aCSNUICWDialog
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICWDynamicFieldset: aCSNUICWDynamicFieldset [
	<generated>
	^ self visitCSNAttribute: aCSNUICWDynamicFieldset
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICWGroupFieldset: aCSNUICWGroupFieldset [
	<generated>
	^ self visitCSNAttribute: aCSNUICWGroupFieldset
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICWHTML: aCSNUICWHTML [
	<generated>
	^ self visitCSNContainer: aCSNUICWHTML
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICWLightFieldset: aCSNUICWLightFieldset [
	<generated>
	^ self visitCSNAttribute: aCSNUICWLightFieldset
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICWOpen: aCSNUICWOpen [
	<generated>
	^ self visitCSNAttribute: aCSNUICWOpen
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICWProgressBar: aCSNUICWProgressBar [
	<generated>
	^ self visitCSNContainer: aCSNUICWProgressBar
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICWRichTextArea: aCSNUICWRichTextArea [
	<generated>
	^ self visitCSNUIInput: aCSNUICWRichTextArea
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICWSplitButton: aCSNUICWSplitButton [
	<generated>
	^ self visitCSNUIInput: aCSNUICWSplitButton
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICWSwitch: aCSNUICWSwitch [
	<generated>
	^ self visitCSNUIInput: aCSNUICWSwitch
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICanvas: aCSNUICanvas [
	<generated>
	^ self visitCSNContainer: aCSNUICanvas
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIClass: aCSNUIClass [
	<generated>
	^ self visitCSNAttribute: aCSNUIClass
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUICustomWidget: aCSNUICustomWidget [
	<generated>
	^ self visitCSNContainer: aCSNUICustomWidget
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIDisabled: aCSNUIDisabled [
	<generated>
	^ self visitCSNAttribute: aCSNUIDisabled
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIFieldset: aCSNUIFieldset [
	<generated>
	^ self visitCSNUIPanel: aCSNUIFieldset
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIHeading1: aCSNUIHeading1 [
	<generated>
	^ self visitCSNLeaf: aCSNUIHeading1
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIHeading2: aCSNUIHeading2 [
	<generated>
	^ self visitCSNLeaf: aCSNUIHeading2
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIHeading3: aCSNUIHeading3 [
	<generated>
	^ self visitCSNLeaf: aCSNUIHeading3
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIHeading4: aCSNUIHeading4 [
	<generated>
	^ self visitCSNLeaf: aCSNUIHeading4
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIHeading5: aCSNUIHeading5 [
	<generated>
	^ self visitCSNLeaf: aCSNUIHeading5
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIHeading6: aCSNUIHeading6 [
	<generated>
	^ self visitCSNLeaf: aCSNUIHeading6
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIHeight: aCSNUIHeight [
	<generated>
	^ self visitCSNAttribute: aCSNUIHeight
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIId: aCSNUIId [
	<generated>
	^ self visitCSNAttribute: aCSNUIId
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIImage: aCSNUIImage [
	<generated>
	^ self visitCSNLeaf: aCSNUIImage
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInput: aCSNUIInput [
	<generated>
	^ self visitCSNLeaf: aCSNUIInput
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInputCheckbox: aCSNUIInputCheckbox [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputCheckbox
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInputColor: aCSNUIInputColor [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputColor
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInputDate: aCSNUIInputDate [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputDate
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInputDatetimeLocal: aCSNUIInputDatetimeLocal [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputDatetimeLocal
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInputEmail: aCSNUIInputEmail [
	<generated>
	^ self visitCSNUIInputText: aCSNUIInputEmail
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInputFile: aCSNUIInputFile [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputFile
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInputMonth: aCSNUIInputMonth [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputMonth
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInputNumber: aCSNUIInputNumber [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputNumber
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInputPassword: aCSNUIInputPassword [
	<generated>
	^ self visitCSNUIInputText: aCSNUIInputPassword
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInputRadio: aCSNUIInputRadio [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputRadio
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInputRange: aCSNUIInputRange [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputRange
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInputReset: aCSNUIInputReset [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputReset
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInputSearch: aCSNUIInputSearch [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputSearch
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInputSubmit: aCSNUIInputSubmit [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputSubmit
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInputTel: aCSNUIInputTel [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputTel
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInputText: aCSNUIInputText [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputText
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInputTime: aCSNUIInputTime [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputTime
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInputUrl: aCSNUIInputUrl [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputUrl
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIInputWeek: aCSNUIInputWeek [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputWeek
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUILabel: aCSNUILabel [
	<generated>
	^ self visitCSNAttribute: aCSNUILabel
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUILink: aCSNUILink [
	<generated>
	^ self visitCSNLeaf: aCSNUILink
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIList: aCSNUIList [
	<generated>
	^ self visitCSNLeaf: aCSNUIList
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIMax: aCSNUIMax [
	<generated>
	^ self visitCSNAttribute: aCSNUIMax
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIMaxlength: aCSNUIMaxlength [
	<generated>
	^ self visitCSNAttribute: aCSNUIMaxlength
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIMin: aCSNUIMin [
	<generated>
	^ self visitCSNAttribute: aCSNUIMin
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIModal: aCSNUIModal [
	<generated>
	^ self visitCSNAttribute: aCSNUIModal
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIModel: aCSNUIModel [
	<generated>
	^ self visitCSNAttribute: aCSNUIModel
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIName: aCSNUIName [
	<generated>
	^ self visitCSNAttribute: aCSNUIName
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIOrderedList: aCSNUIOrderedList [
	<generated>
	^ self visitCSNUIList: aCSNUIOrderedList
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIPanel: aCSNUIPanel [
	<generated>
	^ self visitCSNContainer: aCSNUIPanel
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIParagraph: aCSNUIParagraph [
	<generated>
	^ self visitCSNLeaf: aCSNUIParagraph
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIPlaceholder: aCSNUIPlaceholder [
	<generated>
	^ self visitCSNAttribute: aCSNUIPlaceholder
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIReadonly: aCSNUIReadonly [
	<generated>
	^ self visitCSNAttribute: aCSNUIReadonly
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIRelativeHeight: aCSNUIRelativeHeight [
	<generated>
	^ self visitCSNUIHeight: aCSNUIRelativeHeight
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIRelativeWidth: aCSNUIRelativeWidth [
	<generated>
	^ self visitCSNUIWidth: aCSNUIRelativeWidth
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIRequired: aCSNUIRequired [
	<generated>
	^ self visitCSNAttribute: aCSNUIRequired
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUISelect: aCSNUISelect [
	<generated>
	^ self visitCSNUIInput: aCSNUISelect
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUISize: aCSNUISize [
	<generated>
	^ self visitCSNAttribute: aCSNUISize
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUISrc: aCSNUISrc [
	<generated>
	^ self visitCSNAttribute: aCSNUISrc
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIStyle: aCSNUIStyle [
	<generated>
	^ self visitCSNAttribute: aCSNUIStyle
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUITab: aCSNUITab [
	<generated>
	^ self visitCSNContainer: aCSNUITab
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUITabManager: aCSNUITabManager [
	<generated>
	^ self visitCSNContainer: aCSNUITabManager
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUITable: aCSNUITable [
	<generated>
	^ self visitCSNContainer: aCSNUITable
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUITextarea: aCSNUITextarea [
	<generated>
	^ self visitCSNLeaf: aCSNUITextarea
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUITitle: aCSNUITitle [
	<generated>
	^ self visitCSNAttribute: aCSNUITitle
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUITree: aCSNUITree [
	<generated>
	^ self visitCSNContainer: aCSNUITree
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIUnorderedList: aCSNUIUnorderedList [
	<generated>
	^ self visitCSNUIList: aCSNUIUnorderedList
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIValue: aCSNUIValue [
	<generated>
	^ self visitCSNAttribute: aCSNUIValue
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIWidgetLabel: aCSNUIWidgetLabel [
	<generated>
	^ self visitCSNContainer: aCSNUIWidgetLabel
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNUIWidth: aCSNUIWidth [
	<generated>
	^ self visitCSNAttribute: aCSNUIWidth
]

{ #category : #visiting }
CSNModelVisitor class >> visitCSNWidget: aCSNWidget [
	<generated>
	^ self visitCSNOriginedEntity: aCSNWidget
]

{ #category : #visiting }
CSNModelVisitor >> visit: anElement [
	^ anElement accept: self
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNAction: aCSNAction [
	<generated>
	^ self visitCSNOriginedEntity: aCSNAction
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNActionAppel: aCSNActionAppel [
	<generated>
	^ self visitCSNAction: aCSNActionAppel
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNActionService: aCSNActionService [
	<generated>
	^ self visitCSNAction: aCSNActionService
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNAttribute: aCSNAttribute [
	<generated>
	^ self visitCSNOriginedEntity: aCSNAttribute
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNBusinessPage: aCSNBusinessPage [
	<generated>
	^ self visitCSNContainer: aCSNBusinessPage
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNContainer: aCSNContainer [
	<generated>
	^ self visitCSNWidget: aCSNContainer
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLAbsolutePosition: aCSNLAbsolutePosition [
	<generated>
	^ self visitCSNLPosition: aCSNLAbsolutePosition
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLAbsoluteSize: aCSNLAbsoluteSize [
	<generated>
	^ self visitCSNLSize: aCSNLAbsoluteSize
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLAlignement: aCSNLAlignement [
	<generated>
	^ self visitCSNLPosition: aCSNLAlignement
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLBorderLayout: aCSNLBorderLayout [
	<generated>
	^ self visitCSNLLayout: aCSNLBorderLayout
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLCell: aCSNLCell [
	<generated>
	^ self visitCSNWidget: aCSNLCell
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLCenterAlignement: aCSNLCenterAlignement [
	<generated>
	^ self visitCSNLAlignement: aCSNLCenterAlignement
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLEastAlignement: aCSNLEastAlignement [
	<generated>
	^ self visitCSNLAlignement: aCSNLEastAlignement
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLGridLayout: aCSNLGridLayout [
	<generated>
	^ self visitCSNLLayout: aCSNLGridLayout
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLHorizontalLayout: aCSNLHorizontalLayout [
	<generated>
	^ self visitCSNLLayout: aCSNLHorizontalLayout
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLLayout: aCSNLLayout [
	<generated>
	^ self visitCSNOriginedEntity: aCSNLLayout
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLNorthAlignement: aCSNLNorthAlignement [
	<generated>
	^ self visitCSNLAlignement: aCSNLNorthAlignement
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLNorthEastAlignement: aCSNLNorthEastAlignement [
	<generated>
	^ self visitCSNLAlignement: aCSNLNorthEastAlignement
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLNorthWestAlignement: aCSNLNorthWestAlignement [
	<generated>
	^ self visitCSNLAlignement: aCSNLNorthWestAlignement
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLPosition: aCSNLPosition [
	<generated>
	^ self visitCSNOriginedEntity: aCSNLPosition
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLRelativePosition: aCSNLRelativePosition [
	<generated>
	^ self visitCSNLPosition: aCSNLRelativePosition
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLRelativeSize: aCSNLRelativeSize [
	<generated>
	^ self visitCSNLSize: aCSNLRelativeSize
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLSize: aCSNLSize [
	<generated>
	^ self visitCSNOriginedEntity: aCSNLSize
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLSouthAlignement: aCSNLSouthAlignement [
	<generated>
	^ self visitCSNLAlignement: aCSNLSouthAlignement
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLSouthEastAlignement: aCSNLSouthEastAlignement [
	<generated>
	^ self visitCSNLAlignement: aCSNLSouthEastAlignement
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLSouthWestAlignement: aCSNLSouthWestAlignement [
	<generated>
	^ self visitCSNLAlignement: aCSNLSouthWestAlignement
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLVerticalLayout: aCSNLVerticalLayout [
	<generated>
	^ self visitCSNLLayout: aCSNLVerticalLayout
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLWestAlignement: aCSNLWestAlignement [
	<generated>
	^ self visitCSNLAlignement: aCSNLWestAlignement
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNLeaf: aCSNLeaf [
	<generated>
	^ self visitCSNWidget: aCSNLeaf
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNOriginedEntity: aCSNOriginedEntity [
	aCSNOriginedEntity prepareAcceptFor: self.
	aCSNOriginedEntity writeCodeWith: self.
	aCSNOriginedEntity visitSuccessorWith: self 
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNPage: aCSNPage [
	<generated>
	^ self visitCSNContainer: aCSNPage
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNService: aCSNService [
	<generated>
	^ self visitCSNOriginedEntity: aCSNService
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNServiceAPI: aCSNServiceAPI [
	<generated>
	^ self visitCSNOriginedEntity: aCSNServiceAPI
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIAbsoluteHeight: aCSNUIAbsoluteHeight [
	<generated>
	^ self visitCSNUIHeight: aCSNUIAbsoluteHeight
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIAbsoluteWidth: aCSNUIAbsoluteWidth [
	<generated>
	^ self visitCSNUIWidth: aCSNUIAbsoluteWidth
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIAlt: aCSNUIAlt [
	<generated>
	^ self visitCSNAttribute: aCSNUIAlt
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIButton: aCSNUIButton [
	<generated>
	^ self visitCSNContainer: aCSNUIButton
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICWAutoComplete: aCSNUICWAutoComplete [
	<generated>
	^ self visitCSNUIInput: aCSNUICWAutoComplete
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICWChart: aCSNUICWChart [
	<generated>
	^ self visitCSNContainer: aCSNUICWChart
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICWClickHandler: aCSNUICWClickHandler [
	<generated>
	^ self visitCSNAction: aCSNUICWClickHandler
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICWCoreCellWidth: aCSNUICWCoreCellWidth [
	<generated>
	^ self visitCSNAttribute: aCSNUICWCoreCellWidth
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICWCoreColSpan: aCSNUICWCoreColSpan [
	<generated>
	^ self visitCSNAttribute: aCSNUICWCoreColSpan
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICWCoreHorizontalAlignement: aCSNUICWCoreHorizontalAlignement [
	<generated>
	^ self visitCSNAttribute: aCSNUICWCoreHorizontalAlignement
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICWCoreRowSpan: aCSNUICWCoreRowSpan [
	<generated>
	^ self visitCSNAttribute: aCSNUICWCoreRowSpan
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICWCoreVerticalAlignement: aCSNUICWCoreVerticalAlignement [
	<generated>
	^ self visitCSNAttribute: aCSNUICWCoreVerticalAlignement
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICWDialog: aCSNUICWDialog [
	<generated>
	^ self visitCSNContainer: aCSNUICWDialog
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICWDynamicFieldset: aCSNUICWDynamicFieldset [
	<generated>
	^ self visitCSNAttribute: aCSNUICWDynamicFieldset
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICWGroupFieldset: aCSNUICWGroupFieldset [
	<generated>
	^ self visitCSNAttribute: aCSNUICWGroupFieldset
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICWHTML: aCSNUICWHTML [
	<generated>
	^ self visitCSNContainer: aCSNUICWHTML
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICWLightFieldset: aCSNUICWLightFieldset [
	<generated>
	^ self visitCSNAttribute: aCSNUICWLightFieldset
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICWOpen: aCSNUICWOpen [
	<generated>
	^ self visitCSNAttribute: aCSNUICWOpen
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICWProgressBar: aCSNUICWProgressBar [
	<generated>
	^ self visitCSNContainer: aCSNUICWProgressBar
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICWRichTextArea: aCSNUICWRichTextArea [
	<generated>
	^ self visitCSNUIInput: aCSNUICWRichTextArea
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICWSplitButton: aCSNUICWSplitButton [
	<generated>
	^ self visitCSNUIInput: aCSNUICWSplitButton
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICWSwitch: aCSNUICWSwitch [
	<generated>
	^ self visitCSNUIInput: aCSNUICWSwitch
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICanvas: aCSNUICanvas [
	<generated>
	^ self visitCSNContainer: aCSNUICanvas
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIClass: aCSNUIClass [
	<generated>
	^ self visitCSNAttribute: aCSNUIClass
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUICustomWidget: aCSNUICustomWidget [
	<generated>
	^ self visitCSNContainer: aCSNUICustomWidget
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIDisabled: aCSNUIDisabled [
	<generated>
	^ self visitCSNAttribute: aCSNUIDisabled
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIFieldset: aCSNUIFieldset [
	<generated>
	^ self visitCSNUIPanel: aCSNUIFieldset
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIHeading1: aCSNUIHeading1 [
	<generated>
	^ self visitCSNLeaf: aCSNUIHeading1
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIHeading2: aCSNUIHeading2 [
	<generated>
	^ self visitCSNLeaf: aCSNUIHeading2
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIHeading3: aCSNUIHeading3 [
	<generated>
	^ self visitCSNLeaf: aCSNUIHeading3
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIHeading4: aCSNUIHeading4 [
	<generated>
	^ self visitCSNLeaf: aCSNUIHeading4
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIHeading5: aCSNUIHeading5 [
	<generated>
	^ self visitCSNLeaf: aCSNUIHeading5
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIHeading6: aCSNUIHeading6 [
	<generated>
	^ self visitCSNLeaf: aCSNUIHeading6
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIHeight: aCSNUIHeight [
	<generated>
	^ self visitCSNAttribute: aCSNUIHeight
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIId: aCSNUIId [
	<generated>
	^ self visitCSNAttribute: aCSNUIId
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIImage: aCSNUIImage [
	<generated>
	^ self visitCSNLeaf: aCSNUIImage
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInput: aCSNUIInput [
	<generated>
	^ self visitCSNLeaf: aCSNUIInput
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInputCheckbox: aCSNUIInputCheckbox [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputCheckbox
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInputColor: aCSNUIInputColor [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputColor
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInputDate: aCSNUIInputDate [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputDate
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInputDatetimeLocal: aCSNUIInputDatetimeLocal [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputDatetimeLocal
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInputEmail: aCSNUIInputEmail [
	<generated>
	^ self visitCSNUIInputText: aCSNUIInputEmail
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInputFile: aCSNUIInputFile [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputFile
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInputMonth: aCSNUIInputMonth [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputMonth
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInputNumber: aCSNUIInputNumber [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputNumber
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInputPassword: aCSNUIInputPassword [
	<generated>
	^ self visitCSNUIInputText: aCSNUIInputPassword
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInputRadio: aCSNUIInputRadio [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputRadio
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInputRange: aCSNUIInputRange [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputRange
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInputReset: aCSNUIInputReset [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputReset
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInputSearch: aCSNUIInputSearch [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputSearch
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInputSubmit: aCSNUIInputSubmit [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputSubmit
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInputTel: aCSNUIInputTel [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputTel
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInputText: aCSNUIInputText [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputText
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInputTime: aCSNUIInputTime [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputTime
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInputUrl: aCSNUIInputUrl [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputUrl
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIInputWeek: aCSNUIInputWeek [
	<generated>
	^ self visitCSNUIInput: aCSNUIInputWeek
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUILabel: aCSNUILabel [
	<generated>
	^ self visitCSNAttribute: aCSNUILabel
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUILink: aCSNUILink [
	<generated>
	^ self visitCSNLeaf: aCSNUILink
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIList: aCSNUIList [
	<generated>
	^ self visitCSNLeaf: aCSNUIList
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIMax: aCSNUIMax [
	<generated>
	^ self visitCSNAttribute: aCSNUIMax
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIMaxlength: aCSNUIMaxlength [
	<generated>
	^ self visitCSNAttribute: aCSNUIMaxlength
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIMin: aCSNUIMin [
	<generated>
	^ self visitCSNAttribute: aCSNUIMin
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIModal: aCSNUIModal [
	<generated>
	^ self visitCSNAttribute: aCSNUIModal
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIModel: aCSNUIModel [
	<generated>
	^ self visitCSNAttribute: aCSNUIModel
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIName: aCSNUIName [
	<generated>
	^ self visitCSNAttribute: aCSNUIName
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIOrderedList: aCSNUIOrderedList [
	<generated>
	^ self visitCSNUIList: aCSNUIOrderedList
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIPanel: aCSNUIPanel [
	<generated>
	^ self visitCSNContainer: aCSNUIPanel
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIParagraph: aCSNUIParagraph [
	<generated>
	^ self visitCSNLeaf: aCSNUIParagraph
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIPlaceholder: aCSNUIPlaceholder [
	<generated>
	^ self visitCSNAttribute: aCSNUIPlaceholder
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIReadonly: aCSNUIReadonly [
	<generated>
	^ self visitCSNAttribute: aCSNUIReadonly
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIRelativeHeight: aCSNUIRelativeHeight [
	<generated>
	^ self visitCSNUIHeight: aCSNUIRelativeHeight
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIRelativeWidth: aCSNUIRelativeWidth [
	<generated>
	^ self visitCSNUIWidth: aCSNUIRelativeWidth
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIRequired: aCSNUIRequired [
	<generated>
	^ self visitCSNAttribute: aCSNUIRequired
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUISelect: aCSNUISelect [
	<generated>
	^ self visitCSNUIInput: aCSNUISelect
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUISize: aCSNUISize [
	<generated>
	^ self visitCSNAttribute: aCSNUISize
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUISrc: aCSNUISrc [
	<generated>
	^ self visitCSNAttribute: aCSNUISrc
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIStyle: aCSNUIStyle [
	<generated>
	^ self visitCSNAttribute: aCSNUIStyle
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUITab: aCSNUITab [
	<generated>
	^ self visitCSNContainer: aCSNUITab
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUITabManager: aCSNUITabManager [
	<generated>
	^ self visitCSNContainer: aCSNUITabManager
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUITable: aCSNUITable [
	<generated>
	^ self visitCSNContainer: aCSNUITable
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUITextarea: aCSNUITextarea [
	<generated>
	^ self visitCSNLeaf: aCSNUITextarea
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUITitle: aCSNUITitle [
	<generated>
	^ self visitCSNAttribute: aCSNUITitle
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUITree: aCSNUITree [
	<generated>
	^ self visitCSNContainer: aCSNUITree
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIUnorderedList: aCSNUIUnorderedList [
	<generated>
	^ self visitCSNUIList: aCSNUIUnorderedList
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIValue: aCSNUIValue [
	<generated>
	^ self visitCSNAttribute: aCSNUIValue
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIWidgetLabel: aCSNUIWidgetLabel [
	<generated>
	^ self visitCSNContainer: aCSNUIWidgetLabel
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNUIWidth: aCSNUIWidth [
	<generated>
	^ self visitCSNAttribute: aCSNUIWidth
]

{ #category : #visiting }
CSNModelVisitor >> visitCSNWidget: aCSNWidget [
	<generated>
	^ self visitCSNOriginedEntity: aCSNWidget
]
