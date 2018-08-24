"
""LOAD FAST""
SmalltalkImage current garbageCollectMost .

""Reset Work""
MooseModel resetRoot.
MooseModel resetMeta.
generator := BLMetamodelGenerator new.
generator generate.
BLMetamodelGenerator resetMetamodel.


""Generate BlApp""

mooseModel := nil.
mooseModel := MooseModel importFromMSEStream: 'D:\Developpement\mse\BLGRHV02\verveinej\BLGRH.mse' asFileReference readStream.
mooseModel rootFolder: 'D:\Developpement\mse\BLGRHV02\verveinej'.

""Generate Bl Model""
model := MooseModel new name: 'GRH'; yourself.
BLMooseModelCreatorAngularRH runOn: model fromSourceModel: mooseModel and:  'D:\Developpement\mse\BLGRHV02\BL\BLGRHGwt\src\fr\bl\GRH.module.xml'.

BLGlobalView new openViewForModel: model.

""Add Model to moose panel""
MooseModel root add: model.

model := BLModelExample generateModelWithTwoPhasesAndThreePageMetierAnd1Widget.
BLModelExporterAngular export: model.
"
Class {
	#name : #BLMooseModelCreatorAngularRH,
	#superclass : #BLMooseModelCreatorAngular,
	#category : #'BL-Migration-RH'
}

{ #category : #accessing }
BLMooseModelCreatorAngularRH >> modelKind [
	^ BLWebModelJavaRH
]
