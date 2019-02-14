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
CSNBehaviorImporterJavaHasServiceCallTest >> testImportAsynchroneType [

	self assert: (model allWithType: CSNBAsynchroneCall) size equals: 1
]
