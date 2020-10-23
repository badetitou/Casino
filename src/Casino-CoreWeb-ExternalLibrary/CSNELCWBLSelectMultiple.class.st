"
Correspond to the BLMultiCombo class
"
Class {
	#name : #CSNELCWBLSelectMultiple,
	#superclass : #CoreWebBLComponent,
	#category : #'Casino-CoreWeb-ExternalLibrary'
}

{ #category : #accessing }
CSNELCWBLSelectMultiple class >> getSelector [
	^ 'bl-selectmultiple'
]

{ #category : #accessing }
CSNELCWBLSelectMultiple class >> moduleName [
	^ 'BlSelectMultipleComponent'
]

{ #category : #accessing }
CSNELCWBLSelectMultiple class >> subModulePath [
	^ '/components/selectmultiple/selectmultiple.component'
]
