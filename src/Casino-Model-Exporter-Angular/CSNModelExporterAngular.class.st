"
""LOAD FAST""

""Reset Work""
MooseModel resetRoot.
MooseModel resetMeta.
BLMetamodelGenerator resetMetamodel.


""Generate BlApp""
mooseModel := MooseModel importFromMSEStream:  'D:\Users\benoit.verhaeghe\Documents\PFE\GeneralXmlui.mse' asFileReference readStream.
mooseModel rootFolder: 'D:\Users\benoit.verhaeghe\Documents\PFE\'.

""Generate Bl Model""
model := MooseModel new name: 'Showroom'; yourself.
BLMooseModelCreatorAngular runOn: model fromSourceModel: mooseModel and:  'D:\Users\benoit.verhaeghe\Documents\PFE\Source\BLCoreIncubatorGwt\src\fr\bl\application.module.xml'.

BLGlobalView new openViewForModel: model.

""Add Model to moose panel""
MooseModel root add: model.

model := BLModelExample generateModelWithTwoPhasesAndThreePageMetierAnd1Widget.
BLModelExporterAngular export: model.
"
Class {
	#name : #CSNModelExporterAngular,
	#superclass : #CSNModelExporter,
	#instVars : [
		'currentPath'
	],
	#category : #'Casino-Model-Exporter-Angular'
}

