Extension { #name : #CSNWidget }

{ #category : #'*Casino-Model-Importer-Java' }
CSNWidget >> addDefaultAttribute [
	"you can extend me to add default attributes to self"

	
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNWidget >> affectedActions [
	<MSEProperty: #affectedActions type: #Object>
	^ self attributeAt: #affectedActions ifAbsent: nil
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNWidget >> affectedActions: anObject [
	self attributeAt: #affectedActions put: anObject
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNWidget >> variable [

	"Can be replace by 
	 ```
	self affectedActions class usesTrait: FamixTAccess
	```
	in P9. but we keep this version for compatibility purpose
	"

	((self affectedActions isKindOf: FAMIXAccess) or: [ self affectedActions isKindOf: FamixJavaAccess ]) ifTrue: [ ^ self affectedActions variable ].
	^ self affectedActions
]
