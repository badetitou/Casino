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
MCTable >> attributeOf: aWidget [

	| attributes |
	attributes := super attributeOf: aWidget.
	attributes := attributes , { (CSNAttribute new
		 name: '[dataSource]';
		 attributeValue: aWidget id , 'Source') }.
	^ attributes
]

{ #category : #accessing }
MCTable >> componentAttributeOn: anExporter [
	anExporter <<< ' mat-table mat-sort'
]

{ #category : #accessing }
MCTable >> exportContentOf: aWidget with: anExporter [

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
		indentMinus.
	super exportContentOf: aWidget with: anExporter
]

{ #category : #accessing }
MCTable >> exportTypeScriptVariableOf: widget usingExporter: anExporter [

	(anExporter << widget id)
		<<< 'Source = [];';
		crlf.
	(anExporter << widget id)
		<<< 'DisplayedColumns : string[] = []';
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
