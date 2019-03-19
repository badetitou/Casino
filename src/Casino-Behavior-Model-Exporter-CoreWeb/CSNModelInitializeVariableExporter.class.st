Class {
	#name : #CSNModelInitializeVariableExporter,
	#superclass : #CSNModelDependencyExporter,
	#category : #'Casino-Behavior-Model-Exporter-CoreWeb'
}

{ #category : #generated }
CSNModelInitializeVariableExporter >> visitAction: anAction [
	^ anAction behavior collect: [ :behavior | self accept: behavior ]
]

{ #category : #generated }
CSNModelInitializeVariableExporter >> visitActionAppel: anActionAppel [
	^ ''
]

{ #category : #generated }
CSNModelInitializeVariableExporter >> visitCall: aCall [
	^ 'private ', aCall distantService serviceOwner uniqueName uncapitalized, ': ', aCall distantService serviceOwner uniqueName
]

{ #category : #generated }
CSNModelInitializeVariableExporter >> visitFASTEntity: aFASTEntity [
	^ ((aFASTEntity allToAnyScope: ((CSNBehaviorModelGenerator metamodel packages select: [ :package | package name = CSNBehaviorModelGenerator packageName ]) first classes collect: #implementingClass))
		collect: [ :scope | scope accept: self ]) flattened
]

{ #category : #generated }
CSNModelInitializeVariableExporter >> visitNavigation: aNavigation [
	^ ''
]

{ #category : #generated }
CSNModelInitializeVariableExporter >> visitPopUp: aPopUp [
	^ 'private _toastrService: ToastrService'
]
