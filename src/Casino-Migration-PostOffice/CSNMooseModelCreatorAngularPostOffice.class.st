"
mooseModel := nil.
mooseModel := CRFMooseModel importFromMSEStream: 'D:\Developpement\mse\VerveineJNicolas\Office.mse' asFileReference readStream.
mooseModel rootFolder: 'D:\Developpement\mse\VerveineJNicolas'.

""Generate Bl Model""
model := nil.
model := CSNUIMooseModel new name: 'Office'; yourself.
CSNMooseModelCreatorAngularRH runOn: model fromSourceModel: mooseModel and:  'D:\Developpement\mse\BLOfficeGWT\BLThotGwt\src\fr\bl\application.module.xml'.
model name: 'Office'.
model size.
 ""120746""

CSNModelExporterAngular export: model.

FASTJavaMooseModel allInstances size.
"
Class {
	#name : #CSNMooseModelCreatorAngularPostOffice,
	#superclass : #CSNMooseModelCreatorAngular,
	#category : #'Casino-Migration-PostOffice'
}

{ #category : #accessing }
CSNMooseModelCreatorAngularPostOffice >> modelKind [
	^ CSNWebModelJavaPostOffice
]
