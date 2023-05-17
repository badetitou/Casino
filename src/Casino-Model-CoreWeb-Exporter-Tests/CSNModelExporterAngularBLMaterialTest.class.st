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

{ #category : #'as yet unclassified' }
CSNModelExporterAngularBLMaterialTest >> testExportBorderLayout [

	| result panel borderLayout cell innerPanel |
	panel := self createEntity: CSNUIPanel.
	borderLayout := self createEntity: CSNLBorderLayout.
	panel layout: borderLayout.
	cell := self createEntity: CSNLCell.
	innerPanel := self createEntity: CSNUIPanel.
	cell widget: innerPanel.
	borderLayout addCell: cell.
	result := String streamContents: [ :stream | 
		          stream
			          << '<table>';
			          << OSPlatform current lineEnding;
			          << '    <tbody>';
			          << OSPlatform current lineEnding;
			          << '        <tr>';
			          << OSPlatform current lineEnding;
			          << '            <td>';
			          << OSPlatform current lineEnding;
			          << '                <div>';
			          << OSPlatform current lineEnding;
			          << '                </div>';
			          << OSPlatform current lineEnding;
			          << '            </td>';
			          << OSPlatform current lineEnding;
			          << '        </tr>';
			          << OSPlatform current lineEnding;
			          << '    </tbody>';
			          << OSPlatform current lineEnding;
			          << '</table>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIPanel: panel.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #'as yet unclassified' }
CSNModelExporterAngularBLMaterialTest >> testExportBorderLayoutWithFourthLevel [

	| result panel borderLayout cell unknowInnerPanel cellNorth northInnerPanel cellSouth southInnerPanel cellCenter centerInnerPanel |
	panel := self createEntity: CSNUIPanel.
	borderLayout := self createEntity: CSNLBorderLayout.
	panel layout: borderLayout.

	cell := self createEntity: CSNLCell.
	unknowInnerPanel := self createEntity: CSNUIPanel.
	cell widget: unknowInnerPanel.
	unknowInnerPanel
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'unknow';
				 yourself);
		name: 'unknow';
		yourself.

	cellNorth := self createEntity: CSNLCell.
	northInnerPanel := self createEntity: CSNUIPanel.
	cellNorth widget: northInnerPanel.
	cellNorth position: (self createEntity: CSNLNorthAlignement).
	northInnerPanel
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'north';
				 yourself);
		name: 'north';
		yourself.

	cellCenter := self createEntity: CSNLCell.
	centerInnerPanel := self createEntity: CSNUIPanel.
	cellCenter widget: centerInnerPanel.
	cellCenter position: (self createEntity: CSNLCenterAlignement).
	centerInnerPanel
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'center';
				 yourself);
		name: 'center';
		yourself.

	cellSouth := self createEntity: CSNLCell.
	southInnerPanel := self createEntity: CSNUIPanel.
	cellSouth widget: southInnerPanel.
	cellSouth position: (self createEntity: CSNLSouthAlignement).
	southInnerPanel
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'south';
				 yourself);
		name: 'south';
		yourself.


	borderLayout addCell: cell.
	borderLayout addCell: cellNorth.
	borderLayout addCell: cellCenter.
	borderLayout addCell: cellSouth.


	result := String streamContents: [ :stream | 
		          stream
			          << '<table>';
			          << OSPlatform current lineEnding;
			          << '    <tbody>';
			          << OSPlatform current lineEnding;
			          << '        <tr>';
			          << OSPlatform current lineEnding;
			          << '            <td>';
			          << OSPlatform current lineEnding;
			          << '                <div id="unknow">';
			          << OSPlatform current lineEnding;
			          << '                </div>';
			          << OSPlatform current lineEnding;
			          << '            </td>';
			          << OSPlatform current lineEnding;
			          << '        </tr>';
			          << OSPlatform current lineEnding;
			          << '        <tr>';
			          << OSPlatform current lineEnding;
			          << '            <td style="text-align: center;">';
			          << OSPlatform current lineEnding;
			          << '                <div id="north">';
			          << OSPlatform current lineEnding;
			          << '                </div>';
			          << OSPlatform current lineEnding;
			          << '            </td>';
			          << OSPlatform current lineEnding;
			          << '        </tr>';
			          << OSPlatform current lineEnding;
			          << '        <tr>';
			          << OSPlatform current lineEnding;
			          << '            <td style="text-align: center;">';
			          << OSPlatform current lineEnding;
			          << '                <div id="center">';
			          << OSPlatform current lineEnding;
			          << '                </div>';
			          << OSPlatform current lineEnding;
			          << '            </td>';
			          << OSPlatform current lineEnding;
			          << '        </tr>';
			          << OSPlatform current lineEnding;
			          << '        <tr>';
			          << OSPlatform current lineEnding;
			          << '            <td style="text-align: center;">';
			          << OSPlatform current lineEnding;
			          << '                <div id="south">';
			          << OSPlatform current lineEnding;
			          << '                </div>';
			          << OSPlatform current lineEnding;
			          << '            </td>';
			          << OSPlatform current lineEnding;
			          << '        </tr>';
			          << OSPlatform current lineEnding;
			          << '    </tbody>';
			          << OSPlatform current lineEnding;
			          << '</table>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIPanel: panel.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportButton [

	| result expected button |
	button := self createEntity: CSNUIButton.
	button
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'buttonAttribute';
				 yourself);
		name: 'buttonAttribute';
		yourself.

	expected := OSPlatform current lineEnding join:
		            #( '<button id="buttonAttribute" mat-stroked-button>'
		               '</button>' ).

	result := String streamContents: [ :stream | 
		          exporter currentWriteStream: stream.
		          exporter visitCSNUIButton: button ].
	self assert: expected equals: result
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportButtonWithLabel [

	| result expected button label |
	button := self createEntity: CSNUIButton.
	label := self createEntity: CSNUILabel.
	label attributeValue: 'label'.
	button addAttribute: label.
	button
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'buttonAttribute';
				 yourself);
		name: 'buttonAttribute';
		yourself.

	expected := OSPlatform current lineEnding join:
		            #( '<button id="buttonAttribute" mat-stroked-button>'
		               '    label' '</button>' ).

	result := String streamContents: [ :stream | 
		          exporter currentWriteStream: stream.
		          exporter visitCSNUIButton: button ].
	self assert: expected equals: result
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportButtonWithoutAttribute [

	| result expected button |
	button := self createEntity: CSNUIButton.

	expected := OSPlatform current lineEnding join:
		            #( '<button mat-stroked-button>'
		               '</button>' ).

	result := String streamContents: [ :stream | 
		          exporter currentWriteStream: stream.
		          exporter visitCSNUIButton: button ].
	self assert: expected equals: result
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportDatePicker [

	| result inputDate |
	inputDate := self createEntity: CSNUIInputDate.
	inputDate
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'datePicker';
				 yourself);
		name: 'datePicker';
		yourself.

	result := String streamContents: [ :stream | 
		          stream
			          << '<mat-form-field appearance="fill">';
			          << OSPlatform current lineEnding;
			          <<
				          '    <input formControlName="datePicker" id="datePicker" matInput [matDatepicker]="datePicker">';
			          << OSPlatform current lineEnding;
			          <<
				          '    <mat-datepicker-toggle matSuffix [for]="datePicker"></mat-datepicker-toggle>';
			          << OSPlatform current lineEnding;
			          << '    <mat-datepicker #datePicker></mat-datepicker>';
			          << OSPlatform current lineEnding;
			          << '</mat-form-field>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIInputDate: inputDate.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportFieldSet [
	| result fieldset |
	fieldset := self createEntity: CSNUIFieldset.
	
	result := String streamContents: [ :stream | 
		          stream
			          << '<mat-card>';
			          << OSPlatform current lineEnding;
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
			          << OSPlatform current lineEnding;
			          << '    <mat-card-header>';
			          << OSPlatform current lineEnding;
			          <<
				          '        <i class="ph-file-light" (click)="openPhase(Page)"></i>';
			          << OSPlatform current lineEnding;
			          << '    </mat-card-header>';
			          << OSPlatform current lineEnding;
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
			          << OSPlatform current lineEnding;
			          << '    <mat-card-content>';
			          << OSPlatform current lineEnding;
			          << '        <div>';
			          << OSPlatform current lineEnding;
			          << '        </div>';
			          << OSPlatform current lineEnding;
			          << '    </mat-card-content>';
			          << OSPlatform current lineEnding;
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
			          << OSPlatform current lineEnding;
			          << '    <mat-card-header>';
			          << OSPlatform current lineEnding;
			          << '        <mat-card-title>title</mat-card-title>';
			          << OSPlatform current lineEnding;
			          << '    </mat-card-header>';
			          << OSPlatform current lineEnding;
			          << '</mat-card>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIFieldset: fieldset.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportGirdBag [

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
	result := OSPlatform current lineEnding join: { 
	'<div>'.
	'    <div class="row">'.
	'        <div class="col">'.
	'        </div>'.
	'    </div>'.
	'</div>' }
		           .

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIPanel: panel.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportInput [

	| result inputText label |
	inputText := self createEntity: CSNUIInputText.
	label := self createEntity: CSNUILabel.
	label attributeValue: 'label'.
	inputText addAttribute: label.

	result := OSPlatform current lineEnding join: #(
	'<mat-form-field appearance="fill">'
	'    <mat-label>'
	'        label'
	'    </mat-label>'
	'    <input formControlName="widget" matInput>'
	'</mat-form-field>'
	).

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIInputText: inputText.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportInputWithAffectation [

	| result inputText label |
	inputText := self createEntity: CSNUIInputText.
	label := self createEntity: CSNUILabel.
	label attributeValue: 'label'.
	inputText addAttribute: label.
	inputText affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'myInput';
				 yourself);
		name: 'myInput';
		yourself.

	result := OSPlatform current lineEnding join: #(
	'<mat-form-field appearance="fill">'
	'    <mat-label>'
	'        label'
	'    </mat-label>'
	'    <input formControlName="myInput" id="myInput" matInput>'
	'</mat-form-field>'
	).

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIInputText: inputText.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportMenuInMenu [

	| result menu innerMenu label1 |
	menu := self createEntity: CSNUIMenu.

	menu
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'menu';
				 yourself);
		name: 'menu';
		yourself.

	innerMenu := self createEntity: CSNUIMenu.
	innerMenu
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'innerMenu';
				 yourself);
		name: 'innerMenu';
		yourself.

	label1 := (self createEntity: CSNUILabel)
		          attributeValue: 'Label1';
		          yourself.
	menu addWidget: innerMenu.
	innerMenu addAttribute: label1.

	result := String streamContents: [ :stream | 
		          stream
			          <<
				          '<button mat-stroked-button [matMenuTriggerFor]="menu"><i class="ph-caret-up-light"></i></button>';
			          << OSPlatform current lineEnding;
			          << '<mat-menu #menu="matMenu">';
			          << OSPlatform current lineEnding;
			          <<
				          '    <button mat-menu-item id="innerMenu">Label1</button>';
			          << OSPlatform current lineEnding;
			          << '</mat-menu>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIMenu: menu.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportMenuWithArrow [

	| result menu |
	menu := self createEntity: CSNUIMenu.
	menu
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'menu';
				 yourself);
		name: 'menu';
		yourself.

	result := String streamContents: [ :stream | 
		          stream
			          <<
				          '<button mat-stroked-button [matMenuTriggerFor]="menu"><i class="ph-caret-up-light"></i></button>';
			          << OSPlatform current lineEnding;
			          << '<mat-menu #menu="matMenu">';
			          << OSPlatform current lineEnding;
			          << '</mat-menu>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIMenu: menu.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportSelect [

	| result select |
	select := self createEntity: CSNUISelect.

	result := String streamContents: [ :stream | 
		          stream
			          << '<mat-form-field appearance="fill">';
			          << OSPlatform current lineEnding;
			          << '    <mat-select>';
			          << OSPlatform current lineEnding;
			          << '    </mat-select>';
			          << OSPlatform current lineEnding;
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
			          << OSPlatform current lineEnding;
			          << '    <mat-label>label</mat-label>';
			          << OSPlatform current lineEnding;
			          << '    <mat-select>';
			          << OSPlatform current lineEnding;
			          << '    </mat-select>';
			          << OSPlatform current lineEnding;
			          << '</mat-form-field>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUISelect: select.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportSplitButtonWithArrowAndInnerMenu [

	| result splitButton label1 |
	splitButton := self createEntity: CSNUICWSplitButton.

	splitButton
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'splitButton';
				 yourself);
		name: 'splitButton';
		yourself.

	label1 := (self createEntity: CSNUILabel)
		          attributeValue: 'Label1';
		          yourself.
	splitButton addAttribute: label1.

	result := String streamContents: [ :stream | 
		          stream
			          <<
				          '<button mat-stroked-button [matMenuTriggerFor]="splitButton">Label1<i class="ph-caret-up-light"></i></button>';
			          << OSPlatform current lineEnding;
			          << '<mat-menu #splitButton="matMenu">';
			          << OSPlatform current lineEnding;
			          << '</mat-menu>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUICWSplitButton: splitButton.
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
				          '<table [dataSource]="tableSource" id="table" mat-table mat-sort>';
			          << OSPlatform current lineEnding;
			          <<
				          '    <tr mat-header-row *matHeaderRowDef="tableDisplayedColumns"></tr>';
			          << OSPlatform current lineEnding;
			          <<
				          '    <tr mat-row *matRowDef="let row; columns: tableDisplayedColumns;"></tr>';
			          << OSPlatform current lineEnding;
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
				          '<table [dataSource]="tableSource" id="table" mat-table mat-sort>';
			          << OSPlatform current lineEnding;
			          << '    <ng-container matColumnDef="Label1">';
			          << OSPlatform current lineEnding;
			          <<
				          '        <th mat-header-cell *matHeaderCellDef>Label1</th>';
			          << OSPlatform current lineEnding;
			          <<
				          '        <td mat-cell *matCellDef="let element">{{element}}</td>';
			          << OSPlatform current lineEnding;
			          << '    </ng-container>';
			          << OSPlatform current lineEnding;
			          << OSPlatform current lineEnding;
			          <<
				          '    <tr mat-header-row *matHeaderRowDef="tableDisplayedColumns"></tr>';
			          << OSPlatform current lineEnding;
			          <<
				          '    <tr mat-row *matRowDef="let row; columns: tableDisplayedColumns;"></tr>';
			          << OSPlatform current lineEnding;
			          << '</table>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUITable: table.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportTableWithOneLabel [

	| result table label1 |
	table := self createEntity: CSNUITable.

	table
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'table';
				 yourself);
		name: 'table';
		yourself.

	label1 := (self createEntity: CSNUILabel)
		          attributeValue: 'Label1';
		          yourself.
	table addAttribute: label1.

	result := String streamContents: [ :stream | 
		          stream
			          <<
				          '<table [dataSource]="tableSource" id="table" mat-table mat-sort>';
			          << OSPlatform current lineEnding;
			          << '    <ng-container matColumnDef="Label1">';
			          << OSPlatform current lineEnding;
			          <<
				          '        <th mat-header-cell *matHeaderCellDef>Label1</th>';
			          << OSPlatform current lineEnding;
			          <<
				          '        <td mat-cell *matCellDef="let element">{{element}}</td>';
			          << OSPlatform current lineEnding;
			          << '    </ng-container>';
			          << OSPlatform current lineEnding;
			          << OSPlatform current lineEnding;
			          <<
				          '    <tr mat-header-row *matHeaderRowDef="tableDisplayedColumns"></tr>';
			          << OSPlatform current lineEnding;
			          <<
				          '    <tr mat-row *matRowDef="let row; columns: tableDisplayedColumns;"></tr>';
			          << OSPlatform current lineEnding;
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
				          '<table [dataSource]="tableSource" id="table" mat-table mat-sort>';
			          << OSPlatform current lineEnding;
			          << '    <ng-container matColumnDef="Label1">';
			          << OSPlatform current lineEnding;
			          <<
				          '        <th mat-header-cell *matHeaderCellDef>Label1</th>';
			          << OSPlatform current lineEnding;
			          <<
				          '        <td mat-cell *matCellDef="let element">{{element}}</td>';
			          << OSPlatform current lineEnding;
			          << '    </ng-container>';
			          << OSPlatform current lineEnding;
			          << OSPlatform current lineEnding;
			          << '    <ng-container matColumnDef="Label2">';
			          << OSPlatform current lineEnding;
			          <<
				          '        <th mat-header-cell *matHeaderCellDef>Label2</th>';
			          << OSPlatform current lineEnding;
			          <<
				          '        <td mat-cell *matCellDef="let element">{{element}}</td>';
			          << OSPlatform current lineEnding;
			          << '    </ng-container>';
			          << OSPlatform current lineEnding;
			          << OSPlatform current lineEnding;
			          <<
				          '    <tr mat-header-row *matHeaderRowDef="tableDisplayedColumns"></tr>';
			          << OSPlatform current lineEnding;
			          <<
				          '    <tr mat-row *matRowDef="let row; columns: tableDisplayedColumns;"></tr>';
			          << OSPlatform current lineEnding;
			          << '</table>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUITable: table.
		self assert: exporter currentWriteStream contents equals: result ]
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportTextArea [

	| result textarea |
	textarea := self createEntity: CSNUITextarea.
	textarea
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'textarea';
				 yourself);
		name: 'textarea';
		yourself.

	result := String streamContents: [ :stream | 
		          stream
			          <<
				          '<mat-form-field appearance="fill">';
			          << OSPlatform current lineEnding;
			          <<
				          '    <textarea id="textarea" matInput></textarea>';
			          << OSPlatform current lineEnding;
			          << '</mat-form-field>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUITextarea: textarea.
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
			          << OSPlatform current lineEnding;
			          <<
				          'tableDisplayedColumns : string[] = [ ''Label1'', ''Label2'' ];';
			          << OSPlatform current lineEnding ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		MCTable new
			exportTypeScriptVariableOf: table
			usingExporter: exporter.
		self assert: exporter currentWriteStream contents equals: result ]
]
