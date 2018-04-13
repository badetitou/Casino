*BL-Model-Exporter-Angular
generateTSSourceCode
	^ '
import {
    Component,
    OnDestroy,
    OnInit
} from ''@angular/core'';

@Component({
    selector: ''' , self getSelector
		,
			''',
    templateUrl: ''./' , self getHTMLName
		,
			'''
})
export class ' , self componentName
		,
			' implements OnInit, OnDestroy {

    constructor() {
    }

    public ngOnInit(): void {

    }

    public ngOnDestroy(): void {

    }
}'