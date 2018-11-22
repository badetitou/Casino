Extension { #name : #MooseModel }

{ #category : #'*BL-Model-Exporter-Angular' }
MooseModel >> appName [
	^ 'PHASE_INCUBATOR_HOME'
]

{ #category : #'*BL-Model-Exporter-Angular' }
MooseModel >> generateHTMLSourceCode [
	^ '<bl-layout>
    <bl-desktop [homePhase]="phaseHome"></bl-desktop>
</bl-layout>'
]

{ #category : #'*BL-Model-Exporter-Angular' }
MooseModel >> generateModuleSourceCode [
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
(self allBLService flatCollect: [ :service | 'import { ', service uniqueName, ' } from ''./', service getLocalPath ,''';', String crlf  ] ) 
,'

export const phases: Phase[] = [
' , (self allBLPage flatCollect: [ :blPhase | blPhase getMetadata , ',' , String crlf ])
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
', (self allBLService flatCollect: [:service | '        ', service uniqueName, ',', String crlf]),
        '        { provide: PHASES, useValue: phases } as Provider
    ]
})
export class ' , self name capitalized , 'Module { }'
]

{ #category : #'*BL-Model-Exporter-Angular' }
MooseModel >> generateRouteSourceCode [
	| text |
	text := 'import { ModuleWithProviders } from ''@angular/core'';
import { Routes, RouterModule, PreloadAllModules } from ''@angular/router'';
import { IndexComponent } from ''./components/index/index.component'';

const routes: Routes = [
	{ path: '''', pathMatch: ''full'', redirectTo: ''desktop'' },
	{ path: ''desktop'', component: IndexComponent, children: [' , String crlf.
	text := text
		,
			(self allBLPage
				flatCollect: [ :phase | 
					'		{ path: ''' , phase name , ''', loadChildren: ''./phases/' , phase getLocalModulePath
						, '''},' , String crlf ]).
	text := text
		,
			']}
];
export const DEMOS_ROUTES: ModuleWithProviders = RouterModule.forRoot(routes, { useHash: false });'.
	^ text
]

{ #category : #'*BL-Model-Exporter-Angular' }
MooseModel >> generateTSSourceCode [
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
]

{ #category : #'*BL-Model-Exporter-Angular' }
MooseModel >> getHTMLName [
	^ 'index.component.html'
]

{ #category : #'*BL-Model-Exporter-Angular' }
MooseModel >> getModuleName [
	^ self name , '.module.ts'
]

{ #category : #'*BL-Model-Exporter-Angular' }
MooseModel >> getRouteName [
	^ self name , '.routing.ts'
]

{ #category : #'*BL-Model-Exporter-Angular' }
MooseModel >> getTSName [
	^ 'index.component.ts'
]
