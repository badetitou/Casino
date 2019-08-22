Class {
	#name : #CSNModelImporterCoreWebVisitor,
	#superclass : #CSNModelImporterVisitor,
	#category : #'Casino-Model-CoreWeb-Importer'
}

{ #category : #'*Casino-Model-CoreWeb-Importer' }
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

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> createWidget: aWidgetClass [
	^ (self create: aWidgetClass)
		realClass: ((#(#FactoryBLLabel #ComponentUtils) includes: source invokedClassName) ifTrue: [ nil ] ifFalse: [ source invokedClass ]);
		addSource: source;
		yourself
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> createWidgetInput: anInputClass [
	^ (self createWidget: anInputClass)
		addAttribute: ((self create: CSNUIValue) attributeValue: (source parameters at: 4 ifAbsent: [ '' ]));
		yourself
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> createWidgetInputText: anInputTextClass [
	^ (self createWidgetInput: anInputTextClass)
		addAttribute: ((self create: CSNUIPlaceholder) attributeValue: (source parameters at: 1 ifAbsent: [ '' ]));
		yourself
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> createWidgetPanel: aWidgetClass [
	| panel |
	panel := self createWidget: aWidgetClass.
	panel layout: (panel mooseModel add: (CSNLLayout newCoreLayoutFor: source)).
	source parameters size >= 2
		ifTrue: [ panel
				addAttribute:
					((self create: CSNUIWidth)
						name: 'width';
						attributeValue: (panel parameters at: 2)) ].
	^ panel
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNAutoComplete: aCSNAutoComplete [
	^ (#('BLDefaultQuickSearch' 'QuicksearchExempleREL') includes: source invokedClassName) 
		ifTrue: [ (self createWidget: aCSNAutoComplete) ] 
		ifFalse: [ nil ]
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNChart: aCSNChart [
	^ ('.*Chart.*' asRegex matchesPrefix: source invokedClassName) 
		ifTrue: [ self createWidget: aCSNChart ] 
		ifFalse: [ nil ]
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNDialog: aCSNDialog [
	^ 'BLDialogBox' = source invokedClassName
		ifTrue: [ | dialog |
			dialog := self createWidget: aCSNDialog.
			dialog parameterAt: #header put: (source parameters at: 1 ifAbsent: [ 'todo' ]).
			source parameters size = 1
				ifTrue: [ dialog
						addAttribute:
							((self create: CSNModal)
								attributeValue: 'true';
								yourself) ]
				ifFalse: [ dialog
						addAttribute:
							((self create: CSNModal)
								attributeValue: source parameters last;
								yourself) ] ]
		ifFalse: [ nil ]
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNHTML: aCSNHTML [
	^ 'HTML' = source invokedClassName
		ifTrue: [ (self createWidget: aCSNHTML)
				addWidget: ((self create: CSNLeaf) text: (source parameters at: 1 ifAbsent: [ '' ]));
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNProgressBar: aCSNProgressBar [
	^ 'BLProgressBar' = source invokedClassName
		ifTrue: [ (self createWidget: aCSNProgressBar) ]
		ifFalse: [ nil ]
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNRichTextArea: aCSNRichTextArea [
	^ (#('BLRTFWithToolbar') includes: source invokedClassName) 
		ifTrue: [ (self createWidget: aCSNRichTextArea) ] 
		ifFalse: [ nil ]
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNSplitButton: aCSNSplitButton [
	^ 'BLSplitButton' = source invokedClassName
		ifTrue: [ | splitButton |
			splitButton := (self createWidget: aCSNSplitButton)
				parametersAt: #label put: (source parameters at: 1 ifAbsent: [ 'todo' ]);
				yourself.
			CSNModel createAttributeFrom: nil for: splitButton.
			splitButton ]
		ifFalse: [ nil ]
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNSwitch: aCSNSwitch [
	^ 'BLToggleButton' = source invokedClassName
		ifTrue: [ (self createWidget: aCSNSwitch) ]
		ifFalse: [ nil ]
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNUIButton: aCSNUIButton [
	^ (#('Button' 'BLLinkButton') includes: source invokedClassName)
		ifTrue: [ (self createWidget: aCSNUIButton) 
			addAttribute: ((self create: CSNUILabel) 
				attributeValue: (source parameters at: 1 ifAbsent: [ '' ]));
				yourself ] ifFalse: [ nil ]
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNUIFieldset: aCSNUIFieldset [
	^ (#('BLFieldSetPanelDynamic' 'BLGroupBoxPanel' 'BLFieldSetPanel') includesAny: (source invokedClass withSuperclassHierarchy collect: #invokedClassName))
		ifTrue: [ | panel |
			panel := (self createWidgetPanel: aCSNUIFieldset)
				addAttribute: ((self create: CSNUITitle) attributeValue: (source parameters at: 1 ifAbsent: [ 'todo' ]));
				yourself.

			((source invokedClass withSuperclassHierarchy collect: #invokedClassName) includes: 'BLFieldSetPanelDynamic')
				ifTrue: [ panel addAttribute: (self create: CSNDynamicFieldset).
					(source parameters at: 2 ifAbsent: [ '' ]) = 'true' ifTrue: [ panel addAttribute: (self create: CSNLightFieldset) ] ].
			((source invokedClass withSuperclassHierarchy collect: #invokedClassName) includes: 'BLGroupBoxPanel') ifTrue: [ panel addAttribute: (self create: CSNGroupFieldset) ].
			^ panel ]
		ifFalse: [ nil ]
]

{ #category : #generated }
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

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputCheckbox: aCSNUIInputCheckbox [
	^ (#('BLCheckBox' 'CheckBox') includes: source invokedClassName)
		ifTrue: [ (self createWidgetInput: aCSNUIInputCheckbox)
				parametersAt: #type put: 'checkbox';
				addAttribute: ((self create: CSNUILabel) attributeValue: (source parameters at: 1 ifAbsent: [ '' ]));
				parametersAt: #labelPosition put: (source parameters at: 4 ifAbsent: [ '0' ]);
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputColor: aCSNUIInputColor [
	^ ('BLTextBoxColorPicker' = source invokedClassName)
		ifTrue: [ (self createWidgetInput: aCSNUIInputColor)
				parametersAt: #type put: 'color';
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputDate: aCSNUIInputDate [
	^ (#('BLTextBoxDate' 'BLTextBoxDatePicker') includes: source invokedClassName)
		ifTrue: [ (self createWidgetInput: aCSNUIInputDate)
				addAttribute: ((self create: CSNUIPlaceholder) attributeValue: (source parameters at: 1 ifAbsent: [ '' ]));
				parametersAt: #type put: 'date';
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputFile: aCSNUIInputFile [
	^ ('BLFileUpload*|BLImageUploadPanel|BLFileUploadPanelLink' asRegex matchesPrefix: source invokedClassName)
		ifTrue: [ (self createWidgetInput: aCSNUIInputFile)
				parametersAt: #type put: 'file';
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputMonth: aCSNUIInputMonth [
	^ (#('BLTextBoxPeriodePicker' 'BLTextBoxPeriode') includes: source invokedClassName)
		ifTrue: [ (self createWidgetInput: aCSNUIInputMonth)
				parametersAt: #type put: 'month';
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #generated }
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

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputPassword: aCSNUIInputPassword [
	^ (#('BLPasswordBox' 'PasswordTextBox') includes: source invokedClassName)
		ifTrue: [ (self createWidgetInputText: aCSNUIInputPassword)
				parametersAt: #type put: 'password';
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #generated }
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

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputRange: aCSNUIInputRange [
	^ 'BLSliderBar' = source invokedClassName 
		ifTrue: [ self createWidgetInput: aCSNUIInputRange ] 
		ifFalse: [ nil ]
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputText: aCSNUIInputText [
	^ (#('BLTextBox' 'TextBox' 'BLTextBoxRestricted') includes: source invokedClassName)
		ifTrue: [ (self createWidgetInputText: aCSNUIInputText) ]
		ifFalse: [ nil ]
]

{ #category : #generated }
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

{ #category : #generated }
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

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNUIPanel: aCSNUIPanel [
	^ ('BLImageUploadPanel' ~= source invokedClassName
		and: [ 'BLFileUploadPanel' ~= source invokedClassName
				and: [ (#('FlexTable' 'BLFlexTable' 'BLGrid') includes: source invokedClassName)
						or: [ ('.*Panel' asRegex matchesPrefix: source invokedClassName) ] ] ]) 
		ifTrue: [ (self createWidgetPanel: aCSNUIPanel) ] 
		ifFalse: [ nil ]
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNUIParagraph: aCSNUIParagraph [
	^ (#('BLLabel' 'Label' 'FactoryBLLabel' 'ComponentUtils') includes: source invokedClassName)
		ifTrue: [ | paragraph |
			paragraph := (self createWidget: aCSNUIParagraph).
			'ComponentUtils' = source invokedClassName
		ifTrue: [ self attributeFor: paragraph fromComponentUtilsForInvocation: source ]
		ifFalse: [ source
				addAttribute: ((self create: CSNUILabel) attributeValue: (source parameters at: 1 ifAbsent: [ '' ])).
			paragraph
				addAttribute:
					((self create: CSNUIClass)
						attributeValue:
							((source parameters size = 2
								ifTrue: [ ((source parameters at: 2) prefixMatchesRegex: 'BLLabel\..*')
										ifTrue: [ source parameters at: 2 ]
										ifFalse: [ 'NIVEAU2' ] ]
								ifFalse: [ source parameters at: 3 ifAbsent: [ 'NIVEAU2' ] ])
								removePrefix: 'BLLabel.')) ].
							paragraph ] ifFalse: [ nil ]
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNUISelect: aCSNUISelect [
	^ (#('BLListBox' 'ListBox' 'BLMultiCombo') includes: source invokedClassName) 
		ifTrue: [ self createWidgetInput: aCSNUISelect ] 
		ifFalse: [ nil ]
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNUITable: aCSNUITable [
	^ (#('BLTableList') includes: source invokedClassName)
		ifTrue: [ self createWidget: aCSNUITable ] ifFalse: [ nil ]
]

{ #category : #generated }
CSNModelImporterCoreWebVisitor >> visitCSNUITextarea: aCSNUITextarea [
	^ (#('BLTextArea' 'TextArea' 'BLRichTextArea' 'RichTextArea') includes: source invokedClassName)
		ifTrue: [ self createWidget: aCSNUITextarea ] ifFalse: [ nil ]
]
