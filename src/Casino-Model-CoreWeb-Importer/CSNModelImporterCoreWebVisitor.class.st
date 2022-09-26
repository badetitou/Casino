"
I'am the visitor for the application of Berger-Levrault
"
Class {
	#name : #CSNModelImporterCoreWebVisitor,
	#superclass : #CSNModelImporterVisitor,
	#category : #'Casino-Model-CoreWeb-Importer-Visitor'
}

{ #category : #private }
CSNModelImporterCoreWebVisitor >> attributeFor: widget fromComponentUtilsForInvocation: anInvocation [

	| firstParam originalLabel |
	"used by CSNUIParagraph when having the form:
	`ComponentUtils.getLibelleItem(""someText"",someparam);`
	""Two possibilities: 
	1. `ComponentUtils.getLibelleItem(""someText"",someparam);`
	1. `ComponentUtils.getLibelleItem(new BLLabel(""Some Text""),someparam);`
	"
	anInvocation parameters at: 1 ifAbsent: [ ^ nil ].
	firstParam := anInvocation parameters at: 1.
	originalLabel := (firstParam trimLeft beginsWith: 'new ')
		                 ifTrue: [ "case: new BLLabel" 
			                 (firstParam substrings: '"')
				                 at: 2
				                 ifAbsent: [ firstParam ] ]
		                 ifFalse: [ "case: direct String" firstParam ].
	widget addAttribute:
		((self create: CSNUILabel) attributeValue: originalLabel
			 , ((anInvocation parameters at: 2 ifAbsent: [ '' ]) = 'true'
					  ifTrue: [ '*' ]
					  ifFalse: [ '' ])
			 , ((anInvocation parameters at: 5 ifAbsent: [ 'true' ]) = 'true'
					  ifTrue: [ ':' ]
					  ifFalse: [ '' ])).
	widget addAttribute: ((self create: CSNUIClass) attributeValue:
			 ((anInvocation parameters at: 3 ifAbsent: [ 'NIVEAU2' ]) 
				  removePrefix: 'BLLabel.'))
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

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNContainer: aCSNContainer [

	"This method is used for the widget without a nice 1-* mapping
	For instance, it deals with the leaf element in the source app that should be mapped to a container"

	^ (self visitTryBLItem: aCSNContainer) ifNil: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNLGridLayout: aCSNLGridLayout [
	^ (#('BLFlexTable' 'FlexTable' 'BLGrid') includesAny: (source invokedClass withSuperclassHierarchy collect: #invokedClassName))
		ifTrue: [ self create: aCSNLGridLayout ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNLHorizontalLayout: aCSNLHorizontalLayout [
	^ (#('HorizontalPanel' 'BLHorizontalPanel') includesAny: (source invokedClass withSuperclassHierarchy collect: #invokedClassName))
		ifTrue: [ self create: aCSNLHorizontalLayout ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNLVerticalLayout: aCSNLHorizontalLayout [
	^ (#('VerticalPanel' 'BLVerticalPanel') includesAny: (source invokedClass withSuperclassHierarchy collect: #invokedClassName))
		ifTrue: [ self create: aCSNLHorizontalLayout ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIAbsoluteHeight: aCSNUIAbsoluteHeight [
	"because the subclass also need to check before creation, we externalise the condition"

	^ (self canBeCSNUIHeight and: [ (self getAttributeValueFrom: source) endsWith: 'px' ])
		ifTrue: [ | attribute |
			attribute := self visitCSNUIHeight: aCSNUIAbsoluteHeight.
			attribute attributeValue: (attribute attributeValue removeSuffix: 'px').
			attribute ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIAbsoluteWidth: aCSNUIAbsoluteWidth [
	"because the subclass also need to check before creation, we externalise the condition"

	^ (self canBeCSNUIWidth and: [ (self getAttributeValueFrom: source) endsWith: 'px' ])
		ifTrue: [ | attribute |
			attribute := self visitCSNUIWidth: aCSNUIAbsoluteWidth.
			attribute attributeValue: (attribute attributeValue removeSuffix: 'px').
			attribute ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIButton: aCSNUIButton [

	^ (#( 'Button' 'BLLinkButton' ) includes: source invokedClassName)
		  ifTrue: [ 
			  | button |
			  button := (self createWidget: aCSNUIButton)
				            addAttribute:
					            ((self create: CSNUILabel) attributeValue:
							             (source parameters at: 1 ifAbsent: [ '' ]));
				            yourself.
			  "if BL"
			  'BLLinkButton' = source invokedClassName ifTrue: [ 
				  button addAttribute: ((self create: CSNUIClass) attributeValue:
						   (((source parameters size >= 2 and: [ 
							      source parameters second beginsWith: 'BLLinkButton.' ])
							     ifTrue: [ source parameters second ]
							     ifFalse: [ 'NIVEAU2' ]) removePrefix: 'BLLinkButton.')) ].
			  button ]
		  ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUICWAccordion: aCSNUICWAccordion [
	^ (#('BLStackPanel')
		includesAny: (source invokedClass withSuperclassHierarchy collect: #invokedClassName))
		ifTrue: [ self createWidget: CSNUICWAccordion ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUICWAutoComplete: aCSNAutoComplete [
	^ (#('BLDefaultQuickSearch' 'QuicksearchExempleREL' 'SuggestBox4QuickSearch')
		includesAny: (source invokedClass withSuperclassHierarchy collect: #invokedClassName))
		ifTrue: [ self createWidget: aCSNAutoComplete ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUICWChart: aCSNChart [
	^ (source invokedClassName includesSubstring: 'Chart') 
		ifTrue: [ self createWidget: aCSNChart ] 
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUICWCoreCellWidth: aCSNCoreCellWidth [
	"bl_groupe_horizontal_289.setCellWidth(bl_groupe_vertical_290, '50%');
	
	1. Get the variable name -> anInvocation parameters at: 1 (in ex: bl_groupe_vertical_290)
	2. Determine the real variable with the property -> anImporter widgetInVariable: ()
	3. If this variable exist as a Widget (we hope so... but sometimes there are bugs for something we don't currently know), create the attribute and add it to the cellOwner of the variable
	"

	^ (source isInvocation and: [ source attributeName = 'cellwidth' ])
		ifTrue: [ (factory importer
				widgetInVariable:
					((source source localVariables select: [ :localVariable | localVariable name = (source parameters at: 1) ])
						ifNotEmpty: [ :correspondingVariable | correspondingVariable first ]
						ifEmpty: [ nil ]))
				ifNotNil: [ :widget | 
					^ (self create: CSNUIWidth)
						name: 'cellwidth';
						attributeValue: (source parameters at: 2);
						widget: widget cellOwner;
						yourself ] ]
		ifFalse: [ ^ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUICWCoreColSpan: aCSNCoreColSpan [
	^ (source isInvocation and: [ source attributeName = 'colspan' ])
		ifTrue: [ (self createAttribute: aCSNCoreColSpan for: source)
				attributeValue: source parameters third;
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
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

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUICWCoreRowSpan: aCSNCoreRowSpan [
	^ (source isInvocation and: [ source attributeName = 'rowspan' ])
		ifTrue: [ (self createAttribute: aCSNCoreRowSpan for: source)
				attributeValue: source parameters third;
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
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

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUICWDialog: aCSNDialog [

	^ (#( 'BLDialogBox' ) includesAny:
		   (source invokedClass withSuperclassHierarchy collect:
			    #invokedClassName))
		  ifTrue: [ 
			  | dialog |
			  dialog := self createWidget: aCSNDialog.
			  dialog addAttribute:
				  ((self create: CSNUICWHeader) attributeValue:
					   (source parameters at: 1 ifAbsent: [ 'todo' ])).
			  source parameters size = 1
				  ifTrue: [ 
					  dialog addAttribute: ((self create: CSNUIModal)
							   attributeValue: 'true';
							   yourself) ]
				  ifFalse: [ 
					  source parameters size ~= 0 ifTrue: [ 
						  dialog addAttribute: ((self create: CSNUIModal)
								   attributeValue: source parameters last;
								   yourself) ] ].
			  dialog ]
		  ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUICWFileUploadPanel: aCSNUICWFileUploadPanel [
	^ (#('AbstractFileUploadPanel') includesAny: (source invokedClass withSuperclassHierarchy collect: #invokedClassName))
		ifTrue: [ self createWidget: aCSNUICWFileUploadPanel ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUICWHTML: aCSNHTML [

	^ (#( 'HTML' 'HTMLPanel' ) includes: source invokedClassName)
		  ifTrue: [ 
			  (self createWidget: aCSNHTML)
				  addWidget: ((self create: CSNLeaf) text:
							   (source parameters at: 1 ifAbsent: [ '' ]));
				  yourself ]
		  ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUICWLinkSimple: aCSNUICWLinkSimple [
	^ (#('BLAbstractLienSimple') includesAny: (source invokedClass withSuperclassHierarchy collect: #invokedClassName))
		ifTrue: [ self createWidget: CSNUICWLinkSimple ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUICWListAndDetails: aCSNUICWListAndDetails [
	^ (#('BLAbstractListeEtDetail') includesAny: (source invokedClass withSuperclassHierarchy collect: #invokedClassName))
		ifTrue: [ self createWidget: aCSNUICWListAndDetails ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUICWMultiCombo: aCSNUICWMultiCombo [
	^ (#('BLMultiCombo') includesAny: (source invokedClass withSuperclassHierarchy collect: #invokedClassName))
		ifTrue: [ self createWidget: aCSNUICWMultiCombo ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUICWOpen: aCSOpen [
	^ (source isInvocation and: [ source attributeName = 'open' ]) ifTrue: [ self createAttribute: aCSOpen for: source ] ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUICWProgressBar: aCSNProgressBar [
	^ 'BLProgressBar' = source invokedClassName
		ifTrue: [ (self createWidget: aCSNProgressBar) ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUICWRechercheEtListe: aCSNUICWRechercheEtListe [
	^ (#('BLAbstractRechercheEtListe') includesAny: (source invokedClass withSuperclassHierarchy collect: #invokedClassName))
		ifTrue: [ self createWidget: aCSNUICWRechercheEtListe ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUICWRichTextArea: aCSNRichTextArea [
	^ (#('BLRTFWithToolbar') includes: source invokedClassName) 
		ifTrue: [ (self createWidget: aCSNRichTextArea) ] 
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUICWSplitButton: aCSNSplitButton [
  ^'BLSplitButton' = source invokedClassName ifTrue: [ | splitButton |
        splitButton := (self createWidget: aCSNSplitButton)
           addAttribute: ((self create: CSNUILabel) attributeValue: (source parameters at: 1 ifAbsent: [ 'todo' ]));
           yourself.
        (self create: CSNUIModelAttribute)
           name: 'model';
           attributeValue: 'items';
           widget: splitButton.
        splitButton ] ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUICWSwitch: aCSNSwitch [
	^ 'BLToggleButton' = source invokedClassName
		ifTrue: [ (self createWidget: aCSNSwitch) ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIDisabled: aCSNUIDisabled [
	^ (source isInvocation and: [ source attributeName = 'enabled' ]) ifTrue: [ self createAttribute: aCSNUIDisabled for: source ] ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIFieldset: aCSNUIFieldset [

	^ (#( 'BLFieldSetPanelDynamic' 'BLGroupBoxPanel' 'BLFieldSetPanel'
	      'BLPortlet' ) includesAny:
		   (source invokedClass withSuperclassHierarchy collect:
			    #invokedClassName))
		  ifTrue: [ 
			  | panel |
			  panel := self createWidgetPanel: aCSNUIFieldset.
			  source parameters at: 1 ifPresent: [ :param | 
				  panel addAttribute: ((self create: CSNUITitle)
						   attributeValue: param;
						   yourself) ].


			  ((source invokedClass withSuperclassHierarchy collect:
				    #invokedClassName) includes: 'BLFieldSetPanelDynamic') 
				  ifTrue: [ 
					  panel addAttribute: (self create: CSNUICWDynamicFieldset).
					  (source parameters at: 2 ifAbsent: [ '' ]) = 'true' ifTrue: [ 
						  panel addAttribute: (self create: CSNUICWLightFieldset) ] ].
			  ((source invokedClass withSuperclassHierarchy collect:
				    #invokedClassName) includes: 'BLGroupBoxPanel') ifTrue: [ 
				  panel addAttribute: (self create: CSNUICWGroupFieldset) ].
			  ^ panel ]
		  ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIHeight: aCSNUIHeight [
	"because the subclass also need to check before creation, we externalise the condition"

	^ self canBeCSNUIHeight
		ifTrue: [ (self createAttribute: aCSNUIHeight for: source)
				name: 'height';
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIImage: aCSNUIImage [
	^ (#('BLImage' 'BLImageButton' 'BLDocButton' 'Image') includes: source invokedClassName)
		ifTrue: [ (self createWidget: aCSNUIImage) 
			addAttribute:
			
					((self create: CSNUISrc)
						attributeValue: self factory importer webSkinRoot
				,
							('BLDocButton' = source invokedClassName
								ifTrue: [ 'images/boutons/bt_aide_fs.gif' ]
								ifFalse: [ ((source parameters at: 1 ifAbsent: [ 'TODO' ]) replaceAllRegex: 'ConfigCSS.getSkinPath\(\).*\+' with: '') trim withoutPrefix: '"' ]));
				yourself ] 
		
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputCheckbox: aCSNUIInputCheckbox [
  ^(#('BLCheckBox' 'CheckBox') includes: source invokedClassName) ifTrue: [ (self createWidgetInput: aCSNUIInputCheckbox)
           addAttribute: ((self create: CSNUILabel) attributeValue: (source parameters at: 1 ifAbsent: [ '' ]));
           addAttribute: ((self create: CSNUICWLabelPosition) attributeValue: (source parameters at: 4 ifAbsent: [ '0' ]));
           yourself ] ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputColor: aCSNUIInputColor [
  ^'BLTextBoxColorPicker' = source invokedClassName ifTrue: [ self createWidgetInput: aCSNUIInputColor ] ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputDate: aCSNUIInputDate [

	^ (#( 'BLTextBoxDate' 'BLTextBoxDatePicker' 'DatePicker' ) includes:
		   source invokedClassName)
		  ifTrue: [ 
			  (self createWidgetInput: aCSNUIInputDate)
				  addAttribute: ((self create: CSNUIPlaceholder) attributeValue:
							   (source parameters at: 1 ifAbsent: [ '' ]));
				  yourself ]
		  ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputEmail: aCSNUIInputEmail [
	^ nil
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputFile: aCSNUIInputFile [
  ^('BLFileUpload*|BLImageUploadPanel|BLFileUploadPanelLink|FileUpload' asRegex matchesPrefix: source invokedClassName) ifTrue: [ self createWidgetInput: aCSNUIInputFile ] ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputMonth: aCSNUIInputMonth [
  ^(#('BLTextBoxPeriodePicker' 'BLTextBoxPeriode') includes: source invokedClassName) ifTrue: [ self createWidgetInput: aCSNUIInputMonth ] ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputNumber: aCSNUIInputNumber [
	^ (#('BLTextBoxNumber' 'BLTextBoxAnnee' 'BLTextBoxNumeric' 'BLTextBoxAmount' 'BLTextBoxPercentage') includes: source invokedClassName)
		ifTrue: [ | inputNumber |
			inputNumber := self createWidgetInput: aCSNUIInputNumber.
			inputNumber addAttribute: ((self create: CSNUIPlaceholder) attributeValue: (source parameters at: 1 ifAbsent: [ '' ])).
			"'BLTextBoxAnnee' = source invokedClassName
				ifTrue: [ source parameters
						ifNotEmpty: [ inputNumber
								addAttribute:
									((self create: CSNUIValue)
										attributeValue: (source parameters at: 1);
										yourself) ] ]."
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

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputPassword: aCSNUIInputPassword [
  ^(#('BLPasswordBox' 'PasswordTextBox') includes: source invokedClassName) ifTrue: [ self createWidgetInputText: aCSNUIInputPassword ] ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputRadio: aCSNUIInputRadio [
  ^(#('BLRadioButton' 'RadioButton') includes: source invokedClassName) ifTrue: [ (self createWidgetInput: aCSNUIInputRadio)
           addAttribute: ((self create: CSNUIName) attributeValue: (source parameters at: 1 ifAbsent: [ 'todo' ]));
           addAttribute: ((self create: CSNUILabel) attributeValue: (source parameters at: 2 ifAbsent: [ 'todo' ]));
           addAttribute: ((self create: CSNUICWLabelPosition) attributeValue: (source parameters at: 5 ifAbsent: [ '0' ]));
           yourself ] ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputRange: aCSNUIInputRange [
	^ 'BLSliderBar' = source invokedClassName 
		ifTrue: [ self createWidgetInput: aCSNUIInputRange ] 
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputText: aCSNUIInputText [
	^ (#('BLTextBox' 'TextBox' 'BLTextBoxRestricted') includes: source invokedClassName)
		ifTrue: [ (self createWidgetInputText: aCSNUIInputText) ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIInputTime: aCSNUIInputTime [

	^ 'BLTextBoxTime' = source invokedClassName
		  ifTrue: [ 
			  | inputTime |
			  inputTime := (self createWidgetInput: aCSNUIInputTime) yourself.
			  source parameters ifNotEmpty: [ 
				  source parameters size >= 4 ifTrue: [ inputTime addAttribute: ((self create: CSNUIValue) attributeValue: (source parameters at: 4)) ] ].
			  inputTime ]
		  ifFalse: [ nil ]
]

{ #category : #visiting }
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

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIMaxlength: aCSNUIMaxlength [
	^ (source isInvocation and: [ source signature beginsWith: 'setMaxLength' ]) ifTrue: [ self createAttribute: aCSNUIMaxlength for: source ] ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIPanel: aCSNUIPanel [

	^ ('BLImageUploadPanel' ~= source invokedClassName and: [ 
		   'BLFileUploadPanel' ~= source invokedClassName and: [ 
			   'TabSubPanel' ~= source invokedClassName and: [ 
				   (#( 'FlexTable' 'BLFlexTable' 'BLGrid' 'Grid' ) includesAny:
					    (source invokedClass withSuperclassHierarchy collect:
						     #invokedClassName)) or: [ 
					   source invokedClassName endsWith: 'Panel' ] ] ] ])
		  ifTrue: [ self createWidgetPanel: aCSNUIPanel ]
		  ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIParagraph: aCSNUIParagraph [

	^ (#( 'BLLabel' 'Label' 'FactoryBLLabel' 'ComponentUtils'
	      'InlineLabel' 'BLLabelItem' 'BLTextInputItem' 'BLLabelDate'
	      'BLLabelBoolean' ) includes: source invokedClassName)
		  ifTrue: [ 
			  | paragraph |
			  paragraph := self createWidget: aCSNUIParagraph.
			  'ComponentUtils' = source invokedClassName
				  ifTrue: [ 
					  self
						  attributeFor: paragraph
						  fromComponentUtilsForInvocation: source ]
				  ifFalse: [ 
					  paragraph
						  addAttribute: ((self create: CSNUILabel) attributeValue:
									   (source parameters at: 1 ifAbsent: [ '' ]));
						  addAttribute: ((self create: CSNUIClass) attributeValue:
									   ((source parameters size = 2
										     ifTrue: [ 
											     ((source parameters at: 2) prefixMatchesRegex:
													      'BLLabel\..*')
												     ifTrue: [ source parameters at: 2 ]
												     ifFalse: [ 'NIVEAU2' ] ]
										     ifFalse: [ 
											     source parameters at: 3 ifAbsent: [ 'NIVEAU2' ] ]) 
										    removePrefix: 'BLLabel.')) ].
			  paragraph ]
		  ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIPlaceholder: aCSNUIPlaceholder [

	^ (source isInvocation and: [ 
		   source signature beginsWith: 'setHelperText' ])
		  ifTrue: [ self createAttribute: aCSNUIPlaceholder for: source ]
		  ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIRelativeHeight: aCSNUIRelativeHeight [
	"because the subclass also need to check before creation, we externalise the condition"

	^ (self canBeCSNUIHeight and: [ (self getAttributeValueFrom: source) endsWith: '%' ])
		ifTrue: [ | attribute |
			attribute := self visitCSNUIHeight: aCSNUIRelativeHeight.
			attribute attributeValue: (attribute attributeValue removeSuffix: '%').
			attribute ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIRelativeWidth: aCSNUIRelativeWidth [
	"because the subclass also need to check before creation, we externalise the condition"

	^ (self canBeCSNUIWidth and: [ (self getAttributeValueFrom: source) endsWith: '%' ])
		ifTrue: [ | attribute |
			attribute := self visitCSNUIWidth: aCSNUIRelativeWidth.
			attribute attributeValue: (attribute attributeValue removeSuffix: '%').
			attribute ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUISelect: aCSNUISelect [
	^ (#('BLListBox' 'ListBox' 'BLMultiCombo') includes: source invokedClassName) 
		ifTrue: [ self createWidgetInput: aCSNUISelect ] 
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUISize: aCSNUISize [
	^ (source isInvocation and: [ source signature beginsWith: 'setSize' ])
		ifTrue: [ source parameters size = 2
				ifTrue: [ "width"
					(self create: CSNUIWidth)
						source: source;
						name: 'width';
						attributeValue: source parameters first;
						widget: entity.
					"height"
					^ (self create: CSNUIHeight)
						source: source;
						name: 'height';
						attributeValue: source parameters second;
						widget: entity;
						yourself ].
			^ self createAttribute: aCSNUISize for: source ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUITabManager: aCSNUITabManager [
	^ ('TabSubPanel' = source invokedClassName) 
		ifTrue: [ (self createWidget: aCSNUITabManager) ] 
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUITable: aCSNUITable [

	^ (#( 'BLTableList' 'BLTableListBulk' 'BLTableListCategorized' ) 
		   includes: source invokedClassName)
		  ifTrue: [ self createWidget: aCSNUITable ]
		  ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUITextarea: aCSNUITextarea [
	^ (#('BLTextArea' 'TextArea' 'BLRichTextArea' 'RichTextArea') includes: source invokedClassName)
		ifTrue: [ self createWidget: aCSNUITextarea ] ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUITitle: aCSNUITitle [
	^ (source isInvocation and: [ source signature beginsWith: 'setTitle' ]) ifTrue: [ self createAttribute: aCSNUITitle for: source ] ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterCoreWebVisitor >> visitCSNUIWidth: aCSNUIWidth [
	"because the subclass also need to check before creation, we externalise the condition"

	^ self canBeCSNUIWidth
		ifTrue: [ (self createAttribute: aCSNUIWidth for: source)
				name: 'width';
				yourself ]
		ifFalse: [ nil ]
]

{ #category : #'visiting - leaf-container' }
CSNModelImporterCoreWebVisitor >> visitTryBLItem: aCSNContainer [

	^ 'BLItem' = source invokedClassName
		  ifTrue: [ 
			  | container paragraph |
			  container := self createWidget: CSNContainer.
			  paragraph := self createWidget: CSNUIParagraph.
			  container addWidget: paragraph.
			  paragraph addAttribute:
				  ((self create: CSNUILabel) attributeValue:
					   (source parameters at: 1 ifAbsent: [ '' ]) , ' : ').
			  ^ container ]
		  ifFalse: [ ^ nil ]
]
