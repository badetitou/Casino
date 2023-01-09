"
This class correspond to the [material angular menu](https://material.angular.io/components/menu/examples).

It includes a special exporter that will convert children as button (_e.g._ MenuItem) for this component
"
Class {
	#name : #MCMenu,
	#superclass : #MaterialComponent,
	#instVars : [
		'withArrow'
	],
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
MCMenu >> beWithArrow [
	withArrow := true
]

{ #category : #export }
MCMenu >> exportContentOf: aWidget with: anExporter [

	anExporter indentPlus.
	aWidget widgets do: [ :widget | 
		| attributes |
		anExporter
			crlf;
			<< '<button mat-menu-item'.
		attributes := (self attributeOf: widget with: anExporter) reject: [ :att | 
			              att isOfType: CSNUILabel ].
		self exportAttributes: attributes with: anExporter.
		self componentAttributeOn: anExporter.
		anExporter <<< (widget actionsTagFrom: anExporter).
		anExporter <<< '>'.
		widget attributes
			detect: [ :att | att isOfType: CSNUILabel ]
			ifFound: [ :att | anExporter visit: att ].

		anExporter <<< '</button>' ].

	anExporter crlf.
	anExporter indentMinus
]

{ #category : #export }
MCMenu >> exportFooterOf: aWidget with: anExporter [
	anExporter << '</mat-menu>'
]

{ #category : #export }
MCMenu >> exportHeaderOf: aWidget with: anExporter [
	anExporter
		<< '<button mat-stroked-button [matMenuTriggerFor]="';
		<<< (self variableFor: aWidget);
		<<< '">'.
	aWidget attributes
		detect: [ :att | att isOfType: CSNUILabel ]
		ifFound: [ :att | anExporter visit: att ].
	withArrow ifTrue: [ 
		anExporter
		<<< '<i class="ph-caret-up-light"></i>' ].
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

{ #category : #initialization }
MCMenu >> initialize [
	super initialize.
	withArrow := false
]

{ #category : #accessing }
MCMenu >> internalDependenciesOf: aWidgetInstance [

	| dep |
	dep := (super internalDependenciesOf: aWidgetInstance)
		       asOrderedCollection.
	dep add: MCButton new.
	withArrow ifTrue: [ dep add: MCIcon new ].
	^ dep
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
	^ widget id
]
