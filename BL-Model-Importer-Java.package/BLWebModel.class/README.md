"Reset Work"
MooseModel resetRoot.
MooseModel resetMeta.

"Generate BlApp"
aw := AnalyseCommand new.
fileName := 'D:\Developpement\mse\Kitchen\BLCoreIncubatorGwt\src\fr\bl\application.module.xml'. 
xml := aw getXmlFile: fileName.
mseFile := StandardFileStream fileNamed: 'D:\Developpement\mse\verveinej\Kitchen.mse' .
mooseModel := MooseModel importFromMSEStream: mseFile .
mooseModel rootFolder: 'D:\Developpement\mse\Kitchen\'.
"From BL-Model-Explorer"
blApp := BLApplication new model: mooseModel; applicationXml: xml ; sourceApp: './Source/BLCoreIncubatorGwt/'; sourceCore: './Source/BLCore-6.1.4/'.

"Generate Bl Model"
model := MooseModel new name: 'Showroom'; yourself.
BLMooseModelCreatorAngular runOn: model fromSourceModel: mooseModel and: xml.

BLGlobalView new openViewForModel: model.

"Add Model to moose panel"
MooseModel root add: model.

model := BLModelExample generateModelWithTwoPhasesAndThreePageMetierAnd1Widget.
BLModelExporterAngular export: model.