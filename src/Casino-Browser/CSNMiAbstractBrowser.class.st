Class {
	#name : #CSNMiAbstractBrowser,
	#superclass : #MiAbstractBrowser,
	#instVars : [
		'sourceText'
	],
	#category : #'Casino-Browser'
}

{ #category : #testing }
CSNMiAbstractBrowser class >> isAbstract [ 
	^ self == CSNMiAbstractBrowser 
]

{ #category : #testing }
CSNMiAbstractBrowser class >> menuCommandOn: aBuilder [
	<worldMenu>
	<miBrowsers>
	(aBuilder item: self toolbarCasinoName)
		parent: (self midasBrowserMenuLabel) ;
		order: 40 ;
		label: 'Casino'
]

{ #category : #testing }
CSNMiAbstractBrowser class >> toolbarCasinoName [
	^ #'Casino Browser'
]
