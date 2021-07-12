"
Correspond to the BLMultiCombo class
"
Class {
	#name : #CSNELCWBLSelectMultiple,
	#superclass : #CoreWebBLComponent,
	#category : #'Casino-CoreWeb-ExternalLibrary'
}

{ #category : #accessing }
CSNELCWBLSelectMultiple >> getSelector [
	^ 'bl-selectmultiple'
]

{ #category : #accessing }
CSNELCWBLSelectMultiple >> moduleName [
	^ 'BlSelectMultipleComponent'
]

{ #category : #accessing }
CSNELCWBLSelectMultiple >> subModulePath [
	^ '/components/selectmultiple/selectmultiple.component'
]
