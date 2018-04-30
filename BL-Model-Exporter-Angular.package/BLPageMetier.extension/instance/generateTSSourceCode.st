*BL-Model-Exporter-Angular
generateTSSourceCode
	^ '
import {
    Component,
    OnDestroy,
    OnInit
} from ''@angular/core'';'
		,
			(self collectPhaseCalled
				ifNotEmpty: [ 'import { DesktopStateService } from ''../../../../../components/service/desktop-state.service'';
import { Phase } from ''../../../../../components/service/model/phase/phase.model'';
import { PhaseService } from ''../../../../../components/service/phase.service'';' ])
		, String crlf, self widgetsDependencies, 
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
			' , (self collectPhaseCalled flatCollect: [ :phase | 'public ' , phase name , ': Phase;' , String crlf ])
		,
			'

    constructor('
		,
			(self collectPhaseCalled ifNotEmpty: [ 'protected _desktopStateService: DesktopStateService,private _phaseService: PhaseService,' ])
		,
			' ) {
					
				'
		,
			(self collectPhaseCalled
				flatCollect: [ :phase | 'this.' , phase name , '= this._phaseService.getPhase(''' , phase name , ''');' , String crlf ])
		,
			'	
    }

    public ngOnInit(): void {

    }

    public ngOnDestroy(): void {

    }
'
		,
			(self collectPhaseCalled
				ifNotEmpty: [ '     public openPhase(phase: Phase): void {
        this._desktopStateService.selectPhase(phase);
    } ' ])
		,
			'

}'