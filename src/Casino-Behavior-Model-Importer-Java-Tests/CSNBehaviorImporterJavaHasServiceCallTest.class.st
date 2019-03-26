Class {
	#name : #CSNBehaviorImporterJavaHasServiceCallTest,
	#superclass : #CSNBehaviorImporterJavaServiceCallTest,
	#category : #'Casino-Behavior-Model-Importer-Java-Tests'
}

{ #category : #running }
CSNBehaviorImporterJavaHasServiceCallTest >> createUiModel [
	| service serviceApi |
	uiModel := MooseModel new.
	uiModel metamodel: CSNLayoutMetamodelGenerator metamodel.
	service := CSNService new name: 'IGwtServiceIncubator'; yourself.
	serviceApi := CSNServiceAPI new name: 'generateError'; yourself.
	serviceApi serviceOwner: service.
	uiModel addAll: { service. serviceApi }.
]

{ #category : #tests }
CSNBehaviorImporterJavaHasServiceCallTest >> testImportAsynchroneHasFaillure [
	self
		assert: (model allWithType: CSNBAsynchroneCall) anyOne onFailure isNotNil
]

{ #category : #tests }
CSNBehaviorImporterJavaHasServiceCallTest >> testImportAsynchroneHasSuccess [
	self
		assert: (model allWithType: CSNBAsynchroneCall) anyOne onSuccess isNotNil
]

{ #category : #tests }
CSNBehaviorImporterJavaHasServiceCallTest >> testImportAsynchroneOnFaillureParent [
	self
		assert: (model allWithType: CSNBAsynchroneCall) anyOne onFailure parentNode equals: (model allWithType: CSNBAsynchroneCall) anyOne
]

{ #category : #tests }
CSNBehaviorImporterJavaHasServiceCallTest >> testImportAsynchroneOnSuccessParent [
	self
		assert: (model allWithType: CSNBAsynchroneCall) anyOne onSuccess parentNode equals: (model allWithType: CSNBAsynchroneCall) anyOne
]

{ #category : #tests }
CSNBehaviorImporterJavaHasServiceCallTest >> testImportAsynchroneParent [
	self assert: (model allWithType: CSNBAsynchroneCall) anyOne parentNode equals: (model allWithType: FASTExpressionStatement) anyOne
]

{ #category : #tests }
CSNBehaviorImporterJavaHasServiceCallTest >> testImportAsynchroneParentChildren [
	self
		assert: (model allWithType: CSNBAsynchroneCall) anyOne
		equals: (model allWithType: FASTExpressionStatement) anyOne childrenNode anyOne
]

{ #category : #tests }
CSNBehaviorImporterJavaHasServiceCallTest >> testImportAsynchroneType [

	self assert: (model allWithType: CSNBAsynchroneCall) size equals: 1
]

{ #category : #tests }
CSNBehaviorImporterJavaHasServiceCallTest >> testImportServiceCallFinalSize [
	self
		assert: model size equals: 6
]
