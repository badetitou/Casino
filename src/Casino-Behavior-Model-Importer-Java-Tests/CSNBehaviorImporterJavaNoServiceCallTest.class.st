Class {
	#name : #CSNBehaviorImporterJavaNoServiceCallTest,
	#superclass : #CSNBehaviorImporterJavaServiceCallTest,
	#category : #'Casino-Behavior-Model-Importer-Java-Tests'
}

{ #category : #running }
CSNBehaviorImporterJavaNoServiceCallTest >> createUiModel [
	| service serviceApi |
	uiModel := MooseModel new.
	uiModel metamodel: CSNLayoutMetamodelGenerator metamodel.
	service := CSNService new name: 'IGwtServiceIncubator'; yourself.
	serviceApi := CSNServiceAPI new name: 'aNonExistingMethod'; yourself.
	serviceApi serviceOwner: service.
	uiModel addAll: { service. serviceApi }.
]

{ #category : #running }
CSNBehaviorImporterJavaNoServiceCallTest >> testImportNoAsynchroneFound [

	self assert: (model allWithSubTypesOf: CSNBCall) size equals: 0.
]
