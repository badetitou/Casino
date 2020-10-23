Class {
	#name : #CSNELCWBLTabComponent,
	#superclass : #CoreWebBLComponent,
	#category : #'Casino-CoreWeb-ExternalLibrary'
}

{ #category : #accessing }
CSNELCWBLTabComponent class >> getSelector [
	^ 'bl-tab'
]

{ #category : #accessing }
CSNELCWBLTabComponent class >> moduleName [
	^ 'TabComponent'
]

{ #category : #accessing }
CSNELCWBLTabComponent class >> subModulePath [
	^ '/components/tab/tab/tab.component'
]
