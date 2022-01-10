"
This class correspond to the [material angular menu](https://material.angular.io/components/menu/examples).

It includes a special exporter that will convert children as button (_e.g._ MenuItem) for this component
"
Class {
	#name : #MCMenu,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
MCMenu >> exportContentOf: aWidget with: anExporter [

	anExporter indentPlus.
	aWidget widgets do: [ :widget | 
		anExporter
			crlf;
			<< '<button mat-menu-item>'.
		widget attributes
			detect: [ :att | att isOfType: CSNUILabel ]
			ifFound: [ :att | anExporter visit: att ].
		anExporter <<< '</button>' ].

	anExporter crlf.
	anExporter indentMinus
]

{ #category : #accessing }
MCMenu >> exportFooterOf: aWidget with: anExporter [
	anExporter << '</mat-menu>'
]

{ #category : #accessing }
MCMenu >> exportHeaderOf: aWidget with: anExporter [

	anExporter
		<< '<button mat-button [matMenuTriggerFor]="';
		<<< (self variableFor: aWidget);
		<<< '">'.
	aWidget attributes
		detect: [ :att | att isOfType: CSNUILabel ]
		ifFound: [ :att | anExporter visit: att ].
	anExporter <<< '</button>'.
	anExporter
		crlf;
		<< '<mat-menu #';
		<<< (self variableFor: aWidget);
		<<< '="matMenu">'
]

{ #category : #accessing }
MCMenu >> getSelector [
	^ 'mat-menu'
]

{ #category : #accessing }
MCMenu >> moduleName [
	^ 'MatMenuModule'
]

{ #category : #accessing }
MCMenu >> modulePath [
	^ '@angular/material/menu'
]

{ #category : #accessing }
MCMenu >> variableFor: widget [
	^ widget affectedActions uniqueName
]
