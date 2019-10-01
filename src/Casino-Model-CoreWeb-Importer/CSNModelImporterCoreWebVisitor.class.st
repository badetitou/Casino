Class {
	#name : #CSNModelImporterCoreWebVisitor,
	#superclass : #CSNModelImporterVisitor,
	#category : #'Casino-Model-CoreWeb-Importer'
}

{ #category : #private }
CSNModelImporterCoreWebVisitor >> attributeFor: widget fromComponentUtilsForInvocation: anInvocation [
	"used by CSNUIParagraph"
	widget
		addAttribute:
			((self create: CSNUILabel)
				attributeValue:
					(anInvocation parameters at: 1 ifAbsent: [ '' ])
						,
							((anInvocation parameters at: 2 ifAbsent: [ '' ]) = 'true'
								ifTrue: [ '*' ]
								ifFalse: [ '' ])
						,
							((anInvocation parameters at: 5 ifAbsent: [ 'true' ]) = 'true'
								ifTrue: [ ':' ]
								ifFalse: [ '' ])).
	widget
		addAttribute:
			((self create: CSNUIClass)
				attributeValue: ((anInvocation parameters at: 3 ifAbsent: [ 'NIVEAU2' ]) removePrefix: 'BLLabel.'))
]

{ #category : #private }
CSNModelImporterCoreWebVisitor >> canBeCSNUIHeight [
	^ source isInvocation and: [ source signature beginsWith: 'setHeight' ]
]

{ #category : #private }
CSNModelImporterCoreWebVisitor >> canBeCSNUIWidth [
	^ source isInvocation and: [ source signature beginsWith: 'setWidth' ]
]

{ #category : #api }
CSNModelImporterCoreWebVisitor >> createAttribute: aWidgetClass for: attributeElement [
	^ (self create: aWidgetClass)
		source: source;
		name: attributeElement attributeName;
		attributeValue: (self getAttributeValueFrom: attributeElement);
		widget: entity;
		yourself
]

{ #category : #api }
CSNModelImporterCoreWebVisitor >> createWidget: aWidgetClass [
	^ (self create: aWidgetClass)
		realClass: ((#(#FactoryBLLabel #ComponentUtils) includes: source invokedClassName) ifTrue: [ nil ] ifFalse: [ source invokedClass ]);
		addSource: source;
		yourself
]

{ #category : #api }
CSNModelImporterCoreWebVisitor >> createWidgetInput: anInputClass [
	^ (self createWidget: anInputClass)
		addAttribute: ((self create: CSNUIValue) attributeValue: (source parameters at: 4 ifAbsent: [ '' ]));
		yourself
]

{ #category : #api }
CSNModelImporterCoreWebVisitor >> createWidgetInputText: anInputTextClass [
	^ (self createWidgetInput: anInputTextClass)
		addAttribute: ((self create: CSNUIPlaceholder) attributeValue: (source parameters at: 1 ifAbsent: [ '' ]));
		yourself
]

{ #category : #api }
CSNModelImporterCoreWebVisitor >> createWidgetPanel: aWidgetClass [
	| panel |
	panel := self createWidget: aWidgetClass.
	panel layout: (panel mooseModel add: (CSNLLayout newCoreLayoutFor: source)).
	source parameters size >= 2
		ifTrue: [ panel
				addAttribute:
					((self create: CSNUIWidth)
						name: 'width';
						attributeValue: (source parameters at: 2)) ].
	^ panel
]

{ #category : #private }
CSNModelImporterCoreWebVisitor >> getAttributeValueFrom: anInvocation [
	^ anInvocation parameters first
]

{ #category : #api }
CSNModelImporterCoreWebVisitor >> visitCSNUIAbsoluteHeight: aCSNUIAbsoluteHeight [
	"because the subclass also need to check before creation, we externalise the condition"

	^ (self canBeCSNUIHeight and: [ (self getAttributeValueFrom: source) endsWith: 'px' ])
		ifTrue: [ | attribute |
			attribute := self visitCSNUIHeight: aCSNUIAbsoluteHeight.
			attribute attributeValue: (attribute attributeValue removeSuffix: 'px').
			attribute ]
		ifFalse: [ nil ]
]

{ #category : #api }
CSNModelImporterCoreWebVisitor >> visitCSNUIAbsoluteWidth: aCSNUIAbsoluteWidth [
	"because the subclass also need to check before creation, we externalise the condition"

	^ (self canBeCSNUIWidth and: [ (self getAttributeValueFrom: source) endsWith: 'px' ])
		ifTrue: [ | attribute |
			attribute := self visitCSNUIWidth: aCSNUIAbsoluteWidth.
			attribute attributeValue: (attribute attributeValue removeSuffix: 'px').
			attribute ]
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUIButton: aCSNUIButton [
	^ (#('Button' 'BLLinkButton') includes: source invokedClassName)
		ifTrue: [ (self createWidget: aCSNUIButton) 
			addAttribute: ((self create: CSNUILabel) 
				attributeValue: (source parameters at: 1 ifAbsent: [ '' ]));
				yourself ] ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUICWAutoComplete: aCSNAutoComplete [
	^ (#('BLDefaultQuickSearch' 'QuicksearchExempleREL') includes: source invokedClassName) 
		ifTrue: [ (self createWidget: aCSNAutoComplete) ] 
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUICWChart: aCSNChart [
	^ ('.*Chart.*' asRegex matchesPrefix: source invokedClassName) 
		ifTrue: [ self createWidget: aCSNChart ] 
		ifFalse: [ nil ]
]

{ #category : #api }
CSNModelImporterCoreWebVisitor >> visitCSNUICWCoreCellWidth: aCSNCoreCellWidth [
	"bl_groupe_horizontal_289.setCellWidth(bl_groupe_vertical_290, '50%');
	
	1. Get the variable name -> anInvocation parameters at: 1 (in ex: bl_groupe_vertical_290)
	2. Determine the real variable with the property -> anImporter widgetInVariable: ()
	3. If this variable exist as a Widget (we hope so... but sometimes there are bugs for something we don't currently know), create the attribute and add it to the cellOwner of the variable
	"

	^ (source isInvocation and: [ source attributeName = 'cellwidth' ])
		ifTrue: [ (factory importer
				widgetInVariable:
					((source from localVariables select: [ :localVariable | localVariable name = (source parameters at: 1) ]) ifNotEmpty: [ :correspondingVariable | correspondingVariable first ] ifEmpty: [ nil ]))
				ifNotNil: [ :widget | 
					^ (self create: CSNUIWidth)
						name: 'cellwidth';
						attributeValue: (source parameters at: 2);
						widget: widget cellOwner;
						yourself ] ]
		ifFalse: [ ^ nil ]
]

{ #category : #api }
CSNModelImporterCoreWebVisitor >> visitCSNUICWCoreColSpan: aCSNCoreColSpan [
	^ (source isInvocation and: [ source attributeName = 'colspan' ])
		ifTrue: [ (self createAttribute: aCSNCoreColSpan for: source)
				attributeValue: source parameters third;
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #api }
CSNModelImporterCoreWebVisitor >> visitCSNUICWCoreHorizontalAlignement: aCSNCoreHorizontalAlignement [
	"bl_groupe_horizontal_289.setCellWidth(bl_groupe_vertical_290, '50%');
	
	1. Get the variable name -> anInvocation parameters at: 1 (in ex: bl_groupe_vertical_290)
	2. Determine the real variable with the property -> anImporter widgetInVariable: ()
	3. If this variable exist as a Widget (we hope so... but sometimes there are bugs for something we don't currently know), create the attribute and add it to the cellOwner of the variable
	"

	^ (source isInvocation and: [ source attributeName = 'horizontalalignment' ])
		ifTrue: [ entity
				ifNil: [ | alignement |
					alignement := CSNLAlignement createAlignementWithHorizontal: source parameters first andVertical: nil.
					self factory model add: alignement.
					^ alignement ]
				ifNotNil: [ entity subWidgets
						do: [ :widget | 
							| alignement |
							alignement := CSNLAlignement createAlignementWithHorizontal: source parameters first andVertical: nil.
							self factory model add: alignement.
							widget position: alignement ].
					^ nil ] ]
		ifFalse: [ ^ nil ]
]

{ #category : #api }
CSNModelImporterCoreWebVisitor >> visitCSNUICWCoreRowSpan: aCSNCoreRowSpan [
	^ (source isInvocation and: [ source attributeName = 'rowspan' ])
		ifTrue: [ (self createAttribute: aCSNCoreRowSpan for: source)
				attributeValue: source parameters third;
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #api }
CSNModelImporterCoreWebVisitor >> visitCSNUICWCoreVerticalAlignement: aCSNCoreVerticalAlignement [
	"bl_groupe_horizontal_289.setCellWidth(bl_groupe_vertical_290, '50%');
	
	1. Get the variable name -> anInvocation parameters at: 1 (in ex: bl_groupe_vertical_290)
	2. Determine the real variable with the property -> anImporter widgetInVariable: ()
	3. If this variable exist as a Widget (we hope so... but sometimes there are bugs for something we don't currently know), create the attribute and add it to the cellOwner of the variable
	"

	^ (source isInvocation and: [ source attributeName = 'verticalalignment' ])
		ifTrue: [ entity
				ifNil: [ | alignement |
					alignement := CSNLAlignement createAlignementWithHorizontal: source parameters first andVertical: nil.
					self factory model add: alignement.
					^ alignement ]
				ifNotNil: [ entity subWidgets
						do: [ :widget | 
							| alignement |
							alignement := CSNLAlignement createAlignementWithHorizontal: source parameters first andVertical: nil.
							self factory model add: alignement.
							widget position: alignement ].
					^ nil ] ]
		ifFalse: [ ^ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUICWDialog: aCSNDialog [
	^ 'BLDialogBox' = source invokedClassName
		ifTrue: [ | dialog |
			dialog := self createWidget: aCSNDialog.
			dialog parametersAt: #header put: (source parameters at: 1 ifAbsent: [ 'todo' ]).
			source parameters size = 1
				ifTrue: [ dialog
						addAttribute:
							((self create: CSNUIModal)
								attributeValue: 'true';
								yourself) ]
				ifFalse: [ dialog
						addAttribute:
							((self create: CSNUIModal)
								attributeValue: source parameters last;
								yourself) ].
			dialog ]
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUICWHTML: aCSNHTML [
	^ 'HTML' = source invokedClassName
		ifTrue: [ (self createWidget: aCSNHTML)
				addWidget: ((self create: CSNLeaf) text: (source parameters at: 1 ifAbsent: [ '' ]));
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #api }
CSNModelImporterCoreWebVisitor >> visitCSNUICWOpen: aCSOpen [
	^ (source isInvocation and: [ source attributeName = 'open' ]) ifTrue: [ self createAttribute: aCSOpen for: source ] ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUICWProgressBar: aCSNProgressBar [
	^ 'BLProgressBar' = source invokedClassName
		ifTrue: [ (self createWidget: aCSNProgressBar) ]
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUICWRichTextArea: aCSNRichTextArea [
	^ (#('BLRTFWithToolbar') includes: source invokedClassName) 
		ifTrue: [ (self createWidget: aCSNRichTextArea) ] 
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUICWSplitButton: aCSNSplitButton [
	^ 'BLSplitButton' = source invokedClassName
		ifTrue: [ | splitButton |
			splitButton := (self createWidget: aCSNSplitButton)
				parametersAt: #label put: (source parameters at: 1 ifAbsent: [ 'todo' ]);
				yourself.
			(self create: CSNUIModel)
				name: 'model';
				attributeValue: 'items';
				widget: splitButton.
			splitButton ]
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUICWSwitch: aCSNSwitch [
	^ 'BLToggleButton' = source invokedClassName
		ifTrue: [ (self createWidget: aCSNSwitch) ]
		ifFalse: [ nil ]
]

{ #category : #api }
CSNModelImporterCoreWebVisitor >> visitCSNUIDisabled: aCSNUIDisabled [
	^ (source isInvocation and: [ source attributeName = 'enabled' ]) ifTrue: [ self createAttribute: aCSNUIDisabled for: source ] ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUIFieldset: aCSNUIFieldset [
	^ (#('BLFieldSetPanelDynamic' 'BLGroupBoxPanel' 'BLFieldSetPanel') includesAny: (source invokedClass withSuperclassHierarchy collect: #invokedClassName))
		ifTrue: [ | panel |
			panel := (self createWidgetPanel: aCSNUIFieldset)
				addAttribute: ((self create: CSNUITitle) attributeValue: (source parameters at: 1 ifAbsent: [ 'todo' ]));
				yourself.

			((source invokedClass withSuperclassHierarchy collect: #invokedClassName) includes: 'BLFieldSetPanelDynamic')
				ifTrue: [ panel addAttribute: (self create: CSNUICWDynamicFieldset).
					(source parameters at: 2 ifAbsent: [ '' ]) = 'true' ifTrue: [ panel addAttribute: (self create: CSNUICWLightFieldset) ] ].
			((source invokedClass withSuperclassHierarchy collect: #invokedClassName) includes: 'BLGroupBoxPanel') ifTrue: [ panel addAttribute: (self create: CSNUICWGroupFieldset) ].
			^ panel ]
		ifFalse: [ nil ]
]

{ #category : #api }
CSNModelImporterCoreWebVisitor >> visitCSNUIHeight: aCSNUIHeight [
	"because the subclass also need to check before creation, we externalise the condition"

	^ self canBeCSNUIHeight
		ifTrue: [ (self createAttribute: aCSNUIHeight for: source)
				name: 'height';
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUIImage: aCSNUIImage [
	^ (#('BLImage' 'BLImageButton' 'BLDocButton' 'Image') includes: source invokedClassName)
		ifTrue: [ (self createWidget: aCSNUIImage) 
			addAttribute:
			
					((self create: CSNUISrc)
						attributeValue: CSNWebModelJava webSkinRoot
				,
							('BLDocButton' = source invokedClassName
								ifTrue: [ 'images/boutons/bt_aide_fs.gif' ]
								ifFalse: [ ((source parameters at: 1 ifAbsent: [ 'TODO' ]) replaceAllRegex: 'ConfigCSS.getSkinPath\(\).*\+' with: '') trim withoutPrefix: '"' ]));
				yourself ] 
		
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputCheckbox: aCSNUIInputCheckbox [
	^ (#('BLCheckBox' 'CheckBox') includes: source invokedClassName)
		ifTrue: [ (self createWidgetInput: aCSNUIInputCheckbox)
				parametersAt: #type put: 'checkbox';
				addAttribute: ((self create: CSNUILabel) attributeValue: (source parameters at: 1 ifAbsent: [ '' ]));
				parametersAt: #labelPosition put: (source parameters at: 4 ifAbsent: [ '0' ]);
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputColor: aCSNUIInputColor [
	^ ('BLTextBoxColorPicker' = source invokedClassName)
		ifTrue: [ (self createWidgetInput: aCSNUIInputColor)
				parametersAt: #type put: 'color';
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputDate: aCSNUIInputDate [
	^ (#('BLTextBoxDate' 'BLTextBoxDatePicker') includes: source invokedClassName)
		ifTrue: [ (self createWidgetInput: aCSNUIInputDate)
				addAttribute: ((self create: CSNUIPlaceholder) attributeValue: (source parameters at: 1 ifAbsent: [ '' ]));
				parametersAt: #type put: 'date';
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputFile: aCSNUIInputFile [
	^ ('BLFileUpload*|BLImageUploadPanel|BLFileUploadPanelLink' asRegex matchesPrefix: source invokedClassName)
		ifTrue: [ (self createWidgetInput: aCSNUIInputFile)
				parametersAt: #type put: 'file';
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputMonth: aCSNUIInputMonth [
	^ (#('BLTextBoxPeriodePicker' 'BLTextBoxPeriode') includes: source invokedClassName)
		ifTrue: [ (self createWidgetInput: aCSNUIInputMonth)
				parametersAt: #type put: 'month';
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputNumber: aCSNUIInputNumber [
	^ (#('BLTextBoxNumber' 'BLTextBoxAnnee' 'BLTextBoxNumeric' 'BLTextBoxAmount' 'BLTextBoxPercentage') includes: source invokedClassName)
		ifTrue: [ | inputNumber |
			inputNumber := self createWidgetInput: aCSNUIInputNumber.
			inputNumber parametersAt: #type put: 'number'.
			'BLTextBoxAnnee' = source invokedClassName
				ifTrue: [ source parameters
						ifNotEmpty: [ inputNumber
								addAttribute:
									((self create: CSNUIValue)
										attributeValue: (source parameters at: 1);
										yourself) ] ].
			(#('BLTextBoxNumber' 'BLTextBoxAnnee') includes: source invokedClassName)
				ifTrue: [ inputNumber
						addAttribute:
							((self create: CSNAttribute)
								name: 'step';
								attributeValue: '1';
								yourself) ].
			inputNumber ]
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputPassword: aCSNUIInputPassword [
	^ (#('BLPasswordBox' 'PasswordTextBox') includes: source invokedClassName)
		ifTrue: [ (self createWidgetInputText: aCSNUIInputPassword)
				parametersAt: #type put: 'password';
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputRadio: aCSNUIInputRadio [
	^ 'BLRadioButton' = source invokedClassName
		ifTrue: [ (self createWidgetInput: aCSNUIInputRadio)
				parametersAt: #type put: 'radio';
				addAttribute: ((self create: CSNUIName) attributeValue: (source parameters at: 1 ifAbsent: [ 'todo' ]));
				addAttribute: ((self create: CSNUILabel) attributeValue: (source parameters at: 2 ifAbsent: [ 'todo' ]));
				parametersAt: #labelPosition put: (source parameters at: 5 ifAbsent: [ '0' ]);
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputRange: aCSNUIInputRange [
	^ 'BLSliderBar' = source invokedClassName 
		ifTrue: [ self createWidgetInput: aCSNUIInputRange ] 
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputText: aCSNUIInputText [
	^ (#('BLTextBox' 'TextBox' 'BLTextBoxRestricted') includes: source invokedClassName)
		ifTrue: [ (self createWidgetInputText: aCSNUIInputText) ]
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputTime: aCSNUIInputTime [
	^ 'BLTextBoxTime' = source invokedClassName
		ifTrue: [ | inputTime |
			inputTime := (self createWidgetInput: aCSNUIInputTime)
				parametersAt: #type put: 'time';
				yourself.
			source parameters
				ifNotEmpty: [ source parameters size >= 4
						ifTrue: [ inputTime
								addAttribute:
									((self create: CSNUIValue)
										attributeValue:
											(source parameters
												at: 4;
												yourself)) ] ].
			inputTime ]
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUILink: aCSNUILink [
	^ ('BLLinkLabel' = source invokedClassName)
		ifTrue: [ (self createWidget: aCSNUILink) 
			addAttribute:
			((self create: CSNUILabel)
				attributeValue:
					(source parameters ifNotEmpty: [ :parameters | parameters first ] ifEmpty: [ 'todo' ]));
				yourself ] 
		
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUIPanel: aCSNUIPanel [
	^ ('BLImageUploadPanel' ~= source invokedClassName
		and: [ 'BLFileUploadPanel' ~= source invokedClassName
				and: [ (#('FlexTable' 'BLFlexTable' 'BLGrid') includes: source invokedClassName)
						or: [ ('.*Panel' asRegex matchesPrefix: source invokedClassName) ] ] ]) 
		ifTrue: [ (self createWidgetPanel: aCSNUIPanel) ] 
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUIParagraph: aCSNUIParagraph [
	^ (#('BLLabel' 'Label' 'FactoryBLLabel' 'ComponentUtils') includes: source invokedClassName)
		ifTrue: [ | paragraph |
			paragraph := self createWidget: aCSNUIParagraph.
			'ComponentUtils' = source invokedClassName
				ifTrue: [ self attributeFor: paragraph fromComponentUtilsForInvocation: source ]
				ifFalse: [ paragraph
						addAttribute: ((self create: CSNUILabel) attributeValue: (source parameters at: 1 ifAbsent: [ '' ]));
						addAttribute:
							((self create: CSNUIClass)
								attributeValue:
									((source parameters size = 2
										ifTrue: [ ((source parameters at: 2) prefixMatchesRegex: 'BLLabel\..*') ifTrue: [ source parameters at: 2 ] ifFalse: [ 'NIVEAU2' ] ]
										ifFalse: [ source parameters at: 3 ifAbsent: [ 'NIVEAU2' ] ]) removePrefix: 'BLLabel.')) ].
			paragraph ]
		ifFalse: [ nil ]
]

{ #category : #api }
CSNModelImporterCoreWebVisitor >> visitCSNUIRelativeHeight: aCSNUIRelativeHeight [
	"because the subclass also need to check before creation, we externalise the condition"

	^ (self canBeCSNUIHeight and: [ (self getAttributeValueFrom: source) endsWith: '%' ])
		ifTrue: [ | attribute |
			attribute := self visitCSNUIHeight: aCSNUIRelativeHeight.
			attribute attributeValue: (attribute attributeValue removeSuffix: '%').
			attribute ]
		ifFalse: [ nil ]
]

{ #category : #api }
CSNModelImporterCoreWebVisitor >> visitCSNUIRelativeWidth: aCSNUIRelativeWidth [
	"because the subclass also need to check before creation, we externalise the condition"

	^ (self canBeCSNUIWidth and: [ (self getAttributeValueFrom: source) endsWith: '%' ])
		ifTrue: [ | attribute |
			attribute := self visitCSNUIWidth: aCSNUIRelativeWidth.
			attribute attributeValue: (attribute attributeValue removeSuffix: '%').
			attribute ]
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUISelect: aCSNUISelect [
	^ (#('BLListBox' 'ListBox' 'BLMultiCombo') includes: source invokedClassName) 
		ifTrue: [ self createWidgetInput: aCSNUISelect ] 
		ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUITable: aCSNUITable [
	^ (#('BLTableList') includes: source invokedClassName)
		ifTrue: [ self createWidget: aCSNUITable ] ifFalse: [ nil ]
]

{ #category : #visitor }
CSNModelImporterCoreWebVisitor >> visitCSNUITextarea: aCSNUITextarea [
	^ (#('BLTextArea' 'TextArea' 'BLRichTextArea' 'RichTextArea') includes: source invokedClassName)
		ifTrue: [ self createWidget: aCSNUITextarea ] ifFalse: [ nil ]
]

{ #category : #api }
CSNModelImporterCoreWebVisitor >> visitCSNUITitle: aCSNUITitle [
	^ (source isInvocation and: [ source signature beginsWith: 'setTitle' ]) ifTrue: [ self createAttribute: aCSNUITitle for: source ] ifFalse: [ nil ]
]

{ #category : #api }
CSNModelImporterCoreWebVisitor >> visitCSNUIWidth: aCSNUIWidth [
	"because the subclass also need to check before creation, we externalise the condition"

	^ self canBeCSNUIWidth
		ifTrue: [ (self createAttribute: aCSNUIWidth for: source)
				name: 'width';
				yourself ]
		ifFalse: [ nil ]
]
