Extension { #name : #CSNPage }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> generateHTMLSourceCodeDependOfPageMetierWith: anExporter [
	self
		hasMultiplePageMetier
		ifTrue:
			[ ^ self
				generateHTMLSourceCodeForMultiplePageMetierWith: anExporter ].
	self
		hasNoPageMetier
		ifTrue:
			[ ^ self
				generateHTMLSourceCodeForNoPageMetierWith:
					anExporter ].
	^ self
		generateHTMLSourceCodeFor1PageMetier
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> generateHTMLSourceCodeFor1PageMetier [
	^ '<bl-phase-business-page-container>
        <bl-phase-business-page-header>
        </bl-phase-business-page-header>

        <bl-phase-business-page id="P1" title="Page 1">
            ' , (self businessPage at: 1) getTag
		,
			'
        </bl-phase-business-page>
    </bl-phase-business-page-container>'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> generateHTMLSourceCodeForMultiplePageMetierWith: anExporter [
	| text id |
	id := 0.
	text := '<bl-phase-business-pages-tab-container> <!-- (tabSelected)="onTabSelected($event)" -->
        <bl-phase-business-pages-tab-header>
            <div class="save-action">
                <div class="cursor-pointer"> <!-- (click)="save()" -->
                    <bl-icon icon="save"></bl-icon>
                </div>
            </div>
        </bl-phase-business-pages-tab-header>'.
	text := text
		,
			(self sortedPageMetiers
				flatCollect: [ :metier | 
					id := id + 1.
					'
            <bl-phase-business-page-tab id="P' , id asString , '" title="' , ( anExporter protectString:metier title) , '">	' , String crlf , '                ' , metier getTag , String crlf , '            </bl-phase-business-page-tab>'
						, String crlf ]).
	text := text , '    </bl-phase-business-pages-tab-container>'.
	^ text
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> generateHTMLSourceCodeForNoPageMetierWith: anExporter [
	^ (self widgets flatCollect: [ :widget | (anExporter visit: widget) , String crlf ])
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> generateHTMLSourceCodeWith: anExporter [
	^ '<bl-phase-container>
	' , (self generateHTMLSourceCodeDependOfPageMetierWith: anExporter )
		,
			'
</bl-phase-container>'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> generateModuleSourceCodeWith: anExporter [
	^ 'import { NgModule } from ''@angular/core'';
import { CommonModule } from ''@angular/common'';
import { ComponentsModule } from ''../../../components/components.module'';
import { IndexComponent } from ''./components/index/index.component'';
import { PHASE_ROUTES } from ''./' , self name , '.route'';' , String crlf , self widgetsDependenciesImportInstruction
		, (self businessPage flatCollect: [ :aBusinessPage | aBusinessPage getImportStringAndSubBusinessPageImportStringWithLocalPath: '.' ])
		,
			'
export const COMPONENTS: any[] = [
    IndexComponent,
' , self getComponentsPageMetierListName
		,
			'
];

@NgModule({
    declarations: [
        COMPONENTS
    ],
    imports: [
        CommonModule,
        PHASE_ROUTES,
' , self widgetsDependenciesName
		,
			'
        ComponentsModule
    ],
    entryComponents: [
        IndexComponent
    ]
})
export class ' , self getModuleClassName , ' {}' , String crlf
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> generateRouteSourceCode [
	^ 'import { ModuleWithProviders } from ''@angular/core'';
import { RouterModule, Routes } from ''@angular/router'';
import { IndexComponent } from ''./components/index/index.component'';

const routes: Routes = [
    {
        path: '''', component: IndexComponent
    }
];

export const PHASE_ROUTES: ModuleWithProviders = RouterModule.forChild(routes);
'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> generateTSSourceCode [
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
				ifTrue: [ 'import { BusinessPageContainerComponent } from ''../../../../../components/components/phase/business-page/page-container/page-container.component'';' , String crlf ]
				ifFalse: [ '' ]) , (self businessPage flatCollect: [ :metier | 'import { ' , metier componentName , ' } from ''../..' , metier getLocalComponentPath , ''';' , String crlf ])
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
				ifTrue: [ self businessPage flatCollect: [ :metier | '@ViewChild(' , metier componentName , ') public ' , metier getAcceptedName , ': ' , metier componentName , ';' , String crlf ] ]
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
}' , String crlf
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getComponentsPageMetierListName [
	^ self recursiveMetiers flattened flatCollect: [ :metier | '    ', metier componentName, ',', String crlf ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getHTMLName [
	^ 'index.component.html'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getLocalComponentPath [
	^ self getLocalPath  , '/' , self name , '.component'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getLocalModulePath [
	^ self name, '/' , self name , '.module#' , self getModuleClassName
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getLocalPath [
	^ ''
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getMetadata [
	" asString :
{ 
    id: 'phase1_2',
    code: 'phase1',
    label: 'Phase 1 - 2',
    link: 'phase1',
    subLabel: 'Bienvenue sur la phase 1 - 2',
    icon: 'address-book',
    datas: {'text': '2'}
}
   "

	^ '{
    id: ''' , self name ,''',
    code: ''' , self name,''',
    label: ''' , (self title ifNil: ['']) protectQuote ,''',
    link: ''' , self name,''',
    subLabel: ''' , (self subtitle ifNil: ['']) protectQuote, ''',
    icon: ''address-book'',
    datas: {},
}'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getModuleClassName [
	^ self name capitalized , 'Module'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getModuleName [
	^ self name , '.module.ts'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getRouteName [
	^ self name , '.route.ts'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getSelector [
	^ 'bl-' , self mooseModel name , '-' , self name
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getTSName [ 
	^ 'index.component.ts'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getTag [
	^ '<' , self getSelector , '>' , '</' , self getSelector , '>'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> rootFromExporter: anExporter [
	^ anExporter rootPhases / self name
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> sortedPageMetiers [
	^ self businessPage asOrderedCollection
		sort: [ :pageMetier1 :pageMetier2 | pageMetier1 addingPosition < pageMetier2  addingPosition ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> widgetsDependencies [
	"At the level of the Phase, we don't need recursive external import (for the module file)... It's only in the TS file"

	^ ((self recursiveMetiers collect: #recursiveWidgets) flattened collect: #getExternalDependency)
		flattened asSet asOrderedCollection
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> widgetsDependenciesImportInstruction [
	^ ''
		,
			(self widgetsDependencies
				flatCollect: [ :dependency | dependency importString , String crlf ])
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> widgetsDependenciesName [
	^ ''
		,
			(self widgetsDependencies 
				flatCollect: [ :dependency | '        ', dependency moduleName , ',' , String crlf ])
]
