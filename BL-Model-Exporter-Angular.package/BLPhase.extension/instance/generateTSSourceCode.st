*BL-Model-Exporter-Angular
generateTSSourceCode
	^'@Component({
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
}'.