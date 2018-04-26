*BL-Model-Exporter-Angular
generateTSSourceCode
	^ 'import {
    Component,
    OnDestroy,
    OnInit'
		,
			(self hasMultiplePageMetier
				ifTrue: [ ', ViewChild' ]
				ifFalse: [ '' ])
		,
			'
} from ''@angular/core'';
import { PhaseComponent } from ''../../../../../components/service/model/phase/phase-component.model'';
import { AbstractPhaseComponent } from ''../../../../../components/components/phase/abstract-phase.component'';
import { DesktopStateService } from ''../../../../../components/service/desktop-state.service'';
'
		,
			(self hasMultiplePageMetier
				ifTrue:
					[ 'import { BusinessPageContainerComponent } from ''../../../../../components/components/phase/business-page/page-container/page-container.component'';'
						, String crlf ]
				ifFalse: [ '' ])
		,
			(self metiers
				flatCollect: [ :metier | 'import { ' , metier componentName , ' } from ''../..' , metier getLocalComponentPath , ''';' , String crlf ])
		,
			'


@Component({
    templateUrl: ''./index.component.html''
})
export class IndexComponent extends AbstractPhaseComponent implements PhaseComponent, OnInit, OnDestroy {

'
		,
			(self hasMultiplePageMetier
				ifTrue: [ '@ViewChild(BusinessPageContainerComponent) public container: BusinessPageContainerComponent;
' , String crlf ]
				ifFalse: [ '' ])
		,
			(self hasMultiplePageMetier
				ifTrue: [ self metiers
						flatCollect:
							[ :metier | '@ViewChild(' , metier componentName , ') public ' , metier getAcceptedName , ': ' , metier componentName , ';' , String crlf ] ]
				ifFalse: [ '' ])
		,
			'

    constructor(protected phaseService: DesktopStateService) {
        super(phaseService);
    }

    public ngOnInit(): void {

    }

    public ngOnDestroy(): void {

    }

    public init(): void {

    }
}', String crlf