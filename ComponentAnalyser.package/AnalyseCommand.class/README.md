aw := AnalyseCommand new.

fileName := '/home/badetitou/Document/PFE/Source/BLCoreIncubatorGwt/src/fr/bl/application.module.xml'.
xml := aw getXmlFile: fileName.

MooseModel resetRoot.
MooseModel resetMeta.

"
mseFile := StandardFileStream fileNamed:  '/home/badetitou/Document/PFE/output.mse' .
"

mseFile := StandardFileStream fileNamed:  '/home/badetitou/Document/PFE/General.mse' .

mooseModel := MooseModel importFromMSEStream: mseFile .

mooseModel rootFolder: '/home/badetitou/Document/PFE/Source/BLCoreIncubatorGwt'.

MooseModel root add: mooseModel.

blApp := BLApplication new model: mooseModel; applicationXml: xml.

blApp model.

blApp model allModelClasses .

blApp phases.

blApp modelPhases.

blApp phasesLink.

blApp linkPhaseView.

blApp modelPageMetier. 

blApp linkPageMetierAndPhase.

blApp linkPageMetierAndPhaseConstructor.

blApp linkView.

blApp modelWidget.