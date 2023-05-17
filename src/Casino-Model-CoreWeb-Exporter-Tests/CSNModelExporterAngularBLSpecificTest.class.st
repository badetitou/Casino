Class {
	#name : #CSNModelExporterAngularBLSpecificTest,
	#superclass : #TestCase,
	#instVars : [
		'exporter',
		'metamodel',
		'testModel'
	],
	#category : #'Casino-Model-CoreWeb-Exporter-Tests'
}

{ #category : #running }
CSNModelExporterAngularBLSpecificTest >> createEntity: aCSNClass [

	^ exporter model add: aCSNClass new
]

{ #category : #running }
CSNModelExporterAngularBLSpecificTest >> setUp [

	super setUp.
	metamodel := FMMetaModelBuilder metamodelFromPackages:
		             CSNBModel packagesToProcessToCreateMetamodel
		             , CRFModel packagesToProcessToCreateMetamodel
		             , CSNBuModel packagesToProcessToCreateMetamodel.
	testModel := CSNUICWModel new
		             name: 'evol';
		             yourself.
	testModel metamodel: metamodel.
	exporter := CSNModelExporterAngularBLSpecific new.
	exporter exporterAngularConfiguration:
		CSNExporterAngularCoreWeb2Configuration new.
	exporter attributeExporter: CSNExporterAngularAttribute new.
	exporter model: testModel
]

{ #category : #running }
CSNModelExporterAngularBLSpecificTest >> testExportBusinessPageWithLayoutAndWidget [

	| result business container page |
	page := self createEntity: CSNPage.
	business := self createEntity: CSNBusinessPage.
	page addBusinessPage: business.
	business name: 'aPage'.
	business layout: (self createEntity: CSNLHorizontalLayout).
	container := self createEntity: CSNContainer.
	business layout addWidget: container.
	container addWidget: (self createEntity: CSNUIButton).
	result := String streamContents: [ :stream | 
		          stream
			          << '<div class="row">';
			          << OSPlatform current lineEnding;
			          << '    <div class="col">';
			          << OSPlatform current lineEnding;
			          << '        <bl-button-link>';
			          << OSPlatform current lineEnding;
			          << '        </bl-button-link>';
			          << OSPlatform current lineEnding;
			          << '    </div>';
			          << OSPlatform current lineEnding;
			          << '</div>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		business accept: exporter.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLSpecificTest >> testExportCheckBox [
	| result checkbox |
	checkbox := self createEntity: CSNUIInputCheckbox.
	
	result := String streamContents: [ :stream | 
		          stream
			          << '<bl-checkbox>';
			          << OSPlatform current lineEnding;
			          << '</bl-checkbox>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIInputCheckbox: checkbox.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLSpecificTest >> testExportCheckBoxWithLabel [

	| result checkbox |
	checkbox := self createEntity: CSNUIInputCheckbox.
	checkbox addAttribute: ((self createEntity: CSNUILabel)
			 attributeValue: 'My Checkbox';
			 yourself).
	result := String streamContents: [ :stream | 
		          stream
			          << '<bl-checkbox label="My Checkbox">';
			          << OSPlatform current lineEnding;
			          << '</bl-checkbox>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIInputCheckbox: checkbox.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLSpecificTest >> testExportExtendedLinkWithTwoActions [

	| result link action2 |
	link := self createEntity: CSNUICWExtendedLink.
	link addAction: ((self createEntity: CSNActionAppel) call:
			 ((self createEntity: CSNPage)
				  name: 'Page';
				  yourself)).
	action2 := (self createEntity: CSNActionAppel) call:
		            ((self createEntity: CSNPage)
			             name: 'Page2';
			             yourself).
	link addAction: action2.
	link addAdditionalAction: action2.


	result := String streamContents: [ :stream | 
		          stream
			          << '<bl-extended-link [secondLink]="true" (clickMainLink)="openPhase(Page)" (clickSecondLink)="openPhase(Page2)">';
			          << OSPlatform current lineEnding;
			          << '</bl-extended-link>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUILink: link.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLSpecificTest >> testExportFieldSet [
	| result fieldset |
	fieldset := self createEntity: CSNUIFieldset.
	
	result := String streamContents: [ :stream | 
		          stream
			          << '<bl-fieldset>';
			          << OSPlatform current lineEnding;
			          << '</bl-fieldset>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIFieldset: fieldset.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLSpecificTest >> testExportFieldSetWithAction [

	| result fieldset |
	fieldset := self createEntity: CSNUIFieldset.
	fieldset addAction: ((self createEntity: CSNActionAppel) call:
			 ((self createEntity: CSNPage)
				  name: 'Page';
				  yourself)).

	result := String streamContents: [ :stream | 
		          stream
			          << '<bl-fieldset [withDetails]="true" (moreDetails)="openPhase(Page)">';
			          << OSPlatform current lineEnding;
			          << '</bl-fieldset>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIFieldset: fieldset.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLSpecificTest >> testExportGirdBagWithCellsWithColSpan [

	| result panel grid cell innerPanel |
	panel := self createEntity: CSNUIPanel.
	grid := self createEntity: CSNLGridLayout.
	panel layout: grid.
	cell := self createEntity: CSNLCell.
	cell addAttribute: ((self createEntity: CSNUICWCoreColSpan)
			 attributeValue: 2;
			 yourself).
	innerPanel := self createEntity: CSNUIPanel.
	cell widget: innerPanel.
	grid addCell: cell.
	(grid attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ])
		at: cell
		put: #( 0 0 ).
	result := result := OSPlatform current lineEnding join: { 
	'<div>'.
	'    <div class="row">'.
	'        <div class="col">'.
	'        </div>'.
	'    </div>'.
	'</div>' }.

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIPanel: panel.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLSpecificTest >> testExportLightFieldSet [
	| result fieldset |
	fieldset := self createEntity: CSNUIFieldset.
	fieldset addAttribute: (self createEntity: CSNUICWLightFieldset).
	
	result := String streamContents: [ :stream | 
		          stream
			          << '<bl-fieldset light="true">';
			          << OSPlatform current lineEnding;
			          << '</bl-fieldset>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIFieldset: fieldset.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLSpecificTest >> testExportLinkWithAction [

	| result link |
	link := self createEntity: CSNUILink.
	link addAction: ((self createEntity: CSNActionAppel) call:
			 ((self createEntity: CSNPage)
				  name: 'Page';
				  yourself)).

	result := String streamContents: [ :stream | 
		          stream
			          << '<bl-simple-link (click)="openPhase(Page)">';
			          << OSPlatform current lineEnding;
			          << '</bl-simple-link>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUILink: link.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLSpecificTest >> testExportPanel [

	| result |
	result := String streamContents: [ :stream | 
		          stream
			          << '<div>';
			          << OSPlatform current lineEnding;
			          << '</div>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIPanel: CSNUIPanel new.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLSpecificTest >> testExportPanelWithLabel [

	| result panel label |
	panel := self createEntity: CSNUIPanel.
	label := self createEntity: CSNUILabel.
	label attributeValue: 'label'.
	panel addAttribute: label.

	result := String streamContents: [ :stream | 
		          stream
			          << '<div>';
			          << OSPlatform current lineEnding;
			          << '    label';
			          << OSPlatform current lineEnding;
			          << '</div>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIPanel: panel.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLSpecificTest >> testExportParagraph [
	| result paragraph |
	paragraph := self createEntity: CSNUIParagraph.
	
	result := String streamContents: [ :stream | 
		          stream
			          << '<p></p>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIParagraph: paragraph.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLSpecificTest >> testExportParagraphWithLabel [

	| result paragraph label |
	paragraph := self createEntity: CSNUIParagraph.
	label := self createEntity: CSNUILabel.
	label attributeValue: 'label'.
	paragraph addAttribute: label.

	result := String streamContents: [ :stream | 
		          stream
			          << '<p>';
			          << OSPlatform current lineEnding;
			          << '    label';
			          << OSPlatform current lineEnding;
			          << '</p>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIParagraph: paragraph.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLSpecificTest >> testExportParagraphWithLabelAndBoldStyle [

	| result paragraph label boldStyle |
	paragraph := self createEntity: CSNUIParagraph.
	label := self createEntity: CSNUILabel.
	label attributeValue: 'label'.
	paragraph addAttribute: label.
	boldStyle := self createEntity: CSNUIStyle.
	boldStyle styleAttribute: 'font-weight'.
	boldStyle attributeValue: 'bold'.
	paragraph addAttribute: boldStyle.

	result := String streamContents: [ :stream | 
		          stream
			          << '<p style="font-weight: bold;">';
			          << OSPlatform current lineEnding;
			          << '    label';
			          << OSPlatform current lineEnding;
			          << '</p>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIParagraph: paragraph.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLSpecificTest >> testExportTable [

	| result table |
	table := self createEntity: CSNUITable.

	result := String streamContents: [ :stream | 
		          stream
			          << '<bl-table>';
			          << OSPlatform current lineEnding;
			          << '    <span slot="bl-table-foot">';
			          << OSPlatform current lineEnding;
			          <<
				          '        <div class="row" style="float: right; margin-right: 1em;">';
			          << OSPlatform current lineEnding;
			          << OSPlatform current lineEnding;
			          << '        </div>';
			          << OSPlatform current lineEnding;
			          << '    </span>';
			          << OSPlatform current lineEnding;
			          << '</bl-table>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUITable: table.
		self assert: exporter currentWriteStream contents equals: result ]
]
