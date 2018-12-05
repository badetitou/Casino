Extension { #name : #BLPage }

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> generateHTMLSourceCodeDependOfPageMetierWith: anExporter [
	self hasMultiplePageMetier
		ifTrue: [ ^ self generateHTMLSourceCodeForMultiplePageMetier ].
	self hasNoPageMetier
		ifTrue: [ 
			^ self generateHTMLSourceCodeForNoPageMetierWith: anExporter  ].
	^ self generateHTMLSourceCodeFor1PageMetier
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> generateHTMLSourceCodeFor1PageMetier [
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

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> generateHTMLSourceCodeForMultiplePageMetier [
	| text id |
	id := 0.
	text := '<bl-phase-business-pages-tab-container (tabSelected)="onTabSelected($event)">
        <bl-phase-business-pages-tab-header>
            <div class="save-action">
                <div class="cursor-pointer" (click)="save()">
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
            <bl-phase-business-page-tab id="P' , id asString , '" title="' , metier title
						, '">	' , String crlf , '                ' , metier getTag , String crlf
						, '            </bl-phase-business-page-tab>' , String crlf ]).
	text := text , '    </bl-phase-business-pages-tab-container>'.
	^ text
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> generateHTMLSourceCodeForNoPageMetierWith: anExporter [
	^ (self widgets flatCollect: [ :widget | (anExporter visit: widget) , String crlf ])
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> generateHTMLSourceCodeWith: anExporter [
	^ '<bl-phase-container>
	' , (self generateHTMLSourceCodeDependOfPageMetierWith: anExporter )
		,
			'
</bl-phase-container>'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> generateModuleSourceCode [
	| text |
	text := 'import { NgModule } from ''@angular/core'';
import { CommonModule } from ''@angular/common'';
import { ComponentsModule } from ''../../../components/components.module'';
import { IndexComponent } from ''./components/index/index.component'';
import { PHASE_ROUTES } from ''./' , self name , '.route'';' , String crlf
		, self widgetsDependenciesImportInstruction.
	text := text
		,
			(self recursiveMetiers flattened
				flatCollect: [ :metier | 
					'import { ' , metier componentName , ' } from ''.' , metier getLocalComponentPath , ''';'
						, String crlf ]).
	text := text
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
',  self widgetsDependenciesName, '
        ComponentsModule
    ],
    entryComponents: [
        IndexComponent
    ]
})
export class ' , self getModuleClassName , ' {}'.
	^ text , String crlf
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> generateRouteSourceCode [
	^ 'import { ModuleWithProviders } from ''@angular/core'';
import { RouterModule, Routes } from ''@angular/router'';
import { IndexComponent } from ''./components/index/index.component'';

const routes: Routes = [
    {
        path: '''', component: IndexComponent
    }
];

export const PHASE_ROUTES: ModuleWithProviders = RouterModule.forChild(routes);
', String crlf
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> generateTSSourceCode [
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

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> getComponentsPageMetierListName [
	^ self recursiveMetiers flattened flatCollect: [ :metier | '    ', metier componentName, ',', String crlf ]
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> getHTMLName [
	^ 'index.component.html'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> getLocalComponentPath [
	^ self getLocalPath  , '/' , self name , '.component'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> getLocalModulePath [
	^ self name, '/' , self name , '.module#' , self getModuleClassName
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> getLocalPath [
	^ ''
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> getMetadata [
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

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> getModuleClassName [
	^ self name capitalized , 'Module'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> getModuleName [
	^ self name , '.module.ts'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> getRouteName [
	^ self name , '.route.ts'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> getSelector [
	^ 'bl-' , self mooseModel name , '-' , self name
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> getTSName [ 
	^ 'index.component.ts'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> getTag [
	^ '<' , self getSelector , '>' , '</' , self getSelector , '>'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> relativePathToHome [
	^ '../../'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> rootFromExporter: anExporter [
	^ anExporter rootPhases / self name
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> sortedPageMetiers [
	^ self businessPage asOrderedCollection
		sort: [ :pageMetier1 :pageMetier2 | pageMetier1 addingPosition < pageMetier2  addingPosition ]
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> widgetsDependencies [
	"At the level of the Phase, we don't need recursive external import (for the module file)... It's only in the TS file"

	^ ((self recursiveMetiers collect: #recursiveWidgets) flattened collect: #getExternalDependency)
		flattened asSet asOrderedCollection
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> widgetsDependenciesImportInstruction [
	^ ''
		,
			(self widgetsDependencies
				flatCollect: [ :dependency | dependency importString , String crlf ])
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPage >> widgetsDependenciesName [
	^ ''
		,
			(self widgetsDependencies 
				flatCollect: [ :dependency | '        ', dependency moduleName , ',' , String crlf ])
]
