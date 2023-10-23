"
I export the UI, the services, and the behavior of applications.

```
CSNModelExporterAngularBLSpecific export: gwtModel.
```

"
Class {
	#name : #CSNModelExporterAngularBLSpecific,
	#superclass : #CSNModelExporterAngular,
	#category : #'Casino-Model-CoreWeb-Exporter-CoreWeb'
}

{ #category : #actions }
CSNModelExporterAngularBLSpecific class >> export: aBLMooseModel [
	self new
		model: aBLMooseModel;
		exporterAngularConfiguration: CSNExporterAngularCoreWeb2Configuration new;
		export
]

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> behaviorImportExporter [
	^ CSNModelImportStringExporter
]

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> behaviorInitializeVariableExporter [
	^ CSNModelInitializeVariableExporter
]

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> behaviorModelExporter [
	^ CSNBehaviorModelExporterCoreWeb
]

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> businessExporter [
	^ CSNBusinessExporter
]

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> initialize [

	super initialize.
	serviceExporter := CSNModelServiceExporterAngularCoreWeb new
]

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> visitCSNService: aCSNService [

	self serviceExporter
		rootFolder: self serviceRoot;
		generateService: aCSNService
]

{ #category : #visiting }
CSNModelExporterAngularBLSpecific >> visitMooseModel: aMooseModel [

	super visitMooseModel: aMooseModel.
	currentWriteStream := (self root / 'service-globals.ts')
		                      asFileReference writeStream.
	self serviceExporter
		currentWriteStream: currentWriteStream;
		generateServiceGlobals.
	currentWriteStream
		flush;
		close
]
