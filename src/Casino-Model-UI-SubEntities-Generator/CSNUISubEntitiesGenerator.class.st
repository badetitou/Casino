Class {
	#name : #CSNUISubEntitiesGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'uiButton',
		'uiCanvas',
		'uiPanel',
		'uiFieldset',
		'uiTab',
		'uiTabManager',
		'uiTable',
		'uiTree',
		'uiHeading1',
		'uiHeading2',
		'uiHeading3',
		'uiHeading4',
		'uiHeading5',
		'uiHeading6',
		'uiImage',
		'uiInput',
		'uiInputCheckbox',
		'uiInputColor',
		'uiInputDate',
		'uiInputDatetimeLocal',
		'uiInputFile',
		'uiInputMonth',
		'uiInputNumber',
		'uiInputRadio',
		'uiInputRange',
		'uiInputReset',
		'uiInputSearch',
		'uiInputSubmit',
		'uiInputTel',
		'uiInputText',
		'uiInputEmail',
		'uiInputPassword',
		'uiInputTime',
		'uiInputUrl',
		'uiInputWeek',
		'uiSelect',
		'uiLink',
		'uiList',
		'uiOrderedList',
		'uiUnorderedList',
		'uiParagraph',
		'uiTextarea',
		'uiAlt',
		'uiClass',
		'uiDisabled',
		'uiAbsoluteHeight',
		'uiRelativeHeight',
		'uiId',
		'uiLabel',
		'uiMax',
		'uiMaxlength',
		'uiMin',
		'uiName',
		'uiPlaceholder',
		'uiReadonly',
		'uiRequired',
		'uiSize',
		'uiSrc',
		'uiStyle',
		'uiTitle',
		'uiValue',
		'uiWidth',
		'uiAbsoluteWidth',
		'uiRelativeWidth',
		'uiHeight',
		'widget',
		'attribute',
		'container',
		'leaf',
		'uiCustomWidget',
		'uiWidgetLabel',
		'uiModal',
		'uiModel',
		'uiDropdownButton',
		'uiMenu',
		'uiMenuItem'
	],
	#category : #'Casino-Model-UI-SubEntities-Generator'
}

