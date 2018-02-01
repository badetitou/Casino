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

mooseModel rootFolder: '/home/badetitou/Document/PFE/'.

MooseModel root add: mooseModel.

blApp := BLApplication new model: mooseModel; applicationXml: xml;
sourceApp: './Source/BLCoreIncubatorGwt/*';
sourceCore: './Source/BLCore-6.1.4/*'.


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

blApp modelWidgetInstanceFromPhaseAndPageMetier collect: [:a | blApp getPotentialAttributeFromConstructor: a constructor].

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

blApp modelAsync.
blApp getAsyncConstructor.

"------------------ Adherence ----------------"

blApp modelWidget.
blApp viewsWidget.
blApp infoAnonymousWidget.

blWid := BLWidgetAnalysis new model: mooseModel; appTools: blApp.
blWid resetCache.
blWid modelWidget.
blWid computeMetrics.

blWid viewDependancyHeritCore.
blWid viewDependancyHeritCoreAndDepth: 1.
blWid viewDependancyHeritCoreAndReferencesAndDepth: 5.
blWid viewReferences.
blWid viewGroupReferencesForDepth: 0.


blWid modelWidget.

blWid widgetDefinition.
blWid viewAll.


"------------- Adherence App -> Core ---------"

blWid viewReferencesToLeaf.
blWid viewReferencesToNoLeaf.
blWid viewReferencesToWidgetInterface.

"### Compute best to start migration App ###"

blWid computeBestMigrationOrder.

blWid groupWithDepth: 0.

"------------- Adherence App -> GWT ---------"

blWid viewReferencesAppToGWT