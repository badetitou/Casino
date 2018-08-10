Class {
	#name : #BLGrid,
	#superclass : #BLUIContainer,
	#instVars : [
		'widgetPosition'
	],
	#category : #'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLGrid class >> annotation [
	<MSEClass: #BLGrid super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLGrid >> addDefaultAttribute [
	"black magic... Can send nil
	see BLHorizontalParent>>newFrom:for:"

	self addAttribute: (BLGridElement newFor: self)
]

{ #category : #'as yet unclassified' }
BLGrid >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLEnable
	
]

{ #category : #'as yet unclassified' }
BLGrid >> getSelector [
	^ 'div'
]

{ #category : #'as yet unclassified' }
BLGrid >> postImport [
	((self privateState attributes asDictionary at: #widgetPosition ifAbsent: [{} asOrderedCollection]) groupedBy: [:el | el value at: 1]) do: [:collection | collection do: [ :el | el key addAttribute: (BLGridSubElement new subpart: 12/(collection size)) ] ].
	
]
