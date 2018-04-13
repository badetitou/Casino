*BL-Model-Exporter-Angular
generateTSSourceCode
	^ 'import {
    Component,
    OnDestroy,
    OnInit
} from ''@angular/core'';
import { PhaseComponent } from ''../../../../../components/service/model/phase/phase-component.model'';
import { AbstractPhaseComponent } from ''../../../../../components/components/phase/abstract-phase.component'';
import { DesktopStateService } from ''../../../../../components/service/desktop-state.service'';

@Component({
    templateUrl: ''./index.component.html''
})
export class IndexComponent extends AbstractPhaseComponent implements PhaseComponent, OnInit, OnDestroy {

    constructor(protected phaseService: DesktopStateService) {
        super(phaseService);
    }

    public ngOnInit(): void {

    }

    public ngOnDestroy(): void {

    }

    public init(): void {

    }
}'