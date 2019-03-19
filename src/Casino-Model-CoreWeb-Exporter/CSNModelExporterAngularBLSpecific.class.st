"
I export the Ui model AND the behavioral model to corresponding code
"
Class {
	#name : #CSNModelExporterAngularBLSpecific,
	#superclass : #CSNModelExporterAngular,
	#category : #'Casino-Model-CoreWeb-Exporter'
}

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> behaviorModelExporter [
	^ CSNBehaviorModelExporterCoreWeb
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
				ifNotEmpty:
					[ 'import { DesktopStateService } from ''app/components/service/desktop-state.service'';
import { Phase } from ''app/components/service/model/phase/phase.model'';
import { PhaseService } from ''app/components/service/phase.service'';
' ]) , aBLPageMetier widgetsDependencies
		, aBLPageMetier getBehaviorImportString
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

'
		,
			(aBLPageMetier collectPhaseCalled
				flatCollect: [ :phase | '    public ' , phase name , ': Phase;' , String crlf ])
		,
			(((aBLPageMetier recursiveWidgets flattened
				collect: [ :widget | widget idViewChild ]) asOrderedCollection removeDuplicates) flatten)
		,
			'
'
		, (aBLPageMetier recursiveWidgets flattened flatCollect: #getVariables)
		,
			'

    constructor(' , aBLPageMetier behaviors
		,
			') {
'
		,
			(aBLPageMetier collectPhaseCalled
				flatCollect: [ :phase | 
					'        this.' , phase name , ' = this._phaseService.getPhase('''
						, phase name , ''');' , String crlf ])
		,
			'
    }

    public ngOnInit(): void {
'
		,
			(aBLPageMetier recursiveWidgets flattened
				flatCollect: #getInitializations)
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
			(((aBLPageMetier recursiveWidgets flattened
				flatCollect: [ :widget | widget actions ])
				select: [ :action | action behavior isNotEmpty ])
				flatCollect: [ :action | 
					action behavior
						flatCollect: [ :behaveMethod | 
							'/*' , String crlf , (self behaviorModelExporter export: behaveMethod)
								, '*/' , String crlf ] ])
		,
			'
}
'
]