{ #category : #actions }
CSNModelExporterAngular class >> convertIfString: anObject [
	anObject isString
		ifTrue: [ ^ '"' , anObject , '"' ].
	^ anObject 
]

{ #category : #accessing }
CSNModelExporterAngular >> currentPath [
	^ currentPath 
]

{ #category : #accessing }
CSNModelExporterAngular >> currentPath: anObject [
	currentPath := anObject
]

{ #category : #visiting }
CSNModelExporterAngular >> generateHTMLSourceCodeDependOfPageMetierForPage: aCSNPage [
	aCSNPage hasMultiplePageMetier
		ifTrue:
			[ ^ self generateHTMLSourceCodeForMultiplePageMetierForPage: aCSNPage ].
	aCSNPage hasNoPageMetier
		ifTrue:
			[ ^ self generateHTMLSourceCodeForNoPageMetierForPage: aCSNPage ].
	^ self generateHTMLSourceCodeFor1PageMetierForPage: aCSNPage
]

{ #category : #visiting }
CSNModelExporterAngular >> generateHTMLSourceCodeFor1PageMetierForPage: aCSNPage [
^ '<bl-phase-business-page-container>
        <bl-phase-business-page-header>
        </bl-phase-business-page-header>

        <bl-phase-business-page id="P1" title="Page 1">
            ' , aCSNPage businessPage anyOne getTag
		,
			'
        </bl-phase-business-page>
    </bl-phase-business-page-container>'
]

{ #category : #generate }
CSNModelExporterAngular >> generateHTMLSourceCodeForBusinessPage: aBLPageMetier [
	^ (aBLPageMetier metiers
		ifNotEmpty: [ '<bl-tabs>' , String crlf
				,
					(aBLPageMetier metiers
						flatCollect:
							[ :metier | '    <bl-tab title=' , (self class convertIfString: (self protectString: metier title)) , '>' , String crlf , '        ' , metier getTag , String crlf , '    </bl-tab>' , String crlf ])
				, '</bl-tabs>' , String crlf ]
		ifEmpty: [ '' ]) , ((aBLPageMetier widgets reject: [ :widget | widget isPageMetier ]) flatCollect: [ :widget | (self visit: widget) , String crlf ])
]

{ #category : #generate }
CSNModelExporterAngular >> generateHTMLSourceCodeForModel: aModel [
	^ '<bl-layout>
    <bl-desktop [homePhase]="phaseHome"></bl-desktop>
</bl-layout>'
]

{ #category : #visiting }
CSNModelExporterAngular >> generateHTMLSourceCodeForMultiplePageMetierForPage: aCSNPage [
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
			(aCSNPage sortedPageMetiers
				flatCollect: [ :metier | 
					id := id + 1.
					'
            <bl-phase-business-page-tab id="P' , id asString
						, '" title="' , (self protectString: metier title) , '">	'
						, String crlf , '                ' , metier getTag , String crlf
						, '            </bl-phase-business-page-tab>' , String crlf ]).
	text := text , '    </bl-phase-business-pages-tab-container>'.
	^ text
]

{ #category : #visiting }
CSNModelExporterAngular >> generateHTMLSourceCodeForNoPageMetierForPage: aCSNPage [
	^ aCSNPage widgets
		flatCollect: [ :widget | (self visit: widget) , String crlf ]
]

{ #category : #visiting }
CSNModelExporterAngular >> generateHTMLSourceCodeForPage: aBLPhase [
	^ '<bl-phase-container>
	' , (self generateHTMLSourceCodeDependOfPageMetierForPage: aBLPhase )
		,
			'
</bl-phase-container>'
]

{ #category : #generate }
CSNModelExporterAngular >> generateModuleSourceCodeForModel: aModel [
	^ 'import { NgModule, Provider } from ''@angular/core'';
import { BrowserModule } from ''@angular/platform-browser'';
import { FormsModule } from ''@angular/forms'';
import { BrowserAnimationsModule } from ''@angular/platform-browser/animations'';
import { ToastrModule } from ''ngx-toastr'';

import { DEMOS_ROUTES } from ''./' , aModel name
		,
			'.routing'';
import { IndexComponent } from ''./components/index/index.component'';
import { ComponentsModule } from ''../components/components.module'';
import { TranslateModule } from ''@ngx-translate/core'';
import { Phase, PHASES } from ''../components/service/model/phase/phase.model'';
'
		,
			(aModel allCSNService
				flatCollect: [ :service | 
					'import { ' , service uniqueName , ' } from ''./'
						, service getLocalPath , ''';' , String crlf ])
		,
			'

export const phases: Phase[] = [
'
		,
			(aModel allCSNPage
				flatCollect: [ :blPhase | blPhase getMetadata , ',' , String crlf ])
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
'
		,
			(aModel allCSNService
				flatCollect: [ :service | '        ' , service uniqueName , ',' , String crlf ])
		,
			'        { provide: PHASES, useValue: phases } as Provider
    ]
})
export class ' , aModel name capitalized , 'Module { }'
]

{ #category : #generate }
CSNModelExporterAngular >> generateModuleSourceCodeForPage: aCSNPage [
	^ 'import { NgModule } from ''@angular/core'';
import { CommonModule } from ''@angular/common'';
import { ComponentsModule } from ''../../../components/components.module'';
import { IndexComponent } from ''./components/index/index.component'';
import { PHASE_ROUTES } from ''./' , aCSNPage name , '.route'';'
		, String crlf , aCSNPage widgetsDependenciesImportInstruction
		,
			(aCSNPage businessPage
				flatCollect: [ :aBusinessPage | 
					aBusinessPage
						getImportStringAndSubBusinessPageImportStringWithLocalPath: '.' ])
		,
			'
export const COMPONENTS: any[] = [
    IndexComponent,
' , aCSNPage getComponentsPageMetierListName
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
' , aCSNPage widgetsDependenciesName
		,
			'
        ComponentsModule
    ],
    entryComponents: [
        IndexComponent
    ]
})
export class ' , aCSNPage getModuleClassName , ' {}' , String crlf
]

{ #category : #generate }
CSNModelExporterAngular >> generateRouteSourceCode [
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

{ #category : #generate }
CSNModelExporterAngular >> generateRouteSourceCodeForModel: aModel [
	| text |
	text := 'import { ModuleWithProviders } from ''@angular/core'';
import { Routes, RouterModule, PreloadAllModules } from ''@angular/router'';
import { IndexComponent } from ''./components/index/index.component'';

const routes: Routes = [
	{ path: '''', pathMatch: ''full'', redirectTo: ''desktop'' },
	{ path: ''desktop'', component: IndexComponent, children: ['
		, String crlf.
	text := text
		,
			(aModel allCSNPage
				flatCollect: [ :phase | 
					'		{ path: ''' , phase name , ''', loadChildren: ''./phases/'
						, phase getLocalModulePath , '''},' , String crlf ]).
	text := text
		,
			']}
];
export const DEMOS_ROUTES: ModuleWithProviders = RouterModule.forRoot(routes, { useHash: false });'.
	^ text
]

{ #category : #generate }
CSNModelExporterAngular >> generateRouteSourceCodeForPage [
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

{ #category : #generate }
CSNModelExporterAngular >> generateTSSourceCodeForBusinessPage: aBLPageMetier [
	^ '
import {
    Component,
    OnDestroy,
    OnInit,
    ViewChild,
    ViewContainerRef
} from ''@angular/core'';
'
		,
			(aBLPageMetier collectPhaseCalled
				ifNotEmpty: [ 'import { DesktopStateService } from ''app/components/service/desktop-state.service'';
import { Phase } from ''app/components/service/model/phase/phase.model'';
import { PhaseService } from ''app/components/service/phase.service'';
' ]) , aBLPageMetier widgetsDependencies , 
			'

@Component({
    selector: ''' , aBLPageMetier getSelector
		,
			''',
    templateUrl: ''./' , aBLPageMetier getHTMLName
		,
			'''
})
export class ' , aBLPageMetier componentName capitalized
		,
			' implements OnInit, OnDestroy {

' , (aBLPageMetier collectPhaseCalled flatCollect: [ :phase | '    public ' , phase name , ': Phase;' , String crlf ])
		, (aBLPageMetier recursiveWidgets flattened flatCollect: [ :widget | widget idViewChild ])
		,
			'
' , (aBLPageMetier recursiveWidgets flattened flatCollect: #getVariables)
		,
			'

    constructor(' , aBLPageMetier behaviors
		,
			') {
' , (aBLPageMetier collectPhaseCalled flatCollect: [ :phase | '        this.' , phase name , ' = this._phaseService.getPhase(''' , phase name , ''');' , String crlf ])
		,
			'
    }

    public ngOnInit(): void {
' , (aBLPageMetier recursiveWidgets flattened flatCollect: #getInitializations)
		,
			'
    }

    public ngOnDestroy(): void {

    }
'
		,
			(aBLPageMetier collectPhaseCalled
				ifNotEmpty: [ String crlf
						,
							'    public openPhase(phase: Phase): void {
        this._desktopStateService.selectPhase(phase);
    }' ])
		,
			'

'
		,
			'
}
'
	",
			((self recursiveWidgets flatCollect: #attributes)
				flatCollect: [ :attribute | attribute attributeMethod ])"
]

{ #category : #generate }
CSNModelExporterAngular >> generateTSSourceCodeForModel: aModel [
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
        this.phaseHome = this._phaseService.getPhase(''PHASE_INCUBATOR_HOME'');
    }

    public ngOnInit(): void {

    }
}
'
]

{ #category : #generate }
CSNModelExporterAngular >> generateTSSourceCodeForPage: aCSNPage [
	^ 'import {
    Component,
    OnDestroy,
    OnInit'
		,
			(aCSNPage hasMultiplePageMetier
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
			(aCSNPage hasMultiplePageMetier
				ifTrue: [ 'import { BusinessPageContainerComponent } from ''../../../../../components/components/phase/business-page/page-container/page-container.component'';' , String crlf ]
				ifFalse: [ '' ]) , (aCSNPage businessPage flatCollect: [ :metier | 'import { ' , metier componentName , ' } from ''../..' , metier getLocalComponentPath , ''';' , String crlf ])
		,
			'


@Component({
    templateUrl: ''./index.component.html''
})
export class IndexComponent extends AbstractPhaseComponent implements PhaseComponent, OnInit, OnDestroy {

'
		,
			(aCSNPage hasMultiplePageMetier
				ifTrue: [ '@ViewChild(BusinessPageContainerComponent) public container: BusinessPageContainerComponent;
' , String crlf ]
				ifFalse: [ '' ])
		,
			(aCSNPage hasMultiplePageMetier
				ifTrue: [ aCSNPage businessPage flatCollect: [ :metier | '@ViewChild(' , metier componentName , ') public ' , metier getAcceptedName , ': ' , metier componentName , ';' , String crlf ] ]
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

{ #category : #api }
CSNModelExporterAngular >> prepareExport [
	context := CSNContext new root: (FileSystem disk workingDirectory / model name) asFileReference; yourself.
]

{ #category : #api }
CSNModelExporterAngular >> protectString: aString [
	^ ((aString copyReplaceAll: '"' with: '&quot;') copyReplaceAll: '<' with: '&lt;') copyReplaceAll: '>' with: '&gt;' 
]

{ #category : #accessing }
CSNModelExporterAngular >> rootPhases [
	^ self root / 'phases'
]

{ #category : #accessing }
CSNModelExporterAngular >> serviceRoot [
	^ self root / 'services'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitAttribute: aBLAttribute [
	^ self protectString: aBLAttribute attributeValue asString
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCell: aBLCell [
	^ self visit: (aBLCell widget ifNil: [ ^ '' ])
]

{ #category : #visiting }
CSNModelExporterAngular >> visitHTML: aBLHTML [
	^ '', (aBLHTML widgets flatCollect: [ :widget | String crlf , (self visit: widget) , String crlf ])
]

{ #category : #visiting }
CSNModelExporterAngular >> visitLayout: aBLLayout [
	^ '<' , (aBLLayout container getListPropertiesAsStringWith: self) , '>'
		,
			(''
				,
					({aBLLayout container widgets.
					(aBLLayout cell)} flatten
						flatCollect: [ :widget | String crlf , (self visit: widget) ])
				indentBy: 4) , String crlf, '</' , aBLLayout container getSelector , '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitMooseModel: aMooseModel [
	| rootPhases rootComponents |
	self root createDirectory.
	"Write app.module.ts"
	self
		writeFile: self root / aMooseModel getModuleName
		withCode: (self generateModuleSourceCodeForModel: aMooseModel).
	"Write app.route.ts"
	self
		writeFile: self root / aMooseModel getRouteName
		withCode: (self generateRouteSourceCodeForModel: aMooseModel).
	"Write components"
	rootComponents := self root / 'components' / 'index'.
	rootComponents ensureCreateDirectory.
	self
		writeFile: rootComponents / aMooseModel getHTMLName
		withCode: (self generateHTMLSourceCodeForModel: aMooseModel).
	self
		writeFile: rootComponents / aMooseModel getTSName
		withCode: (self generateTSSourceCodeForModel: aMooseModel).
	rootPhases := self root / 'phases'.
	rootPhases createDirectory.
	aMooseModel allCSNPage
		do: [ :aPage | 
			self clone
				currentPath: self rootPhases / aPage name;
				visit: aPage ].
	aMooseModel allCSNService
		do: [ :rootElement | self visit: rootElement ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitPage: aBLPhase [
	| phaseRoot componentsRoot indexRoot |
	phaseRoot := self currentPath.
	phaseRoot ensureCreateDirectory.
	"Write phase.module.ts"
	self
		writeFile: phaseRoot / aBLPhase getModuleName
		withCode: (self generateModuleSourceCodeForPage: aBLPhase).
	"Write phase.route.ts"
	self
		writeFile: phaseRoot / aBLPhase getRouteName
		withCode: self generateRouteSourceCodeForPage.
	"Write components"
	componentsRoot := self currentPath / 'components'.
	componentsRoot ensureCreateDirectory.
	indexRoot := componentsRoot / 'index'.
	indexRoot ensureCreateDirectory.
	self
		writeFile: indexRoot / aBLPhase getTSName
		withCode: (self generateTSSourceCodeForPage: aBLPhase).
	self
		writeFile: indexRoot / aBLPhase getHTMLName
		withCode: (self generateHTMLSourceCodeForPage: aBLPhase).
	aBLPhase businessPage
		do: [ :metier | 
			self clone
				currentPath: componentsRoot / metier getAcceptedName;
				visit: metier ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitPageMetier: aBLPageMetier [
	| pageMetierRoot |
	pageMetierRoot := self currentPath.
	[ pageMetierRoot ensureCreateDirectory ]
		on: DirectoryExists
		do: [  ].
	"Write pageMetier.module.ts"
	self writeFile: pageMetierRoot / aBLPageMetier getHTMLName withCode: (self generateHTMLSourceCodeForBusinessPage: aBLPageMetier).
	"Write pageMetier.route.ts"
	self writeFile: pageMetierRoot / aBLPageMetier getTSName withCode: (self generateTSSourceCodeForBusinessPage: aBLPageMetier).
	aBLPageMetier metiers
		do: [ :metier | 
			self class new
				currentPath: pageMetierRoot / 'components' / metier getFolderName;
				visit: metier ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitSplitButton: aBLSplitButton [
	^  '<' , (aBLSplitButton getListPropertiesAsStringWith: self) , '></' , aBLSplitButton getSelector , '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIAbsoluteHeight: aBLUIAbsoluteHeight [
	^ self protectString: aBLUIAbsoluteHeight attributeValue, 'px'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIAbsoluteWidth: aBLUIAbsoluteWidth [
	^ self protectString: aBLUIAbsoluteWidth attributeValue , 'px'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIContainer: aBLUIContainer [
	^ aBLUIContainer layout
		ifNotNil: [ :layout | self visit: layout ]
		ifNil: [ '<' , (aBLUIContainer getListPropertiesAsStringWith: self) , '>'
				,
					(''
						,
							(aBLUIContainer widgets
								flatCollect: [ :widget | String crlf , (self visit: widget) , String crlf ])
						indentBy: 4), String crlf, '</' , aBLUIContainer getSelector , '>' ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIGridLayout: aBLUIGridLayout [
	^ '<' , (aBLUIGridLayout container getListPropertiesAsStringWith: self)
		,
			'>
	<tbody>' , String crlf
		,
			(''
				,
					((0 to: aBLUIGridLayout maxLevel)
						flatCollect: [ :number | 
							'<tr>'
								,
									(((aBLUIGridLayout atLevelSorted: number) reject: #isNil)
										flatCollect: [ :cell | (String crlf , '<td' , ((cell attributesTagWith: self) , '>' , String crlf , ((self visit: cell) indentBy: 4) , String crlf , '</td>') indentBy: 4) , String crlf ])
								, '</tr>' , String crlf ]) indentBy: 8)
		,
			'
    </tbody>
</' , aBLUIGridLayout container getSelector , '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIHeight: aBLUIHeight [
	^ self protectString: aBLUIHeight attributeValue 
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIImage: aBLUIImage [
	^   '<' ,  (aBLUIImage getListPropertiesAsStringWith: self) , ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIInputColor: aBLUIInputColor [
	^ '<' ,  (aBLUIInputColor getListPropertiesAsStringWith: self), ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIInputDate: aBLUIInputDate [
	^ '<' ,  (aBLUIInputDate getListPropertiesAsStringWith: self), ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIInputFile: aBLUIInputFile [
	^ '<' , (aBLUIInputFile getListPropertiesAsStringWith: self) , ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIInputMonth: aBLUIInputMonth [
	^ '<'
		,
			(aBLUIInputMonth
				getListPropertiesAsStringWith: self)
		,
			' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIInputNumber: aBLUIInputNumber [
	^ '<' ,  (aBLUIInputNumber getListPropertiesAsStringWith: self), ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIInputPassword: aBLUIInputPassword [
	^ '<' ,  (aBLUIInputPassword getListPropertiesAsStringWith: self) , ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIInputText: aBLUIInputText [
	^  '<input id="float-' , aBLUIInputText mooseID asString , '" type="text" value="' , aBLUIInputText value1
		,
			'" placeholder="', aBLUIInputText text,'" pInputText>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIInputTime: aBLUIInputTime [
	^ '<' , (aBLUIInputTime getListPropertiesAsStringWith: self) , ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUILabel: aBLUILabel [
	^ self protectString: aBLUILabel attributeValue
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUILeaf: aBLUILeaf [
	^ '<' , (aBLUILeaf getListPropertiesAsStringWith: self) , '>'
		, ((aBLUILeaf attributes select: [ :a | a isKindOf: CSNUILabel ]) flatCollect: [ :attribute | String crlf , ((self visit: attribute) indentBy: 4) , String crlf ]) , '</' , aBLUILeaf getSelector , '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIName: aBLUIName [
	^ self protectString: aBLUIName attributeValue 
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIPanel: aBLUIPanel [
	^ aBLUIPanel layout
		ifNotNil: [ :layout | self visit: layout ]
		ifNil: [ '<' , (aBLUIPanel getListPropertiesAsStringWith: self) , '>'
				,
					(''
						,
							(aBLUIPanel widgets
								flatCollect: [ :widget | String crlf , (self visit: widget) ])
						indentBy: 4) , String crlf, '</' , aBLUIPanel getSelector , '>' ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIParagraph: aBLUIParagraph [
	^ '<' , (aBLUIParagraph getListPropertiesAsStringWith: self) , '>'
		, (( aBLUIParagraph attributes select: [ :a | a isKindOf: CSNUILabel])
				flatCollect:
					[ :attribute | String crlf , ((self visit: attribute ) indentBy: 4), String crlf ]) 
		, '</' , aBLUIParagraph getSelector , '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIPlaceholder: aBLUIPlaceholder [
	^ self protectString: aBLUIPlaceholder attributeValue
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIRelativeHeight: aBLUIRelativeHeight [
	^ self protectString: aBLUIRelativeHeight attributeValue , '%'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIRelativeWidth: aBLUIRelativeWidth [
	^ self protectString: aBLUIRelativeWidth attributeValue , '%'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUISelect: aBLUISelect [
	^ '<' , (aBLUISelect getListPropertiesAsStringWith: self) , '>', String crlf , '</' , aBLUISelect getSelector , '>' 
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUITitle: aBLUITitle [
	^ self protectString: aBLUITitle attributeValue 
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIWidth: aBLUIWidth [
	^ self protectString: aBLUIWidth attributeValue 
]

{ #category : #visiting }
CSNModelExporterAngular >> visitWidget: aBLWidget [
	^ '<' , (aBLWidget getListPropertiesAsStringWith: self) , '>'
		, (('',
			(( aBLWidget widgets)
				flatCollect:
					[ :widget | String crlf , (self visit: widget), String crlf ])) indentBy: 4)
		, '</' , aBLWidget getSelector , '>'
]

{ #category : #accessing }
CSNModelExporterAngular >> writeFile: aFileReference withCode: theSourceCode [
	(aFileReference writeStream nextPutAll: theSourceCode) flush
]
