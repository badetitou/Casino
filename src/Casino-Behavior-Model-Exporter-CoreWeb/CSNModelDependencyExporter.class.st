Class {
	#name : #CSNModelDependencyExporter,
	#superclass : #CSNBehaviorModelExporter,
	#instVars : [
		'context',
		'exporterAngularConfiguration'
	],
	#category : #'Casino-Behavior-Model-Exporter-CoreWeb'
}

{ #category : #export }
CSNModelDependencyExporter class >> export: behavior withContext: aContext andConfiguration: aAngularConfiguration [
	^ self new
		context: aContext;
		exporterAngularConfiguration: aAngularConfiguration; 
		export: behavior
]

{ #category : #accessing }
CSNModelDependencyExporter >> context [
	^ context
]

{ #category : #accessing }
CSNModelDependencyExporter >> context: anObject [
	context := anObject
]

{ #category : #accessing }
CSNModelDependencyExporter >> export: aBehaviorMethod [
	^ self accept: aBehaviorMethod
]

{ #category : #accessing }
CSNModelDependencyExporter >> exporterAngularConfiguration [
	^ exporterAngularConfiguration
]

{ #category : #accessing }
CSNModelDependencyExporter >> exporterAngularConfiguration: anObject [
	exporterAngularConfiguration := anObject
]

{ #category : #generated }
CSNModelDependencyExporter >> visitCSNActionAppel: anActionAppel [
	^ self visitCSNAction: anActionAppel
]

{ #category : #generated }
CSNModelDependencyExporter >> visitCSNUICWClickHandler: aCSNUICWClickHandler [
	^ self visitCSNAction: aCSNUICWClickHandler
]

{ #category : #generated }
CSNModelDependencyExporter >> visitDOMElementAcccess: aDOMElementAcccess [
	^ ''
]

{ #category : #generated }
CSNModelDependencyExporter >> visitFASTEntity: aFASTEntity [
	| scopes |
	scopes := (CSNBModel metamodel packages select: [ :package | 
		           package name = CSNBehaviorModelGenerator packageName ])
		          first classes collect: #implementingClass.
	^ (((aFASTEntity allToAnyScope: scopes) \ {aFASTEntity}) collect: [ :scope | 
		   scope accept: self ]) flattened
]

{ #category : #generated }
CSNModelDependencyExporter >> visitOpenDialog: anOpenDialog [
	^ ''
]
