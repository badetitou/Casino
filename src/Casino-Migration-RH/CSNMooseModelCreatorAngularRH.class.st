"
mooseModel := nil.
mooseModel := MooseModel importFromMSEStream: 'D:\Developpement\mse\VerveineJNicolas\GRH.mse' asFileReference readStream.
mooseModel rootFolder: 'D:\Developpement\mse\VerveineJNicolas'.

""Generate Bl Model""
model := MooseModel new name: 'GRH'; yourself.
CSNMooseModelCreatorAngular runOn: model fromSourceModel: mooseModel and:  'D:\Developpement\mse\BLGRHGWT\BLGRHGwt\src\fr\bl\GRH.module.xml'.


CSNModelExporterAngular export: model.
"
Class {
	#name : #CSNMooseModelCreatorAngularRH,
	#superclass : #CSNMooseModelCreatorAngular,
	#category : #'Casino-Migration-RH'
}

{ #category : #accessing }
CSNMooseModelCreatorAngularRH >> modelKind [
	^ CSNWebModelJavaRH
]
