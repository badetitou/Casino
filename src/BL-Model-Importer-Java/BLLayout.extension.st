Extension { #name : #BLLayout }

{ #category : #'*BL-Model-Importer-Java' }
BLLayout >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	cell add: (BLCell new widget: aWidget; yourself)
]

{ #category : #'*BL-Model-Importer-Java' }
BLLayout >> childAttribute [
	^ { }
]

{ #category : #'*BL-Model-Importer-Java' }
BLLayout >> childAttributeFor: aCell [
	^ self childAttribute
]

{ #category : #'*BL-Model-Importer-Java' }
BLLayout >> getLayoutAttribute [
	^ BLUIClass new text: 'ui-g'
]

{ #category : #'*BL-Model-Importer-Java' }
BLLayout >> postImport [
	"If we need to order some of the cell"
]
