"
```

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
```
"
Class {
	#name : #CSNModelExporterAngular,
	#superclass : #CSNModelExporter,
	#traits : 'TCSNExporter + TAngularExporter',
	#classTraits : 'TCSNExporter classTrait + TAngularExporter classTrait',
	#instVars : [
		'currentPath',
		'currentPage',
		'exporterAngularConfiguration',
		'attributeExporter',
		'homePage',
		'serviceExporter'
	],
	#category : #'Casino-Model-Exporter-Angular'
}

{ #category : #actions }
CSNModelExporterAngular class >> convertIfString: anObject [
	anObject isString
		ifTrue: [ ^ '"' , anObject , '"' ].
	^ anObject 
]

{ #category : #actions }
CSNModelExporterAngular class >> export: aBLMooseModel [

	self new
		model: aBLMooseModel;
		attributeExporter: CSNExporterAngularAttribute new;
		exporterAngularConfiguration: CSNExporterAngularConfiguration new;
		export
]

{ #category : #accessing }
CSNModelExporterAngular >> additionalAttributesForWidget: aWidget withRepresentation: aWidgetRepresentation [
	^ {  } asOrderedCollection
]

{ #category : #accessing }
CSNModelExporterAngular >> angularActionRepresentationOf: anAction [

	^ anAction getAngularRepresentationWith: self
]

{ #category : #accessing }
CSNModelExporterAngular >> angularRepresentationOf: aCSNWidget [
	^ self exporterAngularConfiguration angularRepresentationOf: aCSNWidget	
]

{ #category : #accessing }
CSNModelExporterAngular >> attributeExporter [

	^ attributeExporter
]

{ #category : #accessing }
CSNModelExporterAngular >> attributeExporter: anObject [

	attributeExporter := anObject
]

{ #category : #generate }
CSNModelExporterAngular >> businessPageImportList [
	^ '    Component,
    OnDestroy,
    OnInit,
    Renderer2,
    ViewChild,
    ChangeDetectorRef'
]

{ #category : #accessing }
CSNModelExporterAngular >> currentPage [

	^ currentPage
]

{ #category : #accessing }
CSNModelExporterAngular >> currentPage: anObject [

	currentPage := anObject
]

{ #category : #accessing }
CSNModelExporterAngular >> currentPath [
	^ currentPath 
]

{ #category : #accessing }
CSNModelExporterAngular >> currentPath: anObject [
	currentPath := anObject
]

{ #category : #accessing }
CSNModelExporterAngular >> exportAttributeValue: aCSNAttribute [
	self attributeExporter currentWriteStream: self currentWriteStream.
	self attributeExporter visit: aCSNAttribute
]

{ #category : #api }
CSNModelExporterAngular >> exportPage: aPage [
	^ self clone
		  currentPath: self rootPhases / aPage getAcceptedPathName;
		  currentPage: aPage;
		  visit: aPage
]

{ #category : #accessing }
CSNModelExporterAngular >> exporterAngularConfiguration [
	^ exporterAngularConfiguration
]

{ #category : #accessing }
CSNModelExporterAngular >> exporterAngularConfiguration: anObject [
	exporterAngularConfiguration := anObject
]

{ #category : #'generate - subcomponent' }
CSNModelExporterAngular >> generateAsSubComponent: aCSNWidget [

	"This generate the sub component. It is probably a dialog"

	| componentName exporter |
	componentName := (aCSNWidget name beginsWith: 'widget')
		                 ifFalse: [ aCSNWidget name ]
		                 ifTrue: [ 
		                 (aCSNWidget source target anyOne atScope:
			                  FamixTClass) anyOne name ].
	exporter := self clone.
	exporter indentLevel: 0.
	exporter currentPath: self currentPath / aCSNWidget getAcceptedPathName.
	[ exporter currentPath ensureCreateDirectory ]
		on: DirectoryExists
		do: [ 'directory already exists' recordInfo ].

	(exporter currentPath / aCSNWidget getHTMLName) asFileReference 
		writeStreamDo: [ :aWriteStream | 
			exporter currentWriteStream: aWriteStream.
			exporter generateRootHtmlOf: aCSNWidget ].

	(exporter currentPath / aCSNWidget getTSName) asFileReference 
		writeStreamDo: [ :aWriteStream | 
			exporter currentWriteStream: aWriteStream.
			exporter generateTSSourceCodeForWidgetComponent: aCSNWidget ]
]

{ #category : #visiting }
CSNModelExporterAngular >> generateHTMLSourceCodeDependOfPageMetierForPage: aCSNPage [
	aCSNPage hasMultiplePageMetier
		ifTrue:
			[ ^ self generateHTMLSourceCodeForMultiplePageMetierForPage: aCSNPage ].
	aCSNPage hasNoPageMetier
		ifTrue:
			[ ^ self generateHTMLSourceCodeForNoPageMetierForPage: aCSNPage ].
	self generateHTMLSourceCodeFor1PageMetierForPage: aCSNPage
]

{ #category : #visiting }
CSNModelExporterAngular >> generateHTMLSourceCodeFor1PageMetierForPage: aCSNPage [

	self
		indentPlus;
		<< '<bl-phase-business-page-container>'.
	self inIndented: [ 
		self
			<< '<bl-phase-business-page-header>';
			eol;
			<< '</bl-phase-business-page-header>' ].
	self eol.
	self
		inIndented: [ 
			self
				<< '<bl-phase-business-page id="P1">';
				inIndented: [ aCSNPage businessPage anyOne accept: self ];
				<< '</bl-phase-business-page>' ];
		<< '</bl-phase-business-page-container>';
		indentMinus
]

{ #category : #'generate - model' }
CSNModelExporterAngular >> generateHTMLSourceCodeForModel: aModel [
	currentWriteStream << '<bl-layout>
    <bl-desktop [homePhase]="phaseHome" [withTabNavigation]="true"></bl-desktop>
</bl-layout>'
]

{ #category : #visiting }
CSNModelExporterAngular >> generateHTMLSourceCodeForMultiplePageMetierForPage: aCSNPage [

	| id |
	id := 0.
	currentWriteStream
	<<
		'<bl-phase-business-pages-tab-container> <!-- (tabSelected)="onTabSelected($event)" -->
        <bl-phase-business-pages-tab-header>
            <div class="save-action">
                <div class="cursor-pointer"> <!-- (click)="save()" -->
                    <bl-icon icon="save"></bl-icon>
                </div>
            </div>
        </bl-phase-business-pages-tab-header>'.
	aCSNPage sortedPageMetiers do: [ :metier | 
		id := id + 1.
		currentWriteStream
			<< '
            <bl-phase-business-page-tab id="P';
			<< id asString;
			<< '" title="';
			<< (self protectString: metier title);
			<< '">	';
			<< String crlf;
			<< '                '.
			self h.
		metier accept: self.
		self
			<< String crlf;
			<< '            </bl-phase-business-page-tab>';
			<< String crlf ].
	currentWriteStream << '    </bl-phase-business-pages-tab-container>'
]

{ #category : #visiting }
CSNModelExporterAngular >> generateHTMLSourceCodeForNoPageMetierForPage: aCSNPage [

	aCSNPage widgets do: [ :widget | 
		self visit: widget.
		currentWriteStream << String crlf ]
]

{ #category : #visiting }
CSNModelExporterAngular >> generateHTMLSourceCodeForPage: aBLPhase [

	self << '<bl-phase-container>'.
	self inIndented: [ 
		self generateHTMLSourceCodeDependOfPageMetierForPage: aBLPhase ].
	self << '</bl-phase-container>'
]

{ #category : #generate }
CSNModelExporterAngular >> generateInnerHTMLOf: aCSNWidget [

	| angularRepresentation |
	aCSNWidget layout ifNotNil: [ 
		angularRepresentation := self angularRepresentationOf: aCSNWidget.
		angularRepresentation exportHeaderOf: aCSNWidget with: self.
		self visit: aCSNWidget layout.
		angularRepresentation exportFooterOf: aCSNWidget with: self.
		self crlf ].

	aCSNWidget widgets
		reject: [ :widget | widget isPageMetier ]
		thenDo: [ :widget | 
			self visit: widget.
			currentWriteStream << String crlf ]
]

{ #category : #'generate - model' }
CSNModelExporterAngular >> generateMaterialModuleSourceCodeForModel: aModel [
	currentWriteStream
		<<
			'import { NgModule } from ''@angular/core'';
import { A11yModule } from ''@angular/cdk/a11y'';
// import {ClipboardModule} from ''@angular/cdk/clipboard'';
import { DragDropModule } from ''@angular/cdk/drag-drop'';
import { PortalModule } from ''@angular/cdk/portal'';
import { ScrollingModule } from ''@angular/cdk/scrolling'';
import { CdkStepperModule } from ''@angular/cdk/stepper'';
import { CdkTableModule } from ''@angular/cdk/table'';
import { CdkTreeModule } from ''@angular/cdk/tree'';
import { MatAutocompleteModule } from ''@angular/material/autocomplete'';
import { MatBadgeModule } from ''@angular/material/badge'';
import { MatBottomSheetModule } from ''@angular/material/bottom-sheet'';
import { MatButtonModule } from ''@angular/material/button'';
import { MatButtonToggleModule } from ''@angular/material/button-toggle'';
import { MatCardModule } from ''@angular/material/card'';
import { MatCheckboxModule } from ''@angular/material/checkbox'';
import { MatChipsModule } from ''@angular/material/chips'';
import { MatStepperModule } from ''@angular/material/stepper'';
import { MatDatepickerModule } from ''@angular/material/datepicker'';
import {
  MatDialogModule,
  MAT_DIALOG_DEFAULT_OPTIONS,
} from ''@angular/material/dialog'';
import { MatDividerModule } from ''@angular/material/divider'';
import { MatExpansionModule } from ''@angular/material/expansion'';
import { MatGridListModule } from ''@angular/material/grid-list'';
import { MatIconModule } from ''@angular/material/icon'';
import { MatInputModule } from ''@angular/material/input'';
import { MatListModule } from ''@angular/material/list'';
import { MatMenuModule } from ''@angular/material/menu'';
import { MatNativeDateModule, MatRippleModule } from ''@angular/material/core'';
import { MatProgressBarModule } from ''@angular/material/progress-bar'';
import { MatProgressSpinnerModule } from ''@angular/material/progress-spinner'';
import { MatRadioModule } from ''@angular/material/radio'';
import { MatSelectModule } from ''@angular/material/select'';
import { MatSidenavModule } from ''@angular/material/sidenav'';
import { MatSliderModule } from ''@angular/material/slider'';
import { MatSlideToggleModule } from ''@angular/material/slide-toggle'';
import { MatSnackBarModule, MAT_SNACK_BAR_DEFAULT_OPTIONS } from ''@angular/material/snack-bar'';
import { MatSortModule } from ''@angular/material/sort'';
import { MatTableModule } from ''@angular/material/table'';
import { MatTabsModule } from ''@angular/material/tabs'';
import { MatToolbarModule } from ''@angular/material/toolbar'';
import { MatTooltipModule } from ''@angular/material/tooltip'';
import { MatTreeModule } from ''@angular/material/tree'';
import { MatPaginatorModule } from ''@angular/material/paginator'';
import {OverlayModule} from ''@angular/cdk/overlay'';

@NgModule({
  exports: [
    A11yModule,
    // ClipboardModule,
    CdkStepperModule,
    CdkTableModule,
    CdkTreeModule,
    DragDropModule,
    MatAutocompleteModule,
    MatBadgeModule,
    MatBottomSheetModule,
    MatButtonModule,
    MatButtonToggleModule,
    MatCardModule,
    MatCheckboxModule,
    MatChipsModule,
    MatStepperModule,
    MatDatepickerModule,
    MatDialogModule,
    MatDividerModule,
    MatExpansionModule,
    MatGridListModule,
    MatIconModule,
    MatInputModule,
    MatListModule,
    MatMenuModule,
    MatNativeDateModule,
    MatPaginatorModule,
    MatProgressBarModule,
    MatProgressSpinnerModule,
    MatRadioModule,
    MatRippleModule,
    MatSelectModule,
    MatSidenavModule,
    MatSliderModule,
    MatSlideToggleModule,
    MatSnackBarModule,
    MatSortModule,
    MatTableModule,
    MatTabsModule,
    MatToolbarModule,
    MatTooltipModule,
    MatTreeModule,
    MatSortModule,
    PortalModule,
    ScrollingModule,
    OverlayModule,
  ],
  providers: [
    {
      provide: MAT_DIALOG_DEFAULT_OPTIONS,
      useValue: { hasBackdrop: true, disableClose: true },
    },
    {provide: MAT_SNACK_BAR_DEFAULT_OPTIONS, useValue: {duration: 3500}}
  ],
})
export class DemoMaterialModule {}

/**  Copyright 2020 Google LLC. All Rights Reserved.
    Use of this source code is governed by an MIT-style license that
    can be found in the LICENSE file at http://angular.io/license */'
]

{ #category : #'generate - model' }
CSNModelExporterAngular >> generateModuleSourceCodeForModel: aModel [

	currentWriteStream
		<< 'import { NgModule, Provider } from ''@angular/core'';
import { BrowserModule } from ''@angular/platform-browser'';
import { FormsModule } from ''@angular/forms'';
import { BrowserAnimationsModule } from ''@angular/platform-browser/animations'';

import { DEMOS_ROUTES } from ''./';
		<< aModel name uncapitalized;
		<< '.routing'';
import { ComponentsModule, Phase, PHASES } from ''app/projects/bl-shell/src/public-api'';
import { IndexComponent } from ''./components/index/index.component'';
import { TranslateModule } from ''@ngx-translate/core'';
'.
	((aModel allCSNService reject: [ :service | 
		  service isParentService isNotNil and: [ service isParentService ] ]) 
		 sorted: #uniqueName ascending) do: [ :service | 
		currentWriteStream
			<< 'import { ';
			<< service uniqueName;
			<< ' } from ''./';
			<< (self serviceExporter getLocalPathOf: service);
			<< ''';';
			crlf ].
	currentWriteStream
		crlf;
		<< 'export const phases: Phase[] = [
'.
	((aModel allCSNPage reject: [ :page | page name = nil ]) sorted:
		 #name ascending) do: [ :blPhase | 
		currentWriteStream
			<< blPhase getMetadata;
			<< ',';
			<< String crlf ].
	currentWriteStream << '
];

@NgModule({
    imports: [
        BrowserModule,
        FormsModule,
        BrowserAnimationsModule,
        ComponentsModule.forRoot(),

        DEMOS_ROUTES,

        TranslateModule
    ],
    declarations: [
        IndexComponent
    ],
    providers: [
'.
	((aModel allCSNService reject: [ :service | 
		  service isParentService isNotNil and: [ service isParentService ] ]) 
		 sorted: #uniqueName ascending) do: [ :service | 
		currentWriteStream
			<< '        ';
			<< service uniqueName;
			<< ',';
			<< String crlf ].
	currentWriteStream
		<< '        { provide: PHASES, useValue: phases } as Provider
    ]
})
export class ';
		<< aModel name capitalized;
		<< 'Module { }';
		<< String crlf
]

{ #category : #'generate - page' }
CSNModelExporterAngular >> generateModuleSourceCodeForPage: aCSNPage [

	currentWriteStream
		<< 'import { NgModule } from ''@angular/core'';
import { TranslateModule } from ''@ngx-translate/core'';
import { CommonModule } from ''@angular/common'';
import { FormsModule, ReactiveFormsModule } from ''@angular/forms'';
import { Phase, PhaseService, ComponentsModule } from ''app/projects/bl-shell/src/public-api'';
import { ';
		<< aCSNPage componentName;
		<< ' } from ''./components/';
		<< aCSNPage getFolderName;
		<< '/';
		<< aCSNPage getAcceptedName;
		<< '.component'';
import { PHASE_ROUTES } from ''./';
		<< aCSNPage getAcceptedName;
		<< '.route'';';
		<< String crlf;
		<< (aCSNPage widgetsDependenciesImportInstructionFrom: self).
	aCSNPage businessPage do: [ :aBusinessPage | 
		aBusinessPage printImportStringForSubComponentsFrom: '.' using: self ].
	self << '
export const COMPONENTS: any[] = ['.
	self
		crlf;
		indentPlus;
		<< aCSNPage componentName;
		<<< ','.
	self crlf.
	((aCSNPage pageSubComponentsUsing: self) asSet asOrderedCollection 
		 sorted: [ :a :b | a componentName < b componentName ])
		do: [ :subComponent | 
			self
				<< subComponent componentName;
				<<< ',' ]
		separatedBy: [ self crlf ].
	currentWriteStream << '
];'.
	self
		indentMinus;
		crlf;
		crlf.

	self
		<< '@NgModule({
    declarations: [
        COMPONENTS
    ],
    imports: [
        ReactiveFormsModule,
        FormsModule,
        CommonModule,
        PHASE_ROUTES,
';
		<< (aCSNPage widgetsDependenciesNameFrom: self);
		<< '
        ComponentsModule,
        TranslateModule
    ]
})
export class ';
		<< aCSNPage getModuleClassName;
		<< ' {}';
		<< String crlf
]

{ #category : #generate }
CSNModelExporterAngular >> generateRootHtmlOf: aCSNWidget [

	self
		<< '<form [formGroup]="';
		<<< aCSNWidget id uncapitalized;
		<<< 'Form';
		<<< '">'.
	self inIndented: [ self generateInnerHTMLOf: aCSNWidget ].
	self << '</form>'
]

{ #category : #'generate - model' }
CSNModelExporterAngular >> generateRouteSourceCodeForModel: aModel [

	currentWriteStream
		<< 'import { ModuleWithProviders } from ''@angular/core'';
import { Routes, RouterModule, PreloadAllModules } from ''@angular/router'';
import { IndexComponent } from ''./components/index/index.component'';

const routes: Routes = [
    { path: '''', pathMatch: ''full'', redirectTo: ''desktop'' },
    { path: ''desktop'', component: IndexComponent, children: [';
		<< String crlf.
	((aModel allCSNPage reject: [ :page | page name = nil ]) sorted:
		 #getAcceptedName ascending) do: [ :phase | 
		currentWriteStream
			<< '        { path: ''';
			<< phase getAcceptedName;
			<< '/:id'', loadChildren: () => import(''./phases/';
			<< phase getLocalModulePath;
			<< ''').then(m => m.';
			<< phase getModuleClassName;
			<< ')},';
			<< String crlf ].
	currentWriteStream << '    ]}
];
export const DEMOS_ROUTES: ModuleWithProviders<RouterModule> = RouterModule.forRoot(routes, { useHash: false });'
]

{ #category : #'generate - page' }
CSNModelExporterAngular >> generateRouteSourceCodeForPage: aCSNPage [
	currentWriteStream
		<<
			'import { ModuleWithProviders } from ''@angular/core'';
import { RouterModule, Routes } from ''@angular/router'';
import { ';
		<< aCSNPage componentName;
		<< ' } from ''./';
		<< aCSNPage getFolderName;
		<< '/';
		<< aCSNPage getAcceptedPathName;
		<<
			'.component'';

const routes: Routes = [
    {
        path: '''', component: ';
		<< aCSNPage componentName;
		<<
			'
    }
];

export const PHASE_ROUTES: ModuleWithProviders<RouterModule> = RouterModule.forChild(routes);
'
]

{ #category : #'generate - model' }
CSNModelExporterAngular >> generateTSSourceCodeForModel: aModel [

	currentWriteStream
	<< 'import { Component, OnInit } from ''@angular/core'';
import { Phase, PhaseService } from ''app/projects/bl-shell/src/public-api'';

@Component({
    selector: ''app-index'',
    templateUrl: ''./index.component.html''
})
export class IndexComponent implements OnInit {

    public phaseHome: Phase;

    constructor(private _phaseService: PhaseService) {
        this.phaseHome = this._phaseService.getPhase('''.
	self homePage
		ifNotNil: [ :page | self <<< page name asRealCamelCase ]
		ifNil: [ self <<< '`TODO: Replace By Home Page`' ].
	self <<< ''');
    }

    public ngOnInit(): void {

    }
}
'
]

{ #category : #'generate - page' }
CSNModelExporterAngular >> generateTSSourceCodeForPage: aCSNPage [

	currentWriteStream << 'import {
    Component,
    OnDestroy,
    OnInit'.
	aCSNPage hasMultiplePageMetier ifTrue: [ 
		currentWriteStream
			<< ',';
			"			<< String crlf;
			<< '    ElementRef,';"<< String crlf;
			<< '    ViewChild' ].
	currentWriteStream << '
} from ''@angular/core'';
import { Router } from ''@angular/router'';
import { PhaseComponent } from ''app/projects/bl-shell/src/public-api'';
import { AbstractPhaseComponent } from ''app/projects/bl-shell/src/public-api'';
import { DesktopStateService } from ''app/projects/bl-shell/src/public-api'';
'.
	aCSNPage hasMultiplePageMetier ifTrue: [ 
		currentWriteStream
			<<
				'import { BusinessPageContainerComponent } from ''app/projects/bl-shell/src/public-api'';';
			<< String crlf ].
	aCSNPage businessPage do: [ :metier | 
		currentWriteStream
			<< 'import { ';
			<< metier componentName;
			<< ' } from ''../..';
			<< metier getLocalComponentPath;
			<< ''';';
			<< String crlf ].
	currentWriteStream
		<< '


@Component({
    templateUrl: ''./';
		<< aCSNPage getHTMLName;
		<< '''
})
export class ';
		<< aCSNPage componentName capitalized;
		<<
			' extends AbstractPhaseComponent implements PhaseComponent, OnInit, OnDestroy {

'.
	aCSNPage hasMultiplePageMetier ifTrue: [ 
		currentWriteStream
			<<
				'    @ViewChild(BusinessPageContainerComponent, { static: false }) public container: BusinessPageContainerComponent;
';
			<< String crlf ].
	aCSNPage hasMultiplePageMetier ifTrue: [ 
		aCSNPage businessPage do: [ :metier | 
			currentWriteStream << (metier idViewChildFrom: self) << String crlf ] ].
	currentWriteStream
		<< '

    constructor(public phaseService: DesktopStateService, public router: Router) {
        super(phaseService, router);
    }

    public ngOnInit(): void {

    }

    public ngOnDestroy(): void {

    }

    public init(): void {

    }
}';
		<< String crlf
]

{ #category : #'generate - subcomponent' }
CSNModelExporterAngular >> generateTSSourceCodeForWidgetComponent: aCSNWidget [

	| phaseCalled widgestList |
	phaseCalled := aCSNWidget collectPhaseCalled.
	self writeBusinessPageImportList.
	phaseCalled ifNotEmpty: [ self writeImportForNavigation ].
	self writeTypeScriptImportOf: aCSNWidget.

	self eol.
	self
		<< '@Component({
    selector: ''';
		<< aCSNWidget getComponentSelector;
		<< ''',
    templateUrl: ''./';
		<< aCSNWidget getHTMLName;
		<< '''
})
export class ';
		<< aCSNWidget componentName;
		<< ' implements OnInit {'.
	self inIndented: [ 
		phaseCalled do: [ :phase | 
			self
				<< 'public /*TOTO*/';
				<<< phase getAcceptedName;
				<<< ': Phase;';
				eol ].
		phaseCalled ifNotEmpty: [ self eol ] ].

	"Print Variables"
	self printTSVariablesForComponent: aCSNWidget.
	self pluginExporters do: [ :pluginExporter | 
		pluginExporter printTSVariablesForComponent: aCSNWidget using: self ].

	self eol.
	self inIndented: [ 
		self << 'constructor('.
		aCSNWidget collectPhaseCalled ifNotEmpty: [ 
			currentWriteStream
			<<
			'protected _desktopStateService: DesktopStateService, private _phaseService: PhaseService, ' ].
		self inIndented: [ 
			self printTSConstructorInjectionForComponent: aCSNWidget ].

		self << ') {'.
		aCSNWidget collectPhaseCalled do: [ :phase | 
			self
				<< 'this.';
				<<< phase getAcceptedName;
				<<< ' = this._phaseService.getPhase(''';
				<<< phase getAcceptedName;
				<<< ''');';
				eol ].
		self << '}' ].
	self inIndented: [ 
		self << 'public ngOnInit(): void {'.
		self printTSOnInitOf: aCSNWidget.
		self <<| '}' ].

	phaseCalled ifNotEmpty: [ 
		self inIndented: [ self writeOpenPhaseMethod ] ].
	"component definition call"

	self inIndented: [ 
		widgestList := aCSNWidget componentSubWidgetsUsing: self.
		({ aCSNWidget } , widgestList) flattened asSet do: [ :widget | 
			(self exporterAngularConfiguration angularRepresentationOf: widget)
				exportTypeScriptMethodsOf: widget
				usingExporter: self ] ].
	self <<< '}'
]

{ #category : #accessing }
CSNModelExporterAngular >> homePage [

	^ homePage
]

{ #category : #accessing }
CSNModelExporterAngular >> homePage: anObject [

	homePage := anObject
]

{ #category : #streaming }
CSNModelExporterAngular >> inTag: aTagName put: aBlock [

	self inTag: aTagName withAttributesString: '' put: aBlock
]

{ #category : #streaming }
CSNModelExporterAngular >> inTag: aTagName withAttributesString: anAttributeString put: aBlock [

	self
		<< '<';
		<<< aTagName.
	anAttributeString ifNotEmpty: [ :atts | 
		self
			<<< ' ';
			<<< atts ].
	self <<< '>'.
	self eol.
	self inIndentedNoEol: aBlock.
	self
		<< '</';
		<<< aTagName;
		<<< '>';
		eol
]

{ #category : #initialization }
CSNModelExporterAngular >> initialize [
	super initialize.
	indentLevel := 0.
	self serviceExporter: CSNModelServiceExporter new
]

{ #category : #run }
CSNModelExporterAngular >> prepareExport [
	super prepareExport.
	context := CSNContext new
		root: (FileSystem disk workingDirectory / model name) asFileReference;
		yourself
]

{ #category : #'generate - subcomponent' }
CSNModelExporterAngular >> printBuildTSFormGroupFor: aCSNWidget [

	| widgetsList |
	widgetsList := (self angularRepresentationOf: aCSNWidget)
		               representationSubWidgetsOf: aCSNWidget
		               usingExporter: self.
	self
		<< 'this.';
		<<< aCSNWidget id uncapitalized;
		<<< 'Form = this._fb.group('.

	self inBraces: [ 
		((widgetsList flattened select: [ :w | 
			  (self angularRepresentationOf: w) isFormControl ]) asSet
			 asOrderedCollection sorted: [ :a :b | a id < b id ])
			do: [ :w | 
				self
					<< w id uncapitalized;
					<<< ': new FormControl(),' ]
			separatedBy: [ self eol ] ].
	self <<<| ');'
]

{ #category : #'generate - subcomponent' }
CSNModelExporterAngular >> printTSConstructorInjectionForComponent: aCSNWidget [

	| widgetsList injectList |
	injectList := Set new.

	widgetsList := aCSNWidget componentSubWidgetsUsing: self.

	({ 
		 aCSNWidget.
		 widgetsList } flattened asSet
		 flatCollect: [ :widget | 
			 (String streamContents: [ :stream | 
				  (self exporterAngularConfiguration angularRepresentationOf:
					   widget)
					  exportTypeScriptConstructorInjectionOf: widget
					  usingExporter: (CSNDefaultExporter on: stream) ]) lines ]
		 as: Set) do: [ :line | injectList add: line ].
	injectList do: [ :line | self << line ] separatedBy: [ self eol ]
]

{ #category : #'generate - subcomponent' }
CSNModelExporterAngular >> printTSOnDestroyOf: aCSNWidget [

	| widgetsList |
	widgetsList := aCSNWidget componentSubWidgetsUsing: self.

	self inIndented: [ 
		widgetsList flattened asSet asOrderedCollection do: [ :widget | 
			(self exporterAngularConfiguration angularRepresentationOf: widget)
				exportTypeScriptOnDestroyOf: widget
				usingExporter: self ] ]
]

{ #category : #'generate - subcomponent' }
CSNModelExporterAngular >> printTSOnInitOf: aCSNWidget [

	| widgetsList |
	widgetsList := aCSNWidget componentSubWidgetsUsing: self.
	self inIndented: [ 
		{ 
			aCSNWidget.
			widgetsList } flattened asSet asOrderedCollection do: [ :widget | 
			(self exporterAngularConfiguration angularRepresentationOf: widget)
				exportTypeScriptOnInitOf: widget
				usingExporter: self ] ]
]

{ #category : #'generate - subcomponent' }
CSNModelExporterAngular >> printTSVariablesForComponent: aCSNWidget [

	| widgetsList |
	widgetsList := aCSNWidget componentSubWidgetsUsing: self.


	self inIndented: [ 
		{ 
			aCSNWidget.
			widgetsList } flattened asSet asOrderedCollection do: [ :widget | 
			(self exporterAngularConfiguration angularRepresentationOf: widget)
				exportTypeScriptVariableOf: widget
				usingExporter: self ] ]
]

{ #category : #streaming }
CSNModelExporterAngular >> printTag: aTagName [

	self inTag: aTagName withAttributesString: '' put: [  ]
]

{ #category : #accessing }
CSNModelExporterAngular >> rootPhases [
	^ self root / 'phases'
]

{ #category : #accessing }
CSNModelExporterAngular >> serviceExporter [

	^ serviceExporter
]

{ #category : #accessing }
CSNModelExporterAngular >> serviceExporter: anObject [

	serviceExporter := anObject
]

{ #category : #accessing }
CSNModelExporterAngular >> serviceRoot [
	^ self root / 'services'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNAttribute: aCSNAttribute [
	aCSNAttribute widget
		ifNil: [ WidgetRepresentation new exportAttribute: aCSNAttribute with: self ]
		ifNotNil: [ :widget | widget exportAttribute: aCSNAttribute with: self ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNContainer: aBLUIContainer [

	| angularRepresentation |
	angularRepresentation := self angularRepresentationOf: aBLUIContainer.
	(aBLUIContainer layout isNotNil and: [ 
		 angularRepresentation isOverrideLayout not ])
		ifTrue: [ 
			angularRepresentation exportHeaderOf: aBLUIContainer with: self.
			self visit: aBLUIContainer layout.
			angularRepresentation exportFooterOf: aBLUIContainer with: self ]
		ifFalse: [ angularRepresentation export: aBLUIContainer with: self ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNLBorderLayout: aCSNLBorderLayout [

	"export other cell (propably special ones), then north cell, then center, then south"

	| unknowCell northCell centerCell southCell |
	unknowCell := aCSNLBorderLayout cell select: [ :cell | 
		              cell position isNil ].
	northCell := aCSNLBorderLayout cell select: [ :cell | 
		             cell position isNotNil and: [ cell position isNorth ] ].
	centerCell := aCSNLBorderLayout cell select: [ :cell | 
		              cell position isNotNil and: [ cell position isCenter ] ].
	southCell := aCSNLBorderLayout cell select: [ :cell | 
		             cell position isNotNil and: [ cell position isSouth ] ].
	self
		eol;
		indentPlus;
		<< '<tbody>';
		inIndented: [ 
			({ 
				 unknowCell.
				 northCell.
				 centerCell.
				 southCell } reject: #isEmpty)
				do: [ :cells | 
					self << '<tr>'.
					self inIndented: [ 
							cells
								do: [ :cell | 
									self << '<td'.
									cell attributesTagWith: self.
									self <<< '>'.
									self inIndented: [ self visit: cell ].
									self << '</td>' ]
								separatedBy: [ self eol ] ].
					self << '</tr>' ]
				separatedBy: [ self eol ] ];
		<< '</tbody>';
		indentMinus
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNLCell: aCSNLCell [
	aCSNLCell layoutOwner container = aCSNLCell widget ifTrue: [ ^ '' ].
	^ self visit: (aCSNLCell widget ifNil: [ ^ '' ])
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNLGridLayout: aCSNLGridLayout [

	0 to: aCSNLGridLayout maxLevel do: [ :number | 
		self eol.
		((aCSNLGridLayout atLevelSorted: number) reject: #isNil) 
			ifNotEmpty: [ :cells | 
				self
					indentPlus;
					<< '<div class="row">';
					eol.
				cells do: [ :cell | 
					self
						indentPlus;
						visit: cell;
						indentMinus;
						eol ].
				self
					<< '</div>';
					indentMinus ] ].
	aCSNLGridLayout notPositionnedCell ifNotEmpty: [ :cells | 
		self
			eol;
			<< '<!-- not positionned cells -->';
			eol.
		cells do: [ :cell | self inIndented: [ self visit: cell ] ] ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNLLayout: aBLLayout [

	aBLLayout container widgets , aBLLayout cell do: [ :widget | 
		self
			eol;
			indentPlus.
		self visit: widget.
		self
			indentMinus ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNLeaf: aCSNLeaf [

	^ self visitCSNWidget: aCSNLeaf
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNPage: aPage [

	| phaseRoot componentsRoot indexRoot |
	phaseRoot := self currentPath.
	phaseRoot ensureCreateDirectory.
	"Write phase.module.ts"
	currentWriteStream := (phaseRoot / aPage getModuleName)
		                      asFileReference writeStream.

	[ 
	self generateModuleSourceCodeForPage: aPage.
	currentWriteStream flush ] ensure: [ currentWriteStream close ].
	"Write phase.route.ts"
	currentWriteStream := (phaseRoot / aPage getRouteName)
		                      asFileReference writeStream.
	[ 
	self generateRouteSourceCodeForPage: aPage.
	currentWriteStream flush ] ensure: [ currentWriteStream close ].
	"Write components"
	componentsRoot := self currentPath.
	componentsRoot ensureCreateDirectory.
	indexRoot := componentsRoot / aPage getFolderName.
	indexRoot ensureCreateDirectory.

	currentWriteStream := (indexRoot / aPage getTSName) asFileReference
		                      writeStream.

	[ 
	self generateTSSourceCodeForPage: aPage.
	currentWriteStream flush ] ensure: [ currentWriteStream close ].

	currentWriteStream := (indexRoot / aPage getHTMLName) asFileReference
		                      writeStream.

	[ 
	self generateHTMLSourceCodeForPage: aPage.
	currentWriteStream flush ] ensure: [ currentWriteStream close ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUICWClickHandler: aCSNClickHandler [
	self visitCSNAction: aCSNClickHandler
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUICWHTML: aBLHTML [

	self crlf.
	aBLHTML widgets
		do: [ :widget | 
			self
			<<
			((widget text ifNil: [ '' ]) copyReplaceAll: '</br>' with: '<br/>') ]
		separatedBy: [ self crlf ].

	self crlf
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIImage: aBLUIImage [
  self << '<'.
  aBLUIImage getListPropertiesAsStringWith: self.
  self <<< ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIInputColor: aBLUIInputColor [
	self << '<'.
	aBLUIInputColor getListPropertiesAsStringWith: self.
	self <<< ' type="color" />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIInputMonth: aBLUIInputMonth [
  self << '<'.
  aBLUIInputMonth getListPropertiesAsStringWith: self.
  self <<< ' type="month"/>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIPanel: aBLUIPanel [
 	self visitCSNContainer:  aBLUIPanel
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIParagraph: aBLUIParagraph [
  self << '<'.
  aBLUIParagraph getListPropertiesAsStringWith: self.
  self <<< '>'.
  aBLUIParagraph attributes select: [:a |  a isKindOf: CSNUILabel ] thenDo: [:attribute |  self
           eol;
           indentPlus;
           indent.
        self visit: attribute.
        self
           indentMinus;
           eol ].
  self
     << '</';
     <<< (self angularRepresentationOf: aBLUIParagraph) getSelector;
     <<< '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIStyle: aCSNUIStyle [

	self
		<<< aCSNUIStyle styleAttribute;
		<<< ': '.
	self visitCSNAttribute: aCSNUIStyle.
	self <<< ';'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNWidget: aBLWidget [
	(self angularRepresentationOf: aBLWidget) export: aBLWidget with: self
]

{ #category : #visiting }
CSNModelExporterAngular >> visitMooseModel: aMooseModel [

	| rootPhases rootComponents |
	self root createDirectory.

	"Write app.module.ts"
	currentWriteStream := (self root / aMooseModel getModuleName)
		                      asFileReference writeStream.
	self generateModuleSourceCodeForModel: aMooseModel.
	currentWriteStream
		flush;
		close.

	"Write defaultmaterial.module.ts"
	currentWriteStream := (self root / 'material-module.ts')
		                      asFileReference writeStream.
	self generateMaterialModuleSourceCodeForModel: aMooseModel.
	currentWriteStream
		flush;
		close.

	"Write app.route.ts"
	currentWriteStream := (self root / aMooseModel getRouteName)
		                      asFileReference writeStream.
	self generateRouteSourceCodeForModel: aMooseModel.
	currentWriteStream
		flush;
		close.

	"Write components"
	rootComponents := self root / 'components' / 'index'.
	rootComponents ensureCreateDirectory.
	currentWriteStream := (rootComponents / aMooseModel getHTMLName)
		                      asFileReference writeStream.
	self generateHTMLSourceCodeForModel: aMooseModel.
	currentWriteStream
		flush;
		close.
	currentWriteStream := (rootComponents / aMooseModel getTSName)
		                      asFileReference writeStream.
	self generateTSSourceCodeForModel: aMooseModel.
	currentWriteStream
		flush;
		close.
	rootPhases := self root / 'phases'.
	rootPhases createDirectory.
	(aMooseModel allCSNPage reject: [ :page | page name = nil ])
		do: [ :aPage | 
			self
				execute: [ self exportPage: aPage ]
				recordedAs: 'export ' , aPage name asString ]
		displayingProgress: [ :page | 'export page: ' , page name asString ].
	aMooseModel allCSNService do: [ :rootElement | 
		self visit: rootElement ]
]

{ #category : #'private-generate' }
CSNModelExporterAngular >> writeBusinessPageImportList [

	self
		<<| 'import {';
		<<| self businessPageImportList;
		<<| '} from ''@angular/core'';'.
]

{ #category : #generate }
CSNModelExporterAngular >> writeImportForNavigation [
	^ currentWriteStream
		<<
			'import { DesktopStateService, Phase, PhaseService } from ''app/projects/bl-shell/src/public-api'';';
		crlf
]

{ #category : #generate }
CSNModelExporterAngular >> writeOpenPhaseMethod [
	currentWriteStream
		crlf;
		<<
			'    public openPhase(phase: Phase): void {
        this._desktopStateService.selectPhase({id: undefined, phase: phase});
    }'
]

{ #category : #'generate - subcomponent' }
CSNModelExporterAngular >> writeTypeScriptImportOf: aCSNWidget [

	| importList widgetsList |
	importList := Set new.
	widgetsList := aCSNWidget componentSubWidgetsUsing: self.

	(({ aCSNWidget } , widgetsList) flattened asSet
		 flatCollect: [ :widget | 
			 (String streamContents: [ :stream | 
				  | exporter |
				  exporter := CSNDefaultExporter on: stream.
				  (self exporterAngularConfiguration angularRepresentationOf:
					   widget)
					  exportTypeScriptImportOf: widget
					  usingExporter: exporter.
				  exporter eol.
				  ((self exporterAngularConfiguration angularRepresentationOf:
					    widget) internalDependenciesOf: widget)
					  do: [ :rep | 
					  rep exportTypeScriptImportOf: widget usingExporter: exporter ]
					  separatedBy: [ exporter eol ] ]) lines ]
		 as: Set) do: [ :line | importList add: line ].
	importList do: [ :line | self <<< line ] separatedBy: [ self eol ]
]
