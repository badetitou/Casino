*BL-Model-Exporter-Angular
generateTSSourceCode
	^ 'import { Component, OnInit } from ''@angular/core'';
import { Phase } from ''../../../components/service/model/phase/phase.model'';

import { PhaseService } from ''../../../components/service/phase.service'';

@Component({
    selector: ''app-index'',
    templateUrl: ''./index.component.html''
})
export class IndexComponent implements OnInit {

    public phaseHome: Phase;

    constructor(private _phaseService: PhaseService) {
        this.phaseHome = this._phaseService.getPhase(''', self appName, ''');
    }

    public ngOnInit(): void {

    }
}
'