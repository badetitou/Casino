"Generate BlApp"
aw := AnalyseCommand new.
fileName := '/home/badetitou/Document/PFE/Source/BLCoreIncubatorGwt/src/fr/bl/application.module.xml'.
xml := aw getXmlFile: fileName.
mseFile := StandardFileStream fileNamed:  '/home/badetitou/Document/PFE/General.mse' .
mooseModel := MooseModel importFromMSEStream: mseFile .
mooseModel rootFolder: '/home/badetitou/Document/PFE/Source/BLCoreIncubatorGwt'.
blApp := BLApplication new model: mooseModel; applicationXml: xml.


"Reset Work"
MooseModel resetRoot.
MooseModel resetMeta.

"Generate Bl Model"
model := MooseModel new name: 'blMooseModel'; yourself.
BLMooseModelCreator runOn: model from: blApp.

"Add Model to moose panel"
MooseModel root add: model.