{ #category : #accessing }
CSNUISubEntitiesGenerator class >> modifyMetamodel: aMetamodel [

	super modifyMetamodel: aMetamodel.
	
	self fixRemoteMetamodelRelationsIn: aMetamodel.
]

{ #category : #accessing }
CSNUISubEntitiesGenerator class >> packageName [

	^ 'Casino-Model-UI-SubEntities'
]

{ #category : #accessing }
CSNUISubEntitiesGenerator class >> prefix [

	^ 'CSNUI'
]

{ #category : #accessing }
CSNUISubEntitiesGenerator class >> submetamodels [
	^ { CSNMetamodelGenerator. CSNLayoutMetamodelGenerator }
]

{ #category : #definition }
CSNUISubEntitiesGenerator >> defineClasses [
	super defineClasses.
	"widget"
	uiCustomWidget := builder newClassNamed: #CustomWidget. 
	uiButton := builder newClassNamed: #Button.
	uiCanvas := builder newClassNamed: #Canvas.
	uiPanel := builder newClassNamed: #Panel.
	uiFieldset := builder newClassNamed: #Fieldset.
	uiTab := builder newClassNamed: #Tab.
	uiTabManager := builder newClassNamed: #TabManager.
	uiTable := builder newClassNamed: #Table.
	uiTree := builder newClassNamed: #Tree.
	uiHeading1 := builder newClassNamed: #Heading1.
	uiHeading2 := builder newClassNamed: #Heading2.
	uiHeading3 := builder newClassNamed: #Heading3.
	uiHeading4 := builder newClassNamed: #Heading4.
	uiHeading5 := builder newClassNamed: #Heading5.
	uiHeading6 := builder newClassNamed: #Heading6.
	uiImage := builder newClassNamed: #Image.
	uiInput := builder newClassNamed: #Input.
	uiInputCheckbox := builder newClassNamed: #InputCheckbox.
	uiInputColor := builder newClassNamed: #InputColor.
	uiInputDate := builder newClassNamed: #InputDate.
	uiInputDatetimeLocal := builder newClassNamed: #InputDatetimeLocal.
	uiInputFile := builder newClassNamed: #InputFile.
	uiInputMonth := builder newClassNamed: #InputMonth.
	uiInputNumber := builder newClassNamed: #InputNumber.
	uiInputRadio := builder newClassNamed: #InputRadio.
	uiInputRange := builder newClassNamed: #InputRange.
	uiInputReset := builder newClassNamed: #InputReset.
	uiInputSearch := builder newClassNamed: #InputSearch.
	uiInputSubmit := builder newClassNamed: #InputSubmit.
	uiInputTel := builder newClassNamed: #InputTel.
	uiInputText := builder newClassNamed: #InputText.
	uiInputEmail := builder newClassNamed: #InputEmail.
	uiInputPassword := builder newClassNamed: #InputPassword.
	uiInputTime := builder newClassNamed: #InputTime.
	uiInputUrl := builder newClassNamed: #InputUrl.
	uiInputWeek := builder newClassNamed: #InputWeek.
	uiSelect := builder newClassNamed: #Select.
	uiLink := builder newClassNamed: #Link.
	uiList := builder newClassNamed: #List.
	uiOrderedList := builder newClassNamed: #OrderedList.
	uiUnorderedList := builder newClassNamed: #UnorderedList.
	uiParagraph := builder newClassNamed: #Paragraph.
	uiTextarea := builder newClassNamed: #Textarea.
	uiDropdownButton := builder newClassNamed: #DropdownButton.
	uiMenu := builder newClassNamed: #Menu.
	uiMenuItem := builder newClassNamed: #MenuItem.
	uiWidgetLabel := builder newClassNamed: #WidgetLabel.

	"attributes"


	uiAlt := builder newClassNamed: #Alt.
	uiClass := builder newClassNamed: #Class.
	uiDisabled := builder newClassNamed: #Disabled.
	uiHeight := builder newClassNamed: #Height.
	uiAbsoluteHeight := builder newClassNamed: #AbsoluteHeight.
	uiRelativeHeight := builder newClassNamed: #RelativeHeight.
	uiId := builder newClassNamed: #Id.
	uiLabel := builder newClassNamed: #Label.
	uiMax := builder newClassNamed: #Max.
	uiMaxlength := builder newClassNamed: #Maxlength.
	uiMin := builder newClassNamed: #Min.
	uiName := builder newClassNamed: #Name.
	uiPlaceholder := builder newClassNamed: #Placeholder.
	uiReadonly := builder newClassNamed: #Readonly.
	uiRequired := builder newClassNamed: #Required.
	uiSize := builder newClassNamed: #Size.
	uiSrc := builder newClassNamed: #Src.
	uiStyle := builder newClassNamed: #Style.
	uiTitle := builder newClassNamed: #Title.
	uiValue := builder newClassNamed: #Value.
	uiWidth := builder newClassNamed: #Width.
	uiAbsoluteWidth := builder newClassNamed: #AbsoluteWidth.
	uiRelativeWidth := builder newClassNamed: #RelativeWidth.
	
	uiModal := builder newClassNamed: #Modal.
	uiModel := builder newClassNamed: #ModelAttribute.
	
	"from Core"
	container := self remoteEntity: #Container withPrefix: #CSN.
	leaf := self remoteEntity: #Leaf withPrefix: #CSN.
	widget := self remoteEntity: #Widget withPrefix: #CSN. 
	attribute := self remoteEntity: #Attribute withPrefix: #CSN.
]

{ #category : #definition }
CSNUISubEntitiesGenerator >> defineHierarchy [
	super defineHierarchy.
	"widgets"
	uiCustomWidget --|> container.
	uiButton --|> container.
	uiDropdownButton --|> uiButton.
	uiCanvas --|> container.
	uiPanel --|> container.
	uiFieldset --|> uiPanel.
	uiTab --|> container.
	uiTabManager --|> container.
	uiTable --|> container.
	uiTree --|> container.
	uiWidgetLabel --|> container.
	uiHeading1 --|> leaf.
	uiHeading2 --|> leaf.
	uiHeading3 --|> leaf.
	uiHeading4 --|> leaf.
	uiHeading5 --|> leaf.
	uiHeading6 --|> leaf.
	uiImage --|> leaf.
	uiInput --|> leaf.
	uiInputCheckbox --|> uiInput.
	uiInputColor --|> uiInput.
	uiInputDate --|> uiInput.
	uiInputDatetimeLocal --|> uiInput.
	uiInputFile --|> uiInput.
	uiInputMonth --|> uiInput.
	uiInputNumber --|> uiInput.
	uiInputRadio --|> uiInput.
	uiInputRange --|> uiInput.
	uiInputReset --|> uiInput.
	uiInputSearch --|> uiInput.
	uiInputSubmit --|> uiInput.
	uiInputTel --|> uiInput.
	uiInputText --|> uiInput.
	uiInputEmail --|> uiInputText.
	uiInputPassword --|> uiInputText.
	uiInputTime --|> uiInput.
	uiInputUrl --|> uiInput.
	uiInputWeek --|> uiInput.
	uiSelect --|> uiInput.
	uiLink --|> leaf.
	uiList --|> leaf.
	uiOrderedList --|> uiList.
	uiUnorderedList --|> uiList.
	uiParagraph --|> leaf.
	uiTextarea --|> leaf.
	uiMenu --|> container.
	uiMenuItem --|> leaf.

	"attributes"
	uiAlt --|> attribute.
	uiClass --|> attribute.
	uiDisabled --|> attribute.
	uiHeight --|> attribute.
	uiAbsoluteHeight --|> uiHeight.
	uiRelativeHeight --|> uiHeight.
	uiId --|> attribute.
	uiLabel --|> attribute.
	uiMax --|> attribute.
	uiMaxlength --|> attribute.
	uiMin --|> attribute.
	uiName --|> attribute.
	uiPlaceholder --|> attribute.
	uiReadonly --|> attribute.
	uiRequired --|> attribute.
	uiSize --|> attribute.
	uiSrc --|> attribute.
	uiStyle --|> attribute.
	uiTitle --|> attribute.
	uiValue --|> attribute.
	uiWidth --|> attribute.
	uiModel --|> attribute.
	uiModal --|> attribute.
	uiAbsoluteWidth --|> uiWidth.
	uiRelativeWidth --|> uiWidth
]

{ #category : #definition }
CSNUISubEntitiesGenerator >> defineProperties [
	super defineProperties.
	"Widgets"
	uiInput property: #value type: #String.
	"Attributes"
	uiDisabled property: #disabled type: #Boolean.
	uiStyle property: #styleAttribute type: #String.
	uiStyle property: #styleAttributeValue type: #String.
]
