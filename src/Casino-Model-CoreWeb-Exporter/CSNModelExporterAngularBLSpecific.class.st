"
""LOAD FAST""
""
FAST - Core
importer - 7
model - 76
resolution - 57
tools - 23

FAST - Java
importer - 14
model - 25
extension - 1
tools - 8

""
""Reset Work""
MooseModel resetRoot.
MooseModel resetMeta.

""Generate BlApp""
mseFile := StandardFileStream fileNamed: 'D:\Users\benoit.verhaeghe\Documents\PFE\GeneralXmlui.mse' .
mooseModel := MooseModel importFromMSEStream: mseFile .
mooseModel rootFolder: 'D:\Users\benoit.verhaeghe\Documents\PFE\'.

""Generate Bl Model""
model := MooseModel new name: 'Showroom'; yourself.
BLMooseModelCreatorAngular runOn: model fromSourceModel: mooseModel and:  'D:\Users\benoit.verhaeghe\Documents\PFE\Source\BLCoreIncubatorGwt\src\fr\bl\application.module.xml'.

BLGlobalView new openViewForModel: model.

""Add Model to moose panel""
MooseModel root add: model.

model := BLModelExample generateModelWithTwoPhasesAndThreePageMetierAnd1Widget.
BLModelExporterAngularBLSpecific export: model.
"
Class {
	#name : #CSNModelExporterAngularBLSpecific,
	#superclass : #CSNModelExporterAngular,
	#category : #'Casino-Model-CoreWeb-Exporter'
}

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> behaviorModelExporter [
	^ CSNBehaviorModelExporterAngular
]

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> generateTSSourceCodeForBusinessPage: aBLPageMetier [
	^ '
import {
    Component,
    OnDestroy,
    OnInit,
    ViewChild,
    ViewContainerRef
} from ''@angular/core'';
'
		,
			(aBLPageMetier collectPhaseCalled
				ifNotEmpty: [ 'import { DesktopStateService } from ''app/components/service/desktop-state.service'';
import { Phase } from ''app/components/service/model/phase/phase.model'';
import { PhaseService } from ''app/components/service/phase.service'';
' ]) , aBLPageMetier widgetsDependencies , aBLPageMetier getBehaviorImportString
		,
			'

@Component({
    selector: ''' , aBLPageMetier getSelector
		,
			''',
    templateUrl: ''./' , aBLPageMetier getHTMLName
		,
			'''
})
export class ' , aBLPageMetier componentName capitalized
		,
			' implements OnInit, OnDestroy {

' , (aBLPageMetier collectPhaseCalled flatCollect: [ :phase | '    public ' , phase name , ': Phase;' , String crlf ]) , (aBLPageMetier recursiveWidgets flattened flatCollect: [ :widget | widget idViewChild ])
		,
			'
' , (aBLPageMetier recursiveWidgets flattened flatCollect: #getVariables)
		,
			'

    constructor(' , aBLPageMetier behaviors
		,
			') {
' , (aBLPageMetier collectPhaseCalled flatCollect: [ :phase | '        this.' , phase name , ' = this._phaseService.getPhase(''' , phase name , ''');' , String crlf ])
		,
			'
    }

    public ngOnInit(): void {
' , (aBLPageMetier recursiveWidgets flattened flatCollect: #getInitializations)
		,
			'
    }

    public ngOnDestroy(): void {

    }
'
		,
			(aBLPageMetier collectPhaseCalled
				ifNotEmpty: [ String crlf
						,
							'    public openPhase(phase: Phase): void {
        this._desktopStateService.selectPhase(phase);
    }' ])
		,
			'

'
	,
			( ((aBLPageMetier recursiveWidgets flattened flatCollect: [:widget | widget actions ]) select: [:action | action behavior isNotEmpty])
				flatCollect: [ :action | action behavior flatCollect: [ :behaveMethod |  '/*', String crlf, (self behaviorModelExporter export: behaveMethod), '*/', String crlf   ]]), 
			'
}
'
]
