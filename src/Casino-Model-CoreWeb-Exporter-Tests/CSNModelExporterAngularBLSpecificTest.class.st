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

	| result business container |
	business := self createEntity: CSNBusinessPage.
	business layout: (self createEntity: CSNLHorizontalLayout).
	container := self createEntity: CSNContainer.
	business layout addWidget: container.
	container addWidget: (self createEntity: CSNUIButton).
	result := String streamContents: [ :stream | 
		          stream
			          << '<div class="grid">';
			          << String crlf;
			          << '    <div class="col-12">';
			          << String crlf;
			          << '        <bl-button-link>';
			          << String crlf;
			          << '        </bl-button-link>';
			          << String crlf;
			          << '    </div>';
			          << String crlf;
			          << '</div>';
			          << String crlf ].

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
	result := String streamContents: [ :stream | 
		          stream
			          << '<table>';
			          << String crlf;
			          << '    <tbody>';
			          << String crlf;
			          << '        <tr>';
			          << String crlf;
			          << '            <td colspan="2">';
			          << String crlf;
			          << '                <div colspan="2">';
			          << String crlf;
			          << '                </div>';
			          << String crlf;
			          << '            </td>';
			          << String crlf;
			          << '        </tr>';
			          << String crlf;
			          << '    </tbody>';
			          << String crlf;
			          << '</table>' ].

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
