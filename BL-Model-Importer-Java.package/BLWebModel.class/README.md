"Generate BlApp"
aw := AnalyseCommand new.
fileName := 'D:\Developpement\mse\Copie-SourceAndDependencies\BLGRHGwt\src\fr\bl\GRH.module.xml'. 
xml := aw getXmlFile: fileName.
mseFile := StandardFileStream fileNamed: 'D:\Developpement\mse\verveinej\BLGRH.mse' .
mooseModel := MooseModel importFromMSEStream: mseFile .
mooseModel rootFolder: 'D:\Developpement\mse\Copie-SourceAndDependencies'.
blApp := BLApplication new model: mooseModel; applicationXml: xml ; sourceApp: './Source/BLCoreIncubatorGwt/'; sourceCore: './Source/BLCore-6.1.4/'.

"Reset Work"
MooseModel resetRoot.
MooseModel resetMeta.

"Generate Bl Model"
model := MooseModel new name: 'blMooseModel'; yourself.
BLMooseModelCreator runOn: model from: blApp.
ne := NeighbourExplorer new.
ne model: model.
model allBLAction.
ne openGlamour.

"Add Model to moose panel"
MooseModel root add: model.
