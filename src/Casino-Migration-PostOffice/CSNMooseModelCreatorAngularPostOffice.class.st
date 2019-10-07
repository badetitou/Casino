"
mooseModel := nil.
mooseModel := CRFModel importFromMSEStream: 'D:\Developpement\mse\VerveineJNicolas\Office.mse' asFileReference readStream.
mooseModel rootFolder: 'D:\Developpement\mse\VerveineJNicolas'.
mooseModel size.
""Generate Bl Model""

model := nil.
model := CSNUIModel new name: 'Office'; yourself.
CSNMooseModelCreatorAngularPostOffice runOn: model fromSourceModel: mooseModel and:  'D:\Developpement\mse\BLOfficeGWT\BLThotGwt\src\fr\bl\application.module.xml'.
model name: 'Office'.
model size.

CSNModelExporterAngular export: model.

FASTJavaMooseModel allInstances size. ""734""



(mooseModel allModelClasses select: [:a | a sourceAnchor isNotNil and: [a sourceAnchor fileName beginsWith: '../BLOfficeGWT/BLThotGwt']]) ""Group (3227 FAMIXClasses)""
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
