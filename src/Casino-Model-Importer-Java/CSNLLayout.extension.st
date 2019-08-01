Extension { #name : #CSNLLayout }

{ #category : #'*Casino-Model-Importer-Java' }
CSNLLayout >> childAttribute [
	^ { }
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNLLayout >> childAttributeFor: aCell [
	^ self childAttribute
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNLLayout >> getSelector [
	"must be implemented if specific selector is used"
	^ 'bl-panel'
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNLLayout >> postImport [
	"If we need to order some of the cell"
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNLLayout >> specificSelector [
	"if we want to override the selector of our container"
	^ false
]
