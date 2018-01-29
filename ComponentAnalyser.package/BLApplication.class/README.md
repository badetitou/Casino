aw := AnalyseCommand new.

fileName := '/home/badetitou/Document/PFE/Source/BLCoreIncubatorGwt/src/fr/bl/application.module.xml'.
xml := aw getXmlFile: fileName.

MooseModel resetRoot.
MooseModel resetMeta.

"
mseFile := StandardFileStream fileNamed:  '/home/badetitou/Document/PFE/output.mse' .
"

"mseFile := StandardFileStream fileNamed:  '/home/badetitou/Document/PFE/General.mse' ."

mseFile := StandardFileStream fileNamed:  '/home/badetitou/Document/PFE/GeneralXmlui.mse' .

mooseModel := MooseModel importFromMSEStream: mseFile .

mooseModel rootFolder: '/home/badetitou/Document/PFE/Source/BLCoreIncubatorGwt'.

MooseModel root add: mooseModel.

blApp := BLApplication new model: mooseModel; applicationXml: xml.

blApp model.

blApp phases.

blApp modelPhases.

blApp phasesLink.

blApp linkPhaseView.

blApp modelPageMetier. 

blApp linkPageMetierAndPhase.

blApp linkPageMetierAndPhaseConstructor.

blApp linkViewPhasePage.

blApp modelWidget.

blApp linkFromConstructor.

blApp getConstructor.
blApp getWidgetConstructor.

blApp modelWidgetInstance.

blApp resetCache.
blApp linkViewWithExternalWidget.

blApp resetCache.
blApp linkView.

blApp modelWidgetInstanceFromPhaseAndPageMetier.

blApp resetCache.
blApp linkViewWidgetInstanceFromPhaseAndPageMetier.

blApp linkWidgetFromPPPhase.
blApp linkViewPPWidget.

blApp linkViewPPWidgetHighlightCallPhaseWidget.

blApp linkXmlUi.
blApp linkViewPPWXmlUI.

(blApp modelPhases , blApp modelPageMetier , blApp modelWidgetInstanceFromPhaseAndPageMetier , (blApp linkXmlUi collect: #key)) asSet.

blApp getAsyncCall.
blApp asyncClass.

blApp modelServices.

"------------------ Adherence ----------------"

blApp modelWidget.
blApp viewsWidget.
blApp infoAnonymousWidget.

blWid := BLWidgetAnalysis new model: mooseModel.
blWid resetCache.
blWid modelWidget.
blWid computeMetrics.

blWid viewDependancyHeritCore.
blWid viewDependancyHeritCoreAndDepth: 1.

blWid modelWidget.

blWid widgetDefinition.
blWid viewAll.
