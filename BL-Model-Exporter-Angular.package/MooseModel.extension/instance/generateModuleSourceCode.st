*BL-Model-Exporter-Angular
generateModuleSourceCode
	^ 'import { NgModule, Provider } from ''@angular/core'';
import { BrowserModule } from ''@angular/platform-browser'';
import { FormsModule } from ''@angular/forms'';
import { BrowserAnimationsModule } from ''@angular/platform-browser/animations'';
import { ToastrModule } from ''ngx-toastr'';

import { DEMOS_ROUTES } from ''./' , self name
		,
			'.routing'';
import { IndexComponent } from ''./components/index/index.component'';
import { ComponentsModule } from ''../components/components.module'';
import { TranslateModule } from ''@ngx-translate/core'';
import { Phase, PHASES } from ''../components/service/model/phase/phase.model'';
',
(self allBLService flatCollect: [ :service | 'import { ', service name, ' } from ''./', service getLocalPath ,''';', String crlf  ] ) 
,'

export const phases: Phase[] = [
' , (self allBLPhase flatCollect: [ :blPhase | blPhase getMetadata , ',' , String crlf ])
		,
			'
];

@NgModule({
    imports: [
        BrowserModule,
        FormsModule,
        BrowserAnimationsModule,
        ComponentsModule.forRoot(),
        ToastrModule.forRoot({
            positionClass: ''toast-bottom-right''
        }),

        DEMOS_ROUTES,

        TranslateModule
    ],
    declarations: [
        IndexComponent
    ],
    providers: [
', (self allBLService flatCollect: [:service | '    ', service name, ',', String crlf]),
        '    { provide: PHASES, useValue: phases } as Provider
    ]
})
export class ' , self name capitalized , 'Module { }'