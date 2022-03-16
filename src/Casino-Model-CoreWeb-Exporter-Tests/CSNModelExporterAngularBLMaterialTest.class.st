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
CSNModelExporterAngularBLMaterialTest >> testExportExtendedLinkWithTwoActions [

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
			          <<
				          '<span class="fa-stack fa-2xs" style="vertical-align: top; float: right;" (click)="openPhase(Page2)">';
			          << String crlf;
			          << '    <i class="fa-regular fa-circle fa-stack-2x"></i>';
			          << String crlf;
			          << '    <i class="fa-solid fa-file fa-stack-1x"></i>';
			          << String crlf;
			          << '</span>';
			          << String crlf;
			          << '<bl-hyperlink (click)="openPhase(Page)" >';
			          << String crlf;
			          << '</bl-hyperlink>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUILink: link.
		self assert: exporter currentWriteStream contents equals: result ]
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

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportLinkWithAction [

	| result link |
	link := self createEntity: CSNUICWExtendedLink.
	link addAction: ((self createEntity: CSNActionAppel) call:
			 ((self createEntity: CSNPage)
				  name: 'Page';
				  yourself)).

	result := String streamContents: [ :stream | 
		          stream
			          << '<bl-hyperlink (click)="openPhase(Page)">';
			          << String crlf;
			          << '</bl-hyperlink>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUILink: link.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportSelect [

	| result select |
	select := self createEntity: CSNUISelect.

	result := String streamContents: [ :stream | 
		          stream
			          << '<mat-form-field appearance="fill">';
			          << String crlf;
			          << '    <mat-select>';
			          << String crlf;
			          << '    </mat-select>';
			          << String crlf;
			          << '</mat-form-field>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUISelect: select.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportSelectWithLabel [

	| result select label |
	select := self createEntity: CSNUISelect.
	label := self createEntity: CSNUILabel.
	label attributeValue: 'label'.
	select addAttribute: label.

	result := String streamContents: [ :stream | 
		          stream
			          << '<mat-form-field appearance="fill">';
			          << String crlf;
			          << '    <mat-label>label</mat-label>';
			          << String crlf;
			          << '    <mat-select>';
			          << String crlf;
			          << '    </mat-select>';
			          << String crlf;
			          << '</mat-form-field>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUISelect: select.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportTable [

	| result table |
	table := self createEntity: CSNUITable.
	table
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'table';
				 yourself);
		name: 'table';
		yourself.

	result := String streamContents: [ :stream | 
		          stream
			          <<
				          '<table [dataSource]="tableSource" id="table" mat-table mat-sort #table>';
			          << String crlf;
			          <<
				          '    <tr mat-header-row *matHeaderRowDef="tableDisplayedColumns"></tr>';
			          << String crlf;
			          <<
				          '    <tr mat-row *matRowDef="let row; columns: tableDisplayedColumns;"></tr>';
			          << String crlf;
			          << '</table>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUITable: table.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportTableWithOneHeader [

	| result table header1 label1 |
	table := self createEntity: CSNUITable.

	table
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'table';
				 yourself);
		name: 'table';
		yourself.

	header1 := self createEntity: CSNUITableHeader.
	label1 := (self createEntity: CSNUILabel)
		          attributeValue: 'Label1';
		          yourself.
	header1 addAttribute: label1.
	table addWidget: header1.

	result := String streamContents: [ :stream | 
		          stream
			          <<
				          '<table [dataSource]="tableSource" id="table" mat-table mat-sort #table>';
			          << String crlf;
			          << '    <ng-container matColumnDef="Label1">';
			          << String crlf;
			          <<
				          '        <th mat-header-cell *matHeaderCellDef>Label1</th>';
			          << String crlf;
			          <<
				          '        <td mat-cell *matCellDef="let element">{{element}}</td>';
			          << String crlf;
			          << '    </ng-container>';
			          << String crlf;
			          << String crlf;
			          <<
				          '    <tr mat-header-row *matHeaderRowDef="tableDisplayedColumns"></tr>';
			          << String crlf;
			          <<
				          '    <tr mat-row *matRowDef="let row; columns: tableDisplayedColumns;"></tr>';
			          << String crlf;
			          << '</table>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUITable: table.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportTableWithTwoHeaders [

	| result table header1 label1 header2 label2 |
	table := self createEntity: CSNUITable.

	table
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'table';
				 yourself);
		name: 'table';
		yourself.

	header1 := self createEntity: CSNUITableHeader.
	header2 := self createEntity: CSNUITableHeader.
	label1 := (self createEntity: CSNUILabel)
		          attributeValue: 'Label1';
		          yourself.
	label2 := (self createEntity: CSNUILabel)
		          attributeValue: 'Label2';
		          yourself.
	header1 addAttribute: label1.
	header2 addAttribute: label2.
	table addWidget: header1.
	table addWidget: header2.

	result := String streamContents: [ :stream | 
		          stream
			          <<
				          '<table [dataSource]="tableSource" id="table" mat-table mat-sort #table>';
			          << String crlf;
			          << '    <ng-container matColumnDef="Label1">';
			          << String crlf;
			          <<
				          '        <th mat-header-cell *matHeaderCellDef>Label1</th>';
			          << String crlf;
			          <<
				          '        <td mat-cell *matCellDef="let element">{{element}}</td>';
			          << String crlf;
			          << '    </ng-container>';
			          << String crlf;
			          << String crlf;
			          << '    <ng-container matColumnDef="Label2">';
			          << String crlf;
			          <<
				          '        <th mat-header-cell *matHeaderCellDef>Label2</th>';
			          << String crlf;
			          <<
				          '        <td mat-cell *matCellDef="let element">{{element}}</td>';
			          << String crlf;
			          << '    </ng-container>';
			          << String crlf;
			          << String crlf;
			          <<
				          '    <tr mat-header-row *matHeaderRowDef="tableDisplayedColumns"></tr>';
			          << String crlf;
			          <<
				          '    <tr mat-row *matRowDef="let row; columns: tableDisplayedColumns;"></tr>';
			          << String crlf;
			          << '</table>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUITable: table.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportTypeScriptVariableOfTableWithTwoHeaders [

	| result table header1 label1 header2 label2 |
	table := self createEntity: CSNUITable.

	table
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'table';
				 yourself);
		name: 'table';
		yourself.

	header1 := self createEntity: CSNUITableHeader.
	header2 := self createEntity: CSNUITableHeader.
	label1 := (self createEntity: CSNUILabel)
		          attributeValue: 'Label1';
		          yourself.
	label2 := (self createEntity: CSNUILabel)
		          attributeValue: 'Label2';
		          yourself.
	header1 addAttribute: label1.
	header2 addAttribute: label2.
	table addWidget: header1.
	table addWidget: header2.

	result := String streamContents: [ :stream | 
		          stream
			          << 'tableSource = [];';
			          << String crlf;
			          <<
				          'tableDisplayedColumns : string[] = [ ''Label1'', ''Label2'' ]';
			          << String crlf ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		MCTable new
			exportTypeScriptVariableOf: table
			usingExporter: exporter.
		self assert: exporter currentWriteStream contents equals: result ]
]
