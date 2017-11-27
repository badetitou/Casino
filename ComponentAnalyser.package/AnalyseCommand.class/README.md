aw := AnalyseCommand new.

fileName := '/home/badetitou/Document/PFE/Source/BLCoreIncubatorGwt/src/fr/bl/application.module.xml'.
xml := aw getXmlFile: fileName.

MooseModel resetRoot.
MooseModel resetMeta.

mseFile := StandardFileStream fileNamed:  '/home/badetitou/Document/PFE/output.mse' .
mooseModel := MooseModel importFromMSEStream: mseFile.

blApp := BLApplication new model: mooseModel; applicationXml: xml.

blApp modelPhases.

blApp phasesLink.

blApp model