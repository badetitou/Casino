*BL-Model-Exporter-Angular
generateTSSourceCode
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
			(self collectPhaseCalled
				ifNotEmpty: [ 'import { DesktopStateService } from ''../../../../../components/service/desktop-state.service'';
import { Phase } from ''../../../../../components/service/model/phase/phase.model'';
import { PhaseService } from ''../../../../../components/service/phase.service'';
' ]) , self widgetsDependencies
		,
			'

@Component({
    selector: ''' , self getSelector
		,
			''',
    templateUrl: ''./' , self getHTMLName
		,
			'''
})
export class ' , self componentName capitalized
		,
			' implements OnInit, OnDestroy {

' , (self collectPhaseCalled flatCollect: [ :phase | '    public ' , phase name , ': Phase;' , String crlf ])
		, (self recursiveWidgets flatCollect: [ :widget | widget idViewChild ])
		,
			'
' , (self recursiveWidget flattened flatCollect: #getVariables)
		,
			'

    constructor('
		,
			(self collectPhaseCalled
				ifNotEmpty: [ 'protected _desktopStateService: DesktopStateService, private _phaseService: PhaseService, ' ])
		,
			') {
'
		,
			(self collectPhaseCalled
				flatCollect: [ :phase | '        this.' , phase name , ' = this._phaseService.getPhase(''' , phase name , ''');' , String crlf ])
		,
			'
    }

    public ngOnInit(): void {
' , (self recursiveWidget flattened flatCollect: #getInitializations)
		,
			'
    }

    public ngOnDestroy(): void {

    }
'
		,
			(self collectPhaseCalled
				ifNotEmpty: [ String crlf, '    public openPhase(phase: Phase): void {
        this._desktopStateService.selectPhase(phase);
    }' ])
		,
			'

' , ((self recursiveWidgets flatCollect: #attributes) flatCollect: [ :attribute | attribute attributeMethod ])
		,
			'}
'