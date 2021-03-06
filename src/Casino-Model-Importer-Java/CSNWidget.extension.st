Extension { #name : #CSNWidget }

{ #category : #'*Casino-Model-Importer-Java' }
CSNWidget >> addDefaultAttribute [
	"you can extend me to add default attributes to self"

	
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNWidget >> affectedActions [
	<FMProperty: #affectedActions type: #Object>
	^ self attributeAt: #affectedActions ifAbsent: nil
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNWidget >> affectedActions: anObject [
	self attributeAt: #affectedActions put: anObject
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNWidget >> variable [
	(self affectedActions isKindOf: FAMIXAccess) ifTrue: [ ^ self affectedActions variable ].
	^ self affectedActions
]
