"Generate BlApp"
aw := AnalyseCommand new.
fileName := 'D:\Users\benoit.verhaeghe\Documents\PFE\Source\BLCoreIncubatorGwt\src\fr\bl\application.module.xml'.
"fileName := '/home/badetitou/Document/PFE/Source/BLCoreIncubatorGwt/src/fr/bl/application.module.xml'."
xml := aw getXmlFile: fileName.
mseFile := StandardFileStream fileNamed:  'D:\Users\benoit.verhaeghe\Documents\PFE\GeneralXmlui.mse' .
"mseFile := StandardFileStream fileNamed:  '/home/badetitou/Document/PFE/GeneralXmlui.mse' ."
mooseModel := MooseModel importFromMSEStream: mseFile .
mooseModel rootFolder: 'D:\Users\benoit.verhaeghe\Documents\PFE'.
"mooseModel rootFolder: '/home/badetitou/Document/PFE/'."
blApp := BLApplication new model: mooseModel; applicationXml: xml ; sourceApp: './Source/BLCoreIncubatorGwt/'; sourceCore: './Source/BLCore-6.1.4/'.

blApp modelPhases.

blApp resetCache.
blApp linkViewPPContentWXmlUIService.

blApp linkFromConstructor.

blApp resetCache.
blApp linkFromConstructorWithoutSuperCall.

blApp linkXmlUi.
blApp linkPhasePageMetierToPhasePageMetierFromConstructor.

blApp linkForAbstractTabPhase.

blApp modelPageMetier.
blApp linkXmlUiPhaseAndPageMetier.
blApp linkPageMetierToPageMetier.

{blApp modelPhases , blApp modelPageMetier } flatten select: [ :a | '*XMLUi' match: a superclass mooseName ].

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
