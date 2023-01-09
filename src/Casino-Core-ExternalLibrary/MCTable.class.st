"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #MCTable,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
MCTable >> attributeOf: aWidget with: anExporter [

	| attributes |
	attributes := super attributeOf: aWidget with: anExporter.
	attributes := attributes , { (CSNAttribute new
		               name: '[dataSource]';
		               attributeValue: aWidget id , 'Source') }.
	attributes := attributes reject: [ :attribute | "Label can not be use in <table>" 
		              attribute isKindOf: CSNUILabel ].
	^ attributes
]

{ #category : #accessing }
MCTable >> componentAttributeOn: anExporter [
	anExporter <<< ' mat-table mat-sort'
]

{ #category : #accessing }
MCTable >> exportContentOf: aWidget with: anExporter [

	(aWidget widgets select: [ :widget | 
		 widget isKindOf: CSNUITableHeader ]) do: [ :header | 
		anExporter inIndented: [ 
			self exportTableHeader: header with: anExporter ] ].

	aWidget attributes
		detect: [ :attribute | attribute isOfType: CSNUILabel ]
		ifFound: [ :attribute | anExporter inIndented: [ 
			self exportLabelAsTableHeader: attribute with: anExporter ]].

	anExporter
		crlf;
		indentPlus;
		<< '<tr mat-header-row *matHeaderRowDef="';
		<<< aWidget id;
		<<< 'DisplayedColumns"></tr>';
		crlf;
		<< '<tr mat-row *matRowDef="let row; columns: ';
		<<< aWidget id;
		<<< 'DisplayedColumns;"></tr>';
		indentMinus
]

{ #category : #accessing }
MCTable >> exportLabelAsTableHeader: label with: anExporter [

	| labelName |
	labelName := label attributeValue.
	anExporter << '<ng-container matColumnDef="' <<< labelName <<< '">'.
	anExporter inIndented: [ 
		anExporter << '<th mat-header-cell *matHeaderCellDef>'.
		anExporter visit: label.
		anExporter
			<<< '</th>';
			crlf.
		anExporter
		<< '<td mat-cell *matCellDef="let element">{{element}}</td>' ].
	anExporter << '</ng-container>'
]

{ #category : #accessing }
MCTable >> exportTableHeader: header with: anExporter [

	| labelName |
	labelName := header attributes
		             detect: [ :att | att isKindOf: CSNUILabel ]
		             ifFound: [ :label | label attributeValue ]
		             ifNone: [ 'header' , header mooseID printString ].
	anExporter << '<ng-container matColumnDef="' <<< labelName <<< '">'.
	anExporter inIndented: [ 
		anExporter << '<th mat-header-cell *matHeaderCellDef>'.
		header attributes
			detect: [ :att | att isKindOf: CSNUILabel ]
			ifFound: [ :label | anExporter visit: label ]
			ifNone: [ anExporter <<< 'header' <<< header mooseID printString ].
		anExporter
			<<< '</th>';
			crlf.
		anExporter
		<< '<td mat-cell *matCellDef="let element">{{element}}</td>' ].
	anExporter << '</ng-container>'
]

{ #category : #accessing }
MCTable >> exportTypeScriptVariableOf: widget usingExporter: anExporter [

	(anExporter << widget id)
		<<< 'Source = [];';
		crlf.
	anExporter << widget id <<< 'DisplayedColumns : string[] = ['.
	(widget widgets select: [ :childWidget | 
		 childWidget isKindOf: CSNUITableHeader ]) ifNotEmpty: [ :headers | 
		headers
			do: [ :header | 
				anExporter
					<<< ' ''';
					<<< (header attributes
							 detect: [ :att | att isKindOf: CSNUILabel ]
							 ifFound: [ :label | label attributeValue ]
							 ifNone: [ 'header' , header mooseID printString ]);
					<<< '''' ]
			separatedBy: [ anExporter <<< ',' ].
		anExporter space ].
	anExporter
		<<< '];';
		crlf
]

{ #category : #accessing }
MCTable >> getSelector [
	^ 'table'
]

{ #category : #accessing }
MCTable >> internalDependenciesOf: aWidgetInstance [
	^ { MCSortModule new . MCPaginatorModule new }
]

{ #category : #accessing }
MCTable >> isNative [
	"The widget is part of the html standard"
	^ true
]

{ #category : #accessing }
MCTable >> moduleName [
	^ 'MatTableModule'
]

{ #category : #accessing }
MCTable >> modulePath [
	^ '@angular/material/table'
]
