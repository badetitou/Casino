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
			          << '<form [formGroup]="aPageForm">';
			          << String crlf;
			          << '    <div class="row">';
			          << String crlf;
			          << '        <div class="col">';
			          << String crlf;
			          << '            <bl-button-link>';
			          << String crlf;
			          << '            </bl-button-link>';
			          << String crlf;
			          << '        </div>';
			          << String crlf;
			          << '    </div>';
			          << String crlf;
			          << '</form>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter generateHTMLSourceCodeForBusinessPage: business.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLSpecificTest >> testExportCheckBox [
	| result checkbox |
	checkbox := self createEntity: CSNUIInputCheckbox.
	
	result := String streamContents: [ :stream | 
		          stream
			          << '<bl-checkbox>';
			          << String crlf;
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
			          << String crlf;
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
			          << String crlf;
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
			          << String crlf;
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
			          << String crlf;
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
	result := result := String crlf join: { 
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
			          << String crlf;
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
			          << String crlf;
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
			          << String crlf;
			          << '</div>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIPanel: CSNUIPanel new.
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
			          << String crlf;
			          << '    label';
			          << String crlf;
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
			          << String crlf;
			          << '    label';
			          << String crlf;
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
			          << String crlf;
			          << '    <span slot="bl-table-foot">';
			          << String crlf;
			          <<
				          '        <div class="row" style="float: right; margin-right: 1em;">';
			          << String crlf;
			          << String crlf;
			          << '        </div>';
			          << String crlf;
			          << '    </span>';
			          << String crlf;
			          << '</bl-table>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUITable: table.
		self assert: exporter currentWriteStream contents equals: result ]
]
