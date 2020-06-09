Class {
	#name : #CSNELCWBLTabManagerComponent,
	#superclass : #CoreWebBLComponent,
	#category : #'Casino-CoreWeb-ExternalLibrary'
}

{ #category : #accessing }
CSNELCWBLTabManagerComponent class >> getSelector [
	^ 'bl-tabs'
]

{ #category : #accessing }
CSNELCWBLTabManagerComponent class >> moduleName [
	^ 'TabsComponent'
]

{ #category : #accessing }
CSNELCWBLTabManagerComponent class >> subModulePath [
	^ 'tab/tabs/tabs.component'
]
