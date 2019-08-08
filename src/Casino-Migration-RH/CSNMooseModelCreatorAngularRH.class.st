"
mooseModel := nil.
mooseModel := FAMIXMooseModel importFromMSEStream: 'D:\Developpement\mse\VerveineJNicolas\GRH.mse' asFileReference readStream.
mooseModel rootFolder: 'D:\Developpement\mse\VerveineJNicolas'.

""Generate Bl Model""
model := nil.
model := CSNUIMooseModel new name: 'GRH'; yourself.
CSNMooseModelCreatorAngularRH runOn: model fromSourceModel: mooseModel and:  'D:\Developpement\mse\BLGRHGWT\BLGRHGwt\src\fr\bl\GRH.module.xml'.
model name: 'GRH'.
model size.
 ""120746""

FASTJavaMooseModel allInstances size.
 ""883 922""


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
