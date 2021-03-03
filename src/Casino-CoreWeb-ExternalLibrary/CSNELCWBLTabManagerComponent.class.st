Class {
	#name : #CSNELCWBLTabManagerComponent,
	#superclass : #CoreWebBLComponent,
	#category : #'Casino-CoreWeb-ExternalLibrary'
}

{ #category : #accessing }
CSNELCWBLTabManagerComponent >> getSelector [
	^ 'bl-tabs'
]

{ #category : #accessing }
CSNELCWBLTabManagerComponent >> moduleName [
	^ 'TabsComponent'
]

{ #category : #accessing }
CSNELCWBLTabManagerComponent >> subModulePath [
	^ '/components/tab/tabs/tabs.component'
]
