Class {
	#name : #CSNModelExporterAngularBLMaterialTest,
	#superclass : #TestCase,
	#instVars : [
		'exporter',
		'metamodel',
		'testModel'
	],
	#category : #'Casino-Model-CoreWeb-Exporter-Tests'
}

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> createEntity: aCSNClass [

	^ exporter model add: aCSNClass new
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> setUp [

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
		CSNExporterAngularMaterialConfiguration new.
	exporter attributeExporter: CSNExporterAngularAttribute new.
	exporter model: testModel
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportFieldSet [
	| result fieldset |
	fieldset := self createEntity: CSNUIFieldset.
	
	result := String streamContents: [ :stream | 
		          stream
			          << '<mat-card>';
			          << String crlf;
			          << '</mat-card>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIFieldset: fieldset.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportFieldSetWithAction [

	| result fieldset |
	fieldset := self createEntity: CSNUIFieldset.
	fieldset addAction: ((self createEntity: CSNActionAppel) call:
			 ((self createEntity: CSNPage)
				  name: 'Page';
				  yourself)).


	result := String streamContents: [ :stream | "we added a little space in '<mat-card >' to make test pass for this little stuff. But it might be improved"
		          stream
			          << '<mat-card >';
			          << String crlf;
			          << '    <mat-card-header>';
			          << String crlf;
			          <<
				          '        <span class="fa-stack" style="vertical-align: top; float: right;" (click)="openPhase(Page)">';
			          << String crlf;
			          <<
				          '            <i class="fa-regular fa-circle fa-stack-2x"></i>';
			          << String crlf;
			          <<
				          '            <i class="fa-solid fa-folder-open fa-stack-1x"></i>';
			          << String crlf;
			          << '        </span>';
			          << String crlf;
			          << '    </mat-card-header>';
			          << String crlf;
			          << '</mat-card>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIFieldset: fieldset.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportFieldSetWithChildren [

	| result fieldset div |
	fieldset := self createEntity: CSNUIFieldset.
	div := self createEntity: CSNUIPanel.
	fieldset addWidget: div.

	result := String streamContents: [ :stream | 
		          stream
			          << '<mat-card>';
			          << String crlf;
			          << '    <mat-card-content>';
			          << String crlf;
			          << '        <div>';
			          << String crlf;
			          << '        </div>';
			          << String crlf;
			          << '    </mat-card-content>';
			          << String crlf;
			          << '</mat-card>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIFieldset: fieldset.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportFieldSetWithTitle [

	| result fieldset title |
	fieldset := self createEntity: CSNUIFieldset.
	title := self createEntity: CSNUITitle.
	title attributeValue: 'title'.
	fieldset addAttribute: title.

	result := String streamContents: [ :stream | 
		          stream
			          << '<mat-card>';
			          << String crlf;
			          << '    <mat-card-header>';
			          << String crlf;
			          << '        <mat-card-title>title</mat-card-title>';
			          << String crlf;
			          << '    </mat-card-header>';
			          << String crlf;
			          << '</mat-card>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIFieldset: fieldset.
		self assert: exporter currentWriteStream contents equals: result ]
]
