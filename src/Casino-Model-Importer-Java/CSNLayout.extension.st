Extension { #name : #CSNLayout }

{ #category : #'*Casino-Model-Importer-Java' }
CSNLayout >> childAttribute [
	^ { }
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNLayout >> childAttributeFor: aCell [
	^ self childAttribute
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNLayout >> getSelector [
	"must be implemented if specific selector is used"
	^ 'bl-panel'
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNLayout >> postImport [
	"If we need to order some of the cell"
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNLayout >> specificSelector [
	"if we want to override the selector of our container"
	^ false
]
