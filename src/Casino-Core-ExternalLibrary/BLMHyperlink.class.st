Class {
	#name : #BLMHyperlink,
	#superclass : #BLMaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #testing }
BLMHyperlink >> getSelector [
	^ 'bl-hyperlink'
]

{ #category : #testing }
BLMHyperlink >> moduleName [

	^ 'HyperlinkModule'
]

{ #category : #testing }
BLMHyperlink >> modulePath [

	^ '@bl/elements'
]
