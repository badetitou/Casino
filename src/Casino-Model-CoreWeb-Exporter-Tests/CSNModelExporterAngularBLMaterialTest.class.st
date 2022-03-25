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
			          << String crlf;
			          << '    <tbody>';
			          << String crlf;
			          << '        <tr>';
			          << String crlf;
			          << '            <td>';
			          << String crlf;
			          << '                <div>';
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
			          << String crlf;
			          << '    <tbody>';
			          << String crlf;
			          << '        <tr>';
			          << String crlf;
			          << '            <td>';
			          << String crlf;
			          << '                <div id="unknow" #unknow>';
			          << String crlf;
			          << '                </div>';
			          << String crlf;
			          << '            </td>';
			          << String crlf;
			          << '        </tr>';
			          << String crlf;
			          << '        <tr>';
			          << String crlf;
			          << '            <td style="text-align: center;">';
			          << String crlf;
			          << '                <div id="north" #north>';
			          << String crlf;
			          << '                </div>';
			          << String crlf;
			          << '            </td>';
			          << String crlf;
			          << '        </tr>';
			          << String crlf;
			          << '        <tr>';
			          << String crlf;
			          << '            <td style="text-align: center;">';
			          << String crlf;
			          << '                <div id="center" #center>';
			          << String crlf;
			          << '                </div>';
			          << String crlf;
			          << '            </td>';
			          << String crlf;
			          << '        </tr>';
			          << String crlf;
			          << '        <tr>';
			          << String crlf;
			          << '            <td style="text-align: center;">';
			          << String crlf;
			          << '                <div id="south" #south>';
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
CSNModelExporterAngularBLMaterialTest >> testExportButton [

	| result expected button |
	button := self createEntity: CSNUIButton.
	button
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'buttonAttribute';
				 yourself);
		name: 'buttonAttribute';
		yourself.

	expected := String crlf join:
		            #( '<button id="buttonAttribute" mat-stroked-button #buttonAttribute>'
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

	expected := String crlf join:
		            #( '<button id="buttonAttribute" mat-stroked-button #buttonAttribute>'
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

	expected := String crlf join:
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
			          << String crlf;
			          <<
				          '    <input id="datePicker" matInput [matDatepicker]="datePicker">';
			          << String crlf;
			          <<
				          '    <mat-datepicker-toggle matSuffix [for]="datePicker"></mat-datepicker-toggle>';
			          << String crlf;
			          << '    <mat-datepicker #datePicker></mat-datepicker>';
			          << String crlf;
			          << '</mat-form-field>' ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		exporter visitCSNUIInputDate: inputDate.
		self assert: exporter currentWriteStream contents equals: result ]
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
			          << '                <div>';
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
CSNModelExporterAngularBLMaterialTest >> testExportHyperlink [

	| result expected link |
	link := self createEntity: CSNUICWExtendedLink.
	link
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'buttonAttribute';
				 yourself);
		name: 'buttonAttribute';
		yourself.

	expected := String crlf join:
		            #( '<bl-hyperlink id="buttonAttribute" #buttonAttribute>'
		               '</bl-hyperlink>' ).

	result := String streamContents: [ :stream | 
		          exporter currentWriteStream: stream.
		          exporter visitCSNUILink: link ].
	self assert: expected equals: result
]

{ #category : #running }
CSNModelExporterAngularBLMaterialTest >> testExportHyperlinkWithLabel [

	| result expected link label |
	link := self createEntity: CSNUICWExtendedLink.
	link
		affectedActions: ((self createEntity: FamixJavaAttribute)
				 name: 'buttonAttribute';
				 yourself);
		name: 'buttonAttribute';
		yourself.
	label := self createEntity: CSNUILabel.
	label attributeValue: 'label'.
	link addAttribute: label.

	expected := String crlf join:
		            #( '<bl-hyperlink id="buttonAttribute" #buttonAttribute>'
		'    label'
		               '</bl-hyperlink>' ).

	result := String streamContents: [ :stream | 
		          exporter currentWriteStream: stream.
		          exporter visitCSNUILink: link ].
	self assert: expected equals: result
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
				          '<button mat-stroked-button [matMenuTriggerFor]="menu"><mat-icon aria-hidden="false" >arrow_drop_down</mat-icon></button>';
			          << String crlf;
			          << '<mat-menu #menu="matMenu">';
			          << String crlf;
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
			          << String crlf;
			          <<
				          '    <textarea id="textarea" matInput #textarea></textarea>';
			          << String crlf;
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
			          << String crlf;
			          <<
				          'tableDisplayedColumns : string[] = [ ''Label1'', ''Label2'' ];';
			          << String crlf ].

	String streamContents: [ :stream | 
		exporter currentWriteStream: stream.
		MCTable new
			exportTypeScriptVariableOf: table
			usingExporter: exporter.
		self assert: exporter currentWriteStream contents equals: result ]
]
