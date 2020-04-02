"
gwtMooseModel := CRFModel new importFromMSEStream:  'D:\Developpement\mse\VerveineJNicolas\Omaje.mse' asFileReference readStream.
gwtMooseModel rootFolder: 'D:\Developpement\mse\VerveineJNicolas'. 

""Generate Bl Model""
gwtModel := CSNUICWModel new name: 'Omaje'; yourself.
CSNMooseModelCreatorAngularOmaje runOn: gwtModel fromSourceModel: gwtMooseModel and: 'D:\Developpement\mse\BLOmajeGWT\BLOmajeGwt\src\fr\bl\Omaje.module.xml'.

behavioralModel := CSNBehaviorModelImporterJava new uiModel: gwtModel; sourceCodeModel: gwtMooseModel; resetUIAndGenerateBehavioralModel.

CSNModelExporterAngular export: gwtModel.

CSNModelExporterAngularBLSpecific export: gwtModel.
"
Class {
	#name : #CSNMooseModelCreatorAngularOmaje,
	#superclass : #CSNMooseModelCreatorAngular,
	#category : #'Casino-Migration-Omaje'
}

{ #category : #accessing }
CSNMooseModelCreatorAngularOmaje >> modelKind [
	^ CSNWebModelJavaOmaje
]
