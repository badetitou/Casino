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
	#traits : 'TCSNExporter',
	#classTraits : 'TCSNExporter classTrait',
	#instVars : [
		'currentPath',
		'exporterAngularConfiguration'
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
CSNModelExporterAngular >> angularRepresentationOf: aCSNWidget [
	^ self exporterAngularConfiguration angularRepresentationOf: aCSNWidget	
]

{ #category : #generate }
CSNModelExporterAngular >> businessPageImportList [
	^ '    Component,
    OnDestroy,
    OnInit,
    Renderer2,
    ViewChild'
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
CSNModelExporterAngular >> exporterAngularConfiguration [
	^ exporterAngularConfiguration
]

{ #category : #accessing }
CSNModelExporterAngular >> exporterAngularConfiguration: anObject [
	exporterAngularConfiguration := anObject
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
 currentWriteStream << '<bl-phase-business-page-container>
        <bl-phase-business-page-header>
        </bl-phase-business-page-header>

        <bl-phase-business-page id="P1" title="Page 1">
            ' ; << aCSNPage businessPage anyOne getTag
		; <<
			'
        </bl-phase-business-page>
    </bl-phase-business-page-container>'
]

{ #category : #generate }
CSNModelExporterAngular >> generateHTMLSourceCodeForBusinessPage: aBLPageMetier [
  aBLPageMetier metiers ifNotEmpty: [ currentWriteStream
           << '<bl-tabs>';
           << String crlf.
        aBLPageMetier metiers do: [:metier |  currentWriteStream
                 << '    <bl-tab title=';
                 << (self class convertIfString: (self protectString: metier title));
                 << '>';
                 << String crlf;
                 << '        ';
                 << metier getTag;
                 << String crlf;
                 << '    </bl-tab>';
                 << String crlf ].
        currentWriteStream
           << '</bl-tabs>';
           << String crlf ].
  aBLPageMetier widgets reject: [:widget |  widget isPageMetier ] thenDo: [:widget |  self visit: widget.
        currentWriteStream << String crlf ]
]

{ #category : #generate }
CSNModelExporterAngular >> generateHTMLSourceCodeForModel: aModel [
	currentWriteStream << '<bl-layout>
    <bl-desktop [homePhase]="phaseHome"></bl-desktop>
</bl-layout>'
]

{ #category : #visiting }
CSNModelExporterAngular >> generateHTMLSourceCodeForMultiplePageMetierForPage: aCSNPage [
  | id |
  id := 0.
  currentWriteStream << '<bl-phase-business-pages-tab-container> <!-- (tabSelected)="onTabSelected($event)" -->
        <bl-phase-business-pages-tab-header>
            <div class="save-action">
                <div class="cursor-pointer"> <!-- (click)="save()" -->
                    <bl-icon icon="save"></bl-icon>
                </div>
            </div>
        </bl-phase-business-pages-tab-header>'.
  aCSNPage sortedPageMetiers do: [:metier |  id := id + 1.
        currentWriteStream
           << '
            <bl-phase-business-page-tab id="P';
           << id asString;
           << '" title="';
           << (self protectString: metier title);
           << '">	';
           << String crlf;
           << '                ';
           << metier getTag;
           << String crlf;
           << '            </bl-phase-business-page-tab>';
           << String crlf ].
  currentWriteStream << '    </bl-phase-business-pages-tab-container>'
]

{ #category : #visiting }
CSNModelExporterAngular >> generateHTMLSourceCodeForNoPageMetierForPage: aCSNPage [
  aCSNPage widgets do: [:widget |  self visit: widget.
        currentWriteStream << String crlf ]
]

{ #category : #visiting }
CSNModelExporterAngular >> generateHTMLSourceCodeForPage: aBLPhase [
  currentWriteStream << '<bl-phase-container>
	'.
  self generateHTMLSourceCodeDependOfPageMetierForPage: aBLPhase.
  currentWriteStream << '
</bl-phase-container>'
]

{ #category : #generate }
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
import { MatPaginatorModule } from ''@angular/material'';
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

{ #category : #generate }
CSNModelExporterAngular >> generateModuleSourceCodeForModel: aModel [
	currentWriteStream
		<<
			'import { NgModule, Provider } from ''@angular/core'';
import { BrowserModule } from ''@angular/platform-browser'';
import { FormsModule } from ''@angular/forms'';
import { BrowserAnimationsModule } from ''@angular/platform-browser/animations'';

import { DEMOS_ROUTES } from ''./';
		<< aModel name uncapitalized;
		<<
			'.routing'';
import { ComponentsModule, Phase, PHASES } from ''app/projects/bl-shell/src/public-api'';
import { IndexComponent } from ''./components/index/index.component'';
import { TranslateModule } from ''@ngx-translate/core'';
'.
	(aModel allCSNService sorted: #uniqueName ascending)
		do: [ :service | 
			currentWriteStream
				<< 'import { ';
				<< service uniqueName;
				<< ' } from ''./';
				<< service getLocalPath;
				<< ''';';
				crlf ].
	currentWriteStream
		crlf;
		<<
			'export const phases: Phase[] = [
'.
	(aModel allCSNPage sorted: #name ascending)
		do: [ :blPhase | 
			currentWriteStream
				<< blPhase getMetadata;
				<< ',';
				<< String crlf ].
	currentWriteStream
		<<
			'
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
	(aModel allCSNService sorted: #uniqueName ascending)
		do: [ :service | 
			currentWriteStream
				<< '        ';
				<< service uniqueName;
				<< ',';
				<< String crlf ].
	currentWriteStream
		<<
			'        { provide: PHASES, useValue: phases } as Provider
    ]
})
export class ';
		<< aModel name capitalized;
		<< 'Module { }';
		<< String crlf
]

{ #category : #generate }
CSNModelExporterAngular >> generateModuleSourceCodeForPage: aCSNPage [
	currentWriteStream
		<<
			'import { NgModule } from ''@angular/core'';
import { TranslateModule } from ''@ngx-translate/core'';
import { CommonModule } from ''@angular/common'';
import { Phase, PhaseService, ComponentsModule } from ''app/projects/bl-shell/src/public-api'';
import { ';
		<< aCSNPage componentName;
		<< ' } from ''./components/';
		<< aCSNPage getFolderName;
		<< '/';
		<< aCSNPage getAcceptedName;
		<<
			'.component'';
import { PHASE_ROUTES } from ''./';
		<< aCSNPage getAcceptedName;
		<< '.route'';';
		<< String crlf;
		<< (aCSNPage widgetsDependenciesImportInstructionFrom: self);
		<< (aCSNPage businessPage flatCollect: [ :aBusinessPage | aBusinessPage getImportStringAndSubBusinessPageImportStringWithLocalPath: '.' ]);
		<<
			'
export const COMPONENTS: any[] = [
    ';
		<< aCSNPage componentName;
		<<
			',
';
		<< aCSNPage getComponentsPageMetierListName;
		<<
			'
];

@NgModule({
    declarations: [
        COMPONENTS
    ],
    imports: [
        CommonModule,
        PHASE_ROUTES,
';
		<< (aCSNPage widgetsDependenciesNameFrom: self);
		<<
			'
        ComponentsModule,
        TranslateModule
    ],
    entryComponents: [
        ';
		<< aCSNPage componentName;
		<<
			'
    ]
})
export class ';
		<< aCSNPage getModuleClassName;
		<< ' {}';
		<< String crlf
]

{ #category : #generate }
CSNModelExporterAngular >> generateRouteSourceCodeForModel: aModel [
  currentWriteStream
     << 'import { ModuleWithProviders } from ''@angular/core'';
import { Routes, RouterModule, PreloadAllModules } from ''@angular/router'';
import { IndexComponent } from ''./components/index/index.component'';

const routes: Routes = [
    { path: '''', pathMatch: ''full'', redirectTo: ''desktop'' },
    { path: ''desktop'', component: IndexComponent, children: [';
     << String crlf.
  aModel allCSNPage do: [:phase |  currentWriteStream
           << '        { path: ''';
           << phase name;
           << '/:id'', loadChildren: () => import(''./phases/';
           << phase getLocalModulePath;
			  << ''').then(m => m.';
			  << phase getModuleClassName;
			  << ')},';
           << String crlf ].
  currentWriteStream << '    ]}
];
export const DEMOS_ROUTES: ModuleWithProviders = RouterModule.forRoot(routes, { useHash: false });'
]

{ #category : #generate }
CSNModelExporterAngular >> generateRouteSourceCodeForPage: aCSNPage [
	currentWriteStream
		<<
			'import { ModuleWithProviders } from ''@angular/core'';
import { RouterModule, Routes } from ''@angular/router'';
import { ';
		<< aCSNPage componentName;
		<< ' } from ''./components/';
		<< aCSNPage getFolderName;
		<< '/';
		<< aCSNPage getAcceptedName;
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

export const PHASE_ROUTES: ModuleWithProviders = RouterModule.forChild(routes);
'
]

{ #category : #generate }
CSNModelExporterAngular >> generateTSSourceCodeForBusinessPage: aBLPageMetier [
	self writeBusinessPageImportList.
	aBLPageMetier collectPhaseCalled
		ifNotEmpty: [ self writeImportForNavigation ].
	currentWriteStream
		<< (String crlf join: (aBLPageMetier widgetsDependenciesFrom: self));
		<<
			'

@Component({
    selector: ''';
		<< aBLPageMetier getSelector;
		<<
			''',
    templateUrl: ''./';
		<< aBLPageMetier getHTMLName;
		<<
			'''
})
export class ';
		<< aBLPageMetier componentName;
		<<
			' implements OnInit, OnDestroy {

'.
	aBLPageMetier collectPhaseCalled
		do: [ :phase | 
			currentWriteStream
				<< '    public ';
				<< phase name;
				<< ': Phase;';
				<< String crlf ].
	currentWriteStream
		<<
			'
';
		<<
			(aBLPageMetier recursiveWidgets removeDuplicates flattened
				flatCollect: #getVariables);
		<<
			'

    constructor('.
	aBLPageMetier collectPhaseCalled
		ifNotEmpty: [ currentWriteStream
				<<
					'protected _desktopStateService: DesktopStateService, private _phaseService: PhaseService, ' ].
	currentWriteStream
		<<
			') {
'.
	aBLPageMetier collectPhaseCalled
		do: [ :phase | 
			currentWriteStream
				<< '        this.';
				<< phase name;
				<< ' = this._phaseService.getPhase(''';
				<< phase name;
				<< ''');';
				<< String crlf ].
	currentWriteStream
		<<
			'
    }

    public ngOnInit(): void {
';
		<<
			(aBLPageMetier recursiveWidgets flattened
				flatCollect: #getInitializations);
		<<
			'
    }

    public ngOnDestroy(): void {

    }
'.
	aBLPageMetier collectPhaseCalled
		ifNotEmpty: [ self writeOpenPhaseMethod ].
	currentWriteStream
		<<
			'

';
		<<
			'
}
'
]

{ #category : #generate }
CSNModelExporterAngular >> generateTSSourceCodeForModel: aModel [
  currentWriteStream << 'import { Component, OnInit } from ''@angular/core'';
import { Phase, PhaseService } from ''app/projects/bl-shell/src/public-api'';

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
	currentWriteStream
		<<
			'import {
    Component,
    OnDestroy,
    OnInit'.
	aCSNPage hasMultiplePageMetier
		ifTrue: [ currentWriteStream
				<< ',';
				"			<< String crlf;
			<< '    ElementRef,';"
					<< String crlf;
				<< '    ViewChild' ].
	currentWriteStream
		<<
			'
} from ''@angular/core'';
import { Router } from ''@angular/router'';
import { PhaseComponent } from ''app/projects/bl-shell/src/public-api'';
import { AbstractPhaseComponent } from ''app/projects/bl-shell/src/public-api'';
import { DesktopStateService } from ''app/projects/bl-shell/src/public-api'';
'.
	aCSNPage hasMultiplePageMetier
		ifTrue: [ currentWriteStream
				<< 'import { BusinessPageContainerComponent } from ''app/projects/bl-shell/src/public-api'';';
				<< String crlf ].
	aCSNPage businessPage
		do: [ :metier | 
			currentWriteStream
				<< 'import { ';
				<< metier componentName;
				<< ' } from ''../..';
				<< metier getLocalComponentPath;
				<< ''';';
				<< String crlf ].
	currentWriteStream
		<<
			'


@Component({
    templateUrl: ''./';
		<< aCSNPage getHTMLName;
		<<
			'''
})
export class ';
		<< aCSNPage componentName capitalized;
		<<
			' extends AbstractPhaseComponent implements PhaseComponent, OnInit, OnDestroy {

'.
	aCSNPage hasMultiplePageMetier
		ifTrue: [ currentWriteStream
				<<
					'    @ViewChild(BusinessPageContainerComponent, { static: false }) public container: BusinessPageContainerComponent;
';
				<< String crlf ].
	aCSNPage hasMultiplePageMetier ifTrue: [ aCSNPage businessPage do: [ :metier | currentWriteStream << (metier idViewChildFrom: self) << String crlf ] ].
	currentWriteStream
		<<
			'

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

{ #category : #initialization }
CSNModelExporterAngular >> initialize [
	indentLevel := 0.
]

{ #category : #api }
CSNModelExporterAngular >> prepareExport [
	super prepareExport.
	context := CSNContext new
		root: (FileSystem disk workingDirectory / model name) asFileReference;
		yourself
]

{ #category : #api }
CSNModelExporterAngular >> protectString: aString [
	^ aString
		ifNotNil: [ ((aString copyReplaceAll: '"' with: '&quot;') copyReplaceAll: '<' with: '&lt;') copyReplaceAll: '>' with: '&gt;' ]
		ifNil: [ '' ]
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
CSNModelExporterAngular >> visitCSNAttribute: aCSNAttribute [
	aCSNAttribute widget
		ifNil: [ WidgetRepresentation new exportAttribute: aCSNAttribute with: self ]
		ifNotNil: [ :widget | widget exportAttribute: aCSNAttribute with: self ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNBusinessPage: aBLPageMetier [
	| pageMetierRoot |
	pageMetierRoot := self currentPath.
	[ pageMetierRoot ensureCreateDirectory ]
		on: DirectoryExists
		do: [  ].

	"Write pageMetier.module.ts"
	currentWriteStream := (pageMetierRoot / aBLPageMetier getHTMLName) asFileReference writeStream.
	[ self generateHTMLSourceCodeForBusinessPage: aBLPageMetier.
	currentWriteStream flush ]
		ensure: [ currentWriteStream close ].

	"Write pageMetier.route.ts"
	currentWriteStream := (pageMetierRoot / aBLPageMetier getTSName) asFileReference writeStream.
	[ self generateTSSourceCodeForBusinessPage: aBLPageMetier.
	currentWriteStream flush ]
		ensure: [ currentWriteStream close ].
	aBLPageMetier metiers
		do: [ :metier | 
			self clone
				currentPath: pageMetierRoot / 'components' / metier getFolderName;
				visit: metier ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNContainer: aBLUIContainer [
	| angularRepresentation |
	angularRepresentation := self angularRepresentationOf: aBLUIContainer.
	aBLUIContainer layout
		ifNotNil: [ :layout | 
			angularRepresentation exportHeaderOf: aBLUIContainer with: self.
			self visit: layout.
			angularRepresentation exportFooterOf: aBLUIContainer with: self ]
		ifNil: [ angularRepresentation export: aBLUIContainer with: self ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNLCell: aBLCell [
	aBLCell layoutOwner container = aBLCell widget ifTrue: [ ^ '' ].
	^ self visit: (aBLCell widget ifNil: [ ^ '' ])
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNLGridLayout: aBLUIGridLayout [
	self
     crlf;
     indentPlus;
     << '<tbody>';
     crlf;
     indentPlus.
  0 to: aBLUIGridLayout maxLevel do: [:number |  self
           << '<tr>';
           crlf;
           indentPlus.
        (aBLUIGridLayout atLevelSorted: number) reject: #isNil thenDo: [:cell |  self << '<td'.
              cell attributesTagWith: self.
              self
                 <<< '>';
                 crlf.
              self indentPlus.
              self visit: cell.
              self indentMinus.
              self
                 crlf;
                 << '</td>';
                 crlf ].
        self
           indentMinus;
           << '</tr>';
           crlf ].
  self
     indentMinus;
     << '</tbody>';
     indentMinus;
     crlf
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNLLayout: aBLLayout [
	aBLLayout container widgets , aBLLayout cell
		do: [ :widget | 
			self
				crlf;
				indentPlus.
			self visit: widget.
			self indentMinus ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNLeaf: aCSNLeaf [
^ self visitCSNWidget: aCSNLeaf
  "self << '<'.
  aBLUILeaf getListPropertiesAsStringWith: self.
  self <<< '>'.
  aBLUILeaf attributes select: [:a |  a isKindOf: CSNUILabel ] thenDo: [:attribute |  self
           crlf;
           indentPlus;
           indent.
        self visit: attribute.
        self
           crlf;
           indentMinus ].
  self
     << '</';
     <<< aBLUILeaf getSelector;
     <<< '>'"
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNPage: aBLPhase [
	| phaseRoot componentsRoot indexRoot |
	phaseRoot := self currentPath.
	phaseRoot ensureCreateDirectory.
	"Write phase.module.ts"
	currentWriteStream := (phaseRoot / aBLPhase getModuleName) asFileReference writeStream.
	[ self generateModuleSourceCodeForPage: aBLPhase.
	currentWriteStream flush ]
		ensure: [ currentWriteStream close ].
	"Write phase.route.ts"
	currentWriteStream := (phaseRoot / aBLPhase getRouteName) asFileReference writeStream.
	[ self generateRouteSourceCodeForPage: aBLPhase.
	currentWriteStream flush ]
		ensure: [ currentWriteStream close ].
	"Write components"
	componentsRoot := self currentPath / 'components'.
	componentsRoot ensureCreateDirectory.
	indexRoot := componentsRoot / aBLPhase getFolderName.
	indexRoot ensureCreateDirectory.

	currentWriteStream := (indexRoot / aBLPhase getTSName) asFileReference writeStream.
	[ self generateTSSourceCodeForPage: aBLPhase.
	currentWriteStream flush ]
		ensure: [ currentWriteStream close ].

	currentWriteStream := (indexRoot / aBLPhase getHTMLName) asFileReference writeStream.
	[ self generateHTMLSourceCodeForPage: aBLPhase.
	currentWriteStream flush ]
		ensure: [ currentWriteStream close ].

	aBLPhase businessPage
		do: [ :metier | 
			self clone
				currentPath: componentsRoot / metier getAcceptedName;
				visit: metier ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIAbsoluteHeight: aBLUIAbsoluteHeight [
  self
     <<< (self protectString: aBLUIAbsoluteHeight attributeValue);
     <<< 'px'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIAbsoluteWidth: aBLUIAbsoluteWidth [
	self
		<<< (self protectString: aBLUIAbsoluteWidth attributeValue);
		<<< 'px'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUICWClickHandler: aCSNClickHandler [
	self visitCSNAction: aCSNClickHandler
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUICWHTML: aBLHTML [
	self crlf.
	aBLHTML widgets do: [ :widget | self << widget text ] separatedBy: [ self crlf ].

	self crlf
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUICWSplitButton: aBLSplitButton [
  self << '<'.
  aBLSplitButton getListPropertiesAsStringWith: self.
  self
     <<< '></';
     <<< (aBLSplitButton getSelectorFrom: self);
     <<< '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIHeight: aBLUIHeight [
  self <<< (self protectString: aBLUIHeight attributeValue)
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIImage: aBLUIImage [
  self << '<'.
  aBLUIImage getListPropertiesAsStringWith: self.
  self <<< ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIInputCheckbox: aBLUIInputCheckbox [
  self << '<'.
  aBLUIInputCheckbox getListPropertiesAsStringWith: self.
  self
     <<< ' type="checkbox"></';
     <<< (aBLUIInputCheckbox getSelectorFrom: self);
     <<< '>'
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
CSNModelExporterAngular >> visitCSNUIInputNumber: aBLUIInputNumber [
  self << '<'.
  aBLUIInputNumber getListPropertiesAsStringWith: self.
  self <<< ' type="number"/>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIInputRange: aCSNUIInputRange [
  self << '<'.
  aCSNUIInputRange getListPropertiesAsStringWith: self.
  self
     <<< ' type="range"></';
     <<< aCSNUIInputRange getSelector;
     <<< '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIInputTime: aBLUIInputTime [
  self << '<'.
  aBLUIInputTime getListPropertiesAsStringWith: self.
  self <<< ' type="time"/>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUILabel: aBLUILabel [
  self <<< (self protectString: aBLUILabel attributeValue)
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIName: aBLUIName [
  self <<< (self protectString: aBLUIName attributeValue)
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIPanel: aBLUIPanel [
 	self visitCSNContainer:  aBLUIPanel
	"aBLUIPanel layout ifNotNil: [:layout |  self visit: layout ] ifNil: [ self
           << '<';
           <<< (aBLUIPanel getListPropertiesAsStringWith: self);
           <<< '>'.
        aBLUIPanel widgets do: [:widget |  self <<< String crlf.
              self indentPlus.
              self visit: widget.
              self indentMinus ].
        self
           crlf;
           << '</';
           <<< aBLUIPanel getSelector;
           <<< '>' ]"
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIParagraph: aBLUIParagraph [
  self << '<'.
  aBLUIParagraph getListPropertiesAsStringWith: self.
  self <<< '>'.
  aBLUIParagraph attributes select: [:a |  a isKindOf: CSNUILabel ] thenDo: [:attribute |  self
           crlf;
           indentPlus;
           indent.
        self visit: attribute.
        self
           indentMinus;
           crlf ].
  self
     << '</';
     <<< aBLUIParagraph getSelector;
     <<< '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIPlaceholder: aBLUIPlaceholder [
	self <<<  (self protectString: aBLUIPlaceholder attributeValue)
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIRelativeHeight: aBLUIRelativeHeight [
  self
     <<< (self protectString: aBLUIRelativeHeight attributeValue);
     <<< '%'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIRelativeWidth: aBLUIRelativeWidth [
  self
     <<< (self protectString: aBLUIRelativeWidth attributeValue);
     <<< '%'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUISelect: aBLUISelect [
  self << '<'.
  aBLUISelect getListPropertiesAsStringWith: self.
  self
     <<< '>';
     crlf;
     << '</';
     <<< (aBLUISelect getSelectorFrom: self);
     <<< '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUITitle: aBLUITitle [
	self <<< (self protectString: aBLUITitle attributeValue) 
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
	currentWriteStream := (self root / aMooseModel getModuleName) asFileReference writeStream.
	self generateModuleSourceCodeForModel: aMooseModel.
	currentWriteStream
		flush;
		close.

	"Write defaultmaterial.module.ts"
	currentWriteStream := (self root / 'material-module.ts') asFileReference writeStream.
	self generateMaterialModuleSourceCodeForModel: aMooseModel.
	currentWriteStream
		flush;
		close.
		
	"Write app.route.ts"
	currentWriteStream := (self root / aMooseModel getRouteName) asFileReference writeStream.
	self generateRouteSourceCodeForModel: aMooseModel.
	currentWriteStream
		flush;
		close.

	"Write components"
	rootComponents := self root / 'components' / 'index'.
	rootComponents ensureCreateDirectory.
	currentWriteStream := (rootComponents / aMooseModel getHTMLName) asFileReference writeStream.
	self generateHTMLSourceCodeForModel: aMooseModel.
	currentWriteStream
		flush;
		close.
	currentWriteStream := (rootComponents / aMooseModel getTSName) asFileReference writeStream.
	self generateTSSourceCodeForModel: aMooseModel.
	currentWriteStream
		flush;
		close.
	rootPhases := self root / 'phases'.
	rootPhases createDirectory.
	aMooseModel allCSNPage
		do: [ :aPage | 
			self
				execute: [ self clone
						currentPath: self rootPhases / aPage name;
						visit: aPage ]
				recordedAs: 'export ' , aPage name asString ]
		displayingProgress: [ :page | 'export page: ' , page codePhase asString ].
	aMooseModel allCSNService do: [ :rootElement | self visit: rootElement ]
]

{ #category : #'private-generate' }
CSNModelExporterAngular >> writeBusinessPageImportList [
	currentWriteStream
		<<
			'import {
';
		<< self businessPageImportList;
		<<
			'
} from ''@angular/core'';
'
]

{ #category : #accessing }
CSNModelExporterAngular >> writeFile: aFileReference withCode: theSourceCode [
	aFileReference writeStreamDo: [ :aWriteStream | aWriteStream nextPutAll: theSourceCode ]
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
