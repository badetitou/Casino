Class {
	#name : #CSNMiAngularExporterBrowser,
	#superclass : #CSNMiAbstractBrowser,
	#instVars : [
		'exporterSelection',
		'code',
		'attributeExporter',
		'config'
	],
	#category : #'Casino-Browser'
}

{ #category : #specs }
CSNMiAngularExporterBrowser class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
		  add: #exporterSelection expand: false;
		  add: #code;
		  yourself
]

{ #category : #'world menu' }
CSNMiAngularExporterBrowser class >> menuCommandOn: aBuilder [
	<worldMenu>
	<miBrowsers>
	(aBuilder item: #AngularExporterBrowser)
		parent: (self toolbarCasinoName) ;
		label: (self title) ;
		icon: (self iconNamed: #mooseSourceText);
		order: 1 ;
		help: (self helpMessage);
		action: [ self open ]
]

{ #category : #'instance creation' }
CSNMiAngularExporterBrowser class >> newModel [

	^ MiSourceTextBrowserModel new
]

{ #category : #'instance creation' }
CSNMiAngularExporterBrowser class >> open [
	<script>
	^ super open
]

{ #category : #specs }
CSNMiAngularExporterBrowser class >> title [
	^ 'Angular Exporter'
]

{ #category : #specs }
CSNMiAngularExporterBrowser class >> windowSize [
	^ 600 @ 700
]

{ #category : #testing }
CSNMiAngularExporterBrowser >> canReceiveEntity: anObject [

	^ anObject isNotNil and: [ 
		(anObject isKindOf: CSNWidget) and: [ 
		  (anObject isKindOf: CSNBusinessPage) not and: [ 
			  (anObject isKindOf: CSNPage) not ] ] ]
]

{ #category : #actions }
CSNMiAngularExporterBrowser >> followEntity: anEntity [

	model selected: anEntity.
	self updateText.
	self updateWindowTitleWith: anEntity name
]

{ #category : #initialization }
CSNMiAngularExporterBrowser >> initializePresenters [

	config := CSNExporterAngularConfiguration.
	attributeExporter := CSNExporterAngularAttribute.
	exporterSelection := self newDropList
		                     extent: 800 @ 25;
		                     items:
			                     CSNExporterAngularConfiguration
				                     withAllSubclasses;
		                     display: [ :aClass | aClass name ];
		                     whenSelectedItemChangedDo: [ :aClass | 
			                     config := aClass.
			                     self updateText ];
		                     yourself.
	code := self newCode
		        text: '';
		        beNotEditable;
		        withLineNumbers;
		        withoutSyntaxHighlight
]

{ #category : #accessing }
CSNMiAngularExporterBrowser >> miSelectedItem [

	^ model selected
]

{ #category : #actions }
CSNMiAngularExporterBrowser >> updateText [

	code text: (String streamContents: [ :s | 
			 (CSNModelExporterAngular on: s)
				 currentPage: (self miSelectedItem atAnyScope: { 
								  CSNPage.
								  CSNBusinessPage }) anyOne;
				 attributeExporter: attributeExporter new;
				 exporterAngularConfiguration: config new;
				 visit: self  miSelectedItem ])
]

{ #category : #actions }
CSNMiAngularExporterBrowser >> updateWindowTitleWith: aName [

	self withWindowDo: [ :window | 
		window title: self class title , ' of ' , aName ]
]
