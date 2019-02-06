"
""LOAD FAST""
SmalltalkImage current garbageCollect.

""Generate BlApp""

mooseModel := nil.
mooseModel := MooseModel importFromMSEStream: 'D:\Developpement\mse\verveineJ2\BLGRHGWT.mse' asFileReference readStream.
mooseModel rootFolder: 'D:\Developpement\mse\verveineJ2'.

""Generate Bl Model""
model := MooseModel new name: 'GRH'; yourself.
BLMooseModelCreatorAngularRH runOn: model fromSourceModel: mooseModel and:  'D:\Developpement\mse\BLGRHV02\BL\BLGRHGwt\src\fr\bl\GRH.module.xml'.


BLWebModelJavaRH new sourceModel: mooseModel; model: model; widgetConstructorsInvocation.
'BlocAdministrationDag()'

BLGlobalView new openViewForModel: model.

""Add Model to moose panel""
MooseModel root add: model.

model := BLModelExample generateModelWithTwoPhasesAndThreePageMetierAnd1Widget.
BLModelExporterAngular export: model.
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
