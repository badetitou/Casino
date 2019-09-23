"
Smalltalk vm parameterAt: 45 put: (Smalltalk vm parameterAt: 44) * 8.

mooseModel := nil.
mooseModel := CRFMooseModel importFromMSEStream: '../../../BenoitVerhaeghe/mse/VerveineJ/GRH.mse' asFileReference readStream.
mooseModel rootFolder: '../../../BenoitVerhaeghe/mse/VerveineJ/'.

""Generate Bl Model""
model := nil.
model := CSNUIMooseModel new name: 'GRH'; yourself.
CSNMooseModelCreatorAngularRH runOn: model fromSourceModel: mooseModel and:  '../../../BenoitVerhaeghe/mse/BLGRHGWT/BLGRHGwt/src/fr/bl/GRH.module.xml'.
model name: 'GRH'.
model size.

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
