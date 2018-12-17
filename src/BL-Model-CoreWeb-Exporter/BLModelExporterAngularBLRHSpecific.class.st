"
""Reset Work""
MooseModel resetRoot.
MooseModel resetMeta.

""Generate BlApp""
aw := AnalyseCommand new.
fileName := 'D:\Developpement\mse\BLGRH\BL\BLGRHGwt\src\fr\bl\GRH.module.xml'. 
xml := aw getXmlFile: fileName.
mseFile := StandardFileStream fileNamed: 'D:\Developpement\mse\BLGRH\verveinej\BLGRH.mse' .
mooseModel := MooseModel importFromMSEStream: mseFile .
mooseModel rootFolder: 'D:\Developpement\mse\BLGRH\BL'.

""Generate Bl Model""
model := MooseModel new name: 'GRH'; yourself.
BLMooseModelCreatorAngular runOn: model fromSourceModel: mooseModel and: xml.

BLGlobalView new openViewForModel: model.

""Add Model to moose panel""
MooseModel root add: model.

model := BLModelExample generateModelWithTwoPhasesAndThreePageMetierAnd1Widget.
BLModelExporterAngularBLRHSpecific export: model.
"
Class {
	#name : #BLModelExporterAngularBLRHSpecific,
	#superclass : #BLModelExporterAngular,
	#category : #'BL-Model-CoreWeb-Exporter'
}
