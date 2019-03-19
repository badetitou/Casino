Class {
	#name : #CSNModelImportStringExporter,
	#superclass : #CSNModelDependencyExporter,
	#category : #'Casino-Behavior-Model-Exporter-CoreWeb'
}

{ #category : #generated }
CSNModelImportStringExporter >> visitAction: anAction [
	^ anAction behavior collect: [ :behavior | self accept: behavior ]
]

{ #category : #generated }
CSNModelImportStringExporter >> visitActionAppel: anActionAppel [
	^ self visitAction: anActionAppel
]

{ #category : #generated }
CSNModelImportStringExporter >> visitCall: aCall [
	^ 'import { ' , aCall distantService serviceOwner uniqueName , ' } from ''app/', self context root basename, '/' , aCall distantService serviceOwner getLocalPath , ''';'
]

{ #category : #generated }
CSNModelImportStringExporter >> visitFASTEntity: aFASTEntity [
	^ ((aFASTEntity allToAnyScope: ((CSNBehaviorModelGenerator metamodel packages select: [ :package | package name = CSNBehaviorModelGenerator packageName ]) first classes collect: #implementingClass))
		collect: [ :scope | scope accept: self ]) flattened
]

{ #category : #generated }
CSNModelImportStringExporter >> visitNavigation: aNavigation [
	^ ''
]

{ #category : #generated }
CSNModelImportStringExporter >> visitPopUp: aPopUp [
	^ 'import { ToastrService } from ''ngx-toastr'';'
]
