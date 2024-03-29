"
I am very much like the BLMaterial project but I allow one to export several micro-front-end
"
Class {
	#name : #CSNModelExporterAngularBLIdentity,
	#superclass : #CSNModelExporterAngular,
	#instVars : [
		'identityConfiguration',
		'currentModule'
	],
	#category : #'Casino-Model-CoreWeb-Exporter-BLIdentity'
}

{ #category : #actions }
CSNModelExporterAngularBLIdentity class >> export: aBLMooseModel [
	self error: 'This exporter need an Identity Configuration'
]

{ #category : #actions }
CSNModelExporterAngularBLIdentity class >> export: aBLMooseModel withIdentityConfiguration: anIdentityConfiguration [

	self new
		model: aBLMooseModel;
		identityConfiguration: anIdentityConfiguration;
		exporterAngularConfiguration: CSNExporterAngularMaterialConfiguration new;
		export
]

{ #category : #visiting }
CSNModelExporterAngularBLIdentity >> angularActionRepresentationOf: anAction [

	^ anAction isActionAppel
		  ifTrue: [ 
			  anAction call ifNil: [ ^ '' ].
			  ^ '(click)="openPhase(''/'
			    ,
			    (self identityConfiguration moduleOfPage: anAction call)
				   name asLowercase , '/' , anAction call name asRealCamelCase
			    , ''')"' ]
		  ifFalse: [ anAction getAngularRepresentationWith: self ]
]

{ #category : #accessing }
CSNModelExporterAngularBLIdentity >> behaviorImportExporter [
	^ CSNModelNullImportStringExporter
]

{ #category : #accessing }
CSNModelExporterAngularBLIdentity >> behaviorInitializeVariableExporter [
	^ CSNModelNullInitializeVariableExporter
]

{ #category : #accessing }
CSNModelExporterAngularBLIdentity >> behaviorModelExporter [
	^ CSNBehaviorModelExporterIdentity
]

{ #category : #accessing }
CSNModelExporterAngularBLIdentity >> blIdentityVersion [
	^ '#v12.2.9'
]

{ #category : #accessing }
CSNModelExporterAngularBLIdentity >> businessExporter [
	^ CSNBusinessExporter
]

{ #category : #export }
CSNModelExporterAngularBLIdentity >> configRepository: pathToRepo forModule: aCSNIModule [

	CSNIRepositoryConfigurator new
		location: pathToRepo;
		csniModule: aCSNIModule;
		configure
]

{ #category : #export }
CSNModelExporterAngularBLIdentity >> configShellLocated: shellRoot [


	CSNIShellConfigurator new
		location: shellRoot;
		modules: identityConfiguration modules;
		configure
]

{ #category : #accessing }
CSNModelExporterAngularBLIdentity >> currentModule [

	^ currentModule
]

{ #category : #accessing }
CSNModelExporterAngularBLIdentity >> currentModule: anObject [

	currentModule := anObject
]

{ #category : #export }
CSNModelExporterAngularBLIdentity >> exportModule: aCSNIModule [

	| moduleRoot |
	currentModule := aCSNIModule.
	moduleRoot := self root / (self root basename asLowercase , '-' , aCSNIModule name).
	moduleRoot ensureDeleteAll.
	IceGitClone new
		location: moduleRoot;
		url: ('https://gitlab.forge.berger-levrault.com/bl-drit/bl-identite-v2/microfrontend.git', self blIdentityVersion);
		execute.
	self configRepository: moduleRoot forModule: aCSNIModule.

	(moduleRoot / 'src' / 'app' / 'configuration' / 'menu.ts') asFileReference
		delete;
		writeStreamDo: [ :stream | 
			currentWriteStream := stream.
			self generateMenu: aCSNIModule ].
	"Write main.routing.ts"
	(moduleRoot / 'src/app/main/main.routing.ts') asFileReference
		delete;
		writeStreamDo: [ :stream | 
			currentWriteStream := stream.
			self generateRouteSourceCodeForModel: aCSNIModule ].
	"Write main.module.ts"
	(moduleRoot / 'src/app/main/main.module.ts') asFileReference
		delete;
		writeStreamDo: [ :stream | 
			currentWriteStream := stream.
			self generateModuleSourceCodeForModel: aCSNIModule ].
	(moduleRoot / 'src/app/main/features') ensureDeleteAll.
	aCSNIModule pages
		do: [ :aPage | 
			self
				execute: [ 
					self clone
						currentPath: moduleRoot / 'src/app/main/features' / aPage name asRealCamelCase;
						currentPage: aPage;
						visit: aPage ]
				recordedAs: 'export ' , aPage name asString ]
		displayingProgress: [ :page | 'export page: ' , page codePhase asString ]
]

{ #category : #export }
CSNModelExporterAngularBLIdentity >> exportShell [

	| shellRoot |
	shellRoot := self root / (self root basename asLowercase , '-shell').
	shellRoot ensureDeleteAll.
	IceGitClone new
		location: shellRoot;
		url: ('https://gitlab.forge.berger-levrault.com/bl-drit/bl-identite-v2/shell.git', self blIdentityVersion);
		execute.
	self configShellLocated: shellRoot.

]

{ #category : #visiting }
CSNModelExporterAngularBLIdentity >> generateCoreStoreModule: aMooseModel [

	self << 'import { NgModule } from ''@angular/core'';
import { CommonModule } from ''@angular/common'';
import { StoreModule } from ''@ngrx/store'';
import { EffectsModule } from ''@ngrx/effects'';
import { SharedModule } from ''../../shared/shared.module'';
import { HttpClientModule } from ''@angular/common/http'';'.

	self crlf.

	(aMooseModel allCSNService sorted: #uniqueName ascending) do: [ 
		:service | 
		(self << 'import { ' <<< service uniqueName
		 <<< ' } from ''./services/' <<< service getServiceName)
			<<< ''';';
			crlf.
		(self << 'import { ' <<< service uniqueName
		 <<< 'Effects } from ''./effects/' <<< service uniqueName)
			<<< '.effects'';';
			crlf.
		(self << 'import { ' <<< service uniqueName uncapitalized
		 <<< 'Reducer, ' <<< service uniqueName uncapitalized
		 <<< 'StateName } from ''./reducers/' <<< service uniqueName)
			<<< '.reducer'';';
			crlf ].

	self crlf crlf.
	self << '@NgModule('.
	self inBraces: [ 
		self << 'imports: '.
		self inBrakets: [ 
			self
				<< 'CommonModule,';
				crlf.
			self
				<< 'HttpClientModule,';
				crlf.
			self
				<< 'SharedModule,';
				crlf.
			aMooseModel allCSNService do: [ :service | 
				(self << 'StoreModule.forFeature('
				 <<< service uniqueName uncapitalized <<< 'StateName, '
				 <<< service uniqueName uncapitalized)
					<<< 'Reducer),';
					crlf ].
			self << 'EffectsModule.forFeature(['.
			aMooseModel allCSNService
				do: [ :service | self <<< service uniqueName <<< 'Effects' ]
				separatedBy: [ self <<< ', ' ].
			self
				<<< ']),';
				crlf ].
		self
			<<< ',';
			crlf.
		self << 'providers: '.
		self inBrakets: [ 
			(aMooseModel allCSNService reject: [ :service | "Parent services are abstract and not @Injectable, so they're not providers."
				 service source directSubclasses anySatisfy: [ :subclass | 
					 subclass isInterface ] ])
				do: [ :service | self << service uniqueName ]
				separatedBy: [ 
					self
						<<< ',';
						crlf ] ] ].
	self
		<<< ')';
		crlf.
	self << 'export class CoreStoreModule { }'
]

{ #category : #visiting }
CSNModelExporterAngularBLIdentity >> generateHTMLSourceCodeFor1PageMetierForPage: aCSNPage [

	currentWriteStream << aCSNPage businessPage anyOne getTag
]

{ #category : #visiting }
CSNModelExporterAngularBLIdentity >> generateHTMLSourceCodeForMultiplePageMetierForPage: aCSNPage [

	currentWriteStream << '<mat-tab-group>'.
	aCSNPage sortedPageMetiers do: [ :metier | 
		currentWriteStream
			<< '
            <mat-tab label="';
			<< (self protectString: metier title);
			<< '">	';
			<< String crlf;
			<< '                ';
			<< metier getTag;
			<< String crlf;
			<< '            </mat-tab>';
			<< String crlf ].
	currentWriteStream << '</mat-tab-group>'
]

{ #category : #visiting }
CSNModelExporterAngularBLIdentity >> generateHTMLSourceCodeForNoPageMetierForPage: aCSNPage [

	aCSNPage widgets do: [ :widget | 
		self visit: widget.
		currentWriteStream << String crlf ]
]

{ #category : #visiting }
CSNModelExporterAngularBLIdentity >> generateHTMLSourceCodeForPage: aBLPhase [

	self generateHTMLSourceCodeDependOfPageMetierForPage: aBLPhase
]

{ #category : #visiting }
CSNModelExporterAngularBLIdentity >> generateMenu: aCSNIModule [

	currentWriteStream << 'import {MenuItem} from ''@bl/bl-app-layout'';

export let menus: MenuItem[] = [
  {
   key: '''.
	currentWriteStream << aCSNIModule name asLowercase.
	currentWriteStream << ''',
    path: ''/'.
	currentWriteStream << aCSNIModule name asLowercase.
	currentWriteStream << ''',
    icon: ''fal fa-home'',
    withHeadTitle: true,
    main:false,
    subMenus: ['.
	aCSNIModule pages
		do: [ :page | 
			currentWriteStream
				<< '        { ';
				crlf.
			currentWriteStream
				<< '            key: ''';
				<< page name asRealCamelCase;
				<< ''',';
				crlf.
			currentWriteStream << '            path: ''/'.
				currentWriteStream << aCSNIModule name asLowercase.
			currentWriteStream
				<< '/';
				<< page name asRealCamelCase;
				<< ''',';
				crlf.
			currentWriteStream
				<< '            icon: ''fal fa-home'',';
				crlf.
			currentWriteStream
				<< '            subMenus: [ ] ';
				crlf.
			currentWriteStream << '        }' ]
		separatedBy: [ 
			currentWriteStream
				<< ',';
				crlf ].
	currentWriteStream << '
    ]
  },
];
'
]

{ #category : #visiting }
CSNModelExporterAngularBLIdentity >> generateModuleSourceCodeForModel: aModel [

	currentWriteStream << 'import { Injector, NgModule } from ''@angular/core'';
import { MainComponent } from ''./main.component'';
import { RouterModule } from ''@angular/router'';
import { TranslateLoader, TranslateModule } from ''@ngx-translate/core'';
import { environment } from ''src/environments/environment'';
import { createCustomElement } from ''@angular/elements'';
import { ROUTES_MAIN_WRAPPER, ROUTES_MICRO_FRONTEND } from ''./main.routing'';
import { StoreModule } from ''@ngrx/store'';
import { CoreModule } from ''./core/core.module'';
import { CustomTranslateLoader } from ''./core/services/override/custom_translate_loader.service'';
import { SharedModule } from ''./shared/shared.module'';
import { CommonModule } from ''@angular/common'';
import { InitModule } from ''./core/init.module'';

@NgModule({
  imports: [
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useClass: CustomTranslateLoader
      }
    }),
    RouterModule.forChild(ROUTES_MAIN_WRAPPER),
    StoreModule,
    CommonModule,
    SharedModule,
    InitModule,
    CoreModule
  ],
  providers:[],
  declarations: [MainComponent],
  bootstrap:[]
})
export class MainModule {
  constructor(private injector: Injector) {
    console.log("Main module loaded")
  }

  ngDoBootstrap() {
    const ce = createCustomElement(MainComponent, {injector: this.injector});
    customElements.define(environment.appName+''-element'', ce);
  }
}
'
]

{ #category : #visiting }
CSNModelExporterAngularBLIdentity >> generateModuleSourceCodeForPage: aCSNPage [

	currentWriteStream
		<< 'import { NgModule } from ''@angular/core'';
import { TranslateModule } from ''@ngx-translate/core'';
import { CommonModule } from ''@angular/common''
import { MatSnackBarModule } from ''@angular/material/snack-bar'';
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
		<< (aCSNPage widgetsDependenciesImportInstructionFrom: self);
		<< (aCSNPage businessPage flatCollect: [ :aBusinessPage | aBusinessPage getImportStringAndSubBusinessPageImportStringWithLocalPath: '.' ]);
		<< '
export const COMPONENTS: any[] = [
    ';
		<< aCSNPage componentName;
		<< ',
';
		<< aCSNPage getComponentsPageMetierListName;
		<< '
];

@NgModule({
    declarations: [
        COMPONENTS
    ],
    imports: [
        PHASE_ROUTES,
        CommonModule,
';
		<< (aCSNPage widgetsDependenciesNameFrom: self);
		<< '
        MatSnackBarModule,
        TranslateModule
    ]
})
export class ';
		<< aCSNPage getModuleClassName;
		<< ' {}';
		<< String crlf
]

{ #category : #visiting }
CSNModelExporterAngularBLIdentity >> generateRouteSourceCodeForModel: aModel [

	currentWriteStream
	<< 'import { ModuleWithProviders } from ''@angular/core'';
import { Routes, RouterModule, PreloadAllModules } from ''@angular/router'';
import { MainComponent } from "./main.component";

export const ROUTES_MICRO_FRONTEND: Routes = [
    {path: "", component: MainComponent, children:[
        {path: "", pathMatch:"full", redirectTo: "'.
	currentWriteStream << aModel pages anyOne name asRealCamelCase.
	currentWriteStream
		<< '"},';
		<< String crlf.
	aModel pages do: [ :page | 
		currentWriteStream
			<< '        { path: ''';
			<< page name asRealCamelCase;
			<< ''', loadChildren: () => import(''./features/';
			<< page getLocalModulePath;
			<< ''').then(m => m.';
			<< page getModuleClassName;
			<< ')},';
			<< String crlf ].
	currentWriteStream << '    ]}
];

export const ROUTES_MAIN_WRAPPER: Routes = [
    {path: "", component: MainComponent, canActivate: [], children: [
        ...ROUTES_MICRO_FRONTEND
        ]
    }
]
'
]

{ #category : #visiting }
CSNModelExporterAngularBLIdentity >> generateTSSourceCodeForPage: aCSNPage [

	currentWriteStream << 'import {
    Component,
    OnDestroy,
    OnInit'.
	aCSNPage hasMultiplePageMetier ifTrue: [ 
		currentWriteStream
			<< ',';
			<< String crlf;
			<< '    ViewChild' ].
	currentWriteStream << '
} from ''@angular/core'';
import { Router } from ''@angular/router'';
'.

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
		<< ' implements  OnInit, OnDestroy {

'.

	currentWriteStream
		<< '

    constructor() {
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

{ #category : #accessing }
CSNModelExporterAngularBLIdentity >> identityConfiguration [

	^ identityConfiguration
]

{ #category : #accessing }
CSNModelExporterAngularBLIdentity >> identityConfiguration: anObject [

	identityConfiguration := anObject
]

{ #category : #accessing }
CSNModelExporterAngularBLIdentity >> initialize [

	super initialize.
	serviceExporter := CSNModelServiceExporterAngularBLIdentity new
]

{ #category : #visiting }
CSNModelExporterAngularBLIdentity >> rootPhases [
	^ self root / 'features'
]

{ #category : #visiting }
CSNModelExporterAngularBLIdentity >> runExport [
	identityConfiguration modules do: [ :module | 
		self exportModule: module.
		 ].
	self exportShell
]

{ #category : #visiting }
CSNModelExporterAngularBLIdentity >> serviceRoot [
	^ self root / 'core' / 'store'
]

{ #category : #visiting }
CSNModelExporterAngularBLIdentity >> visitCSNService: aCSNService [

	self serviceExporter
		rootFolder: self serviceRoot;
		generateService: aCSNService
]

{ #category : #visiting }
CSNModelExporterAngularBLIdentity >> visitMooseModel: aMooseModel [

	super visitMooseModel: aMooseModel.
	(self root / 'menu.ts') asFileReference writeStreamDo: [ :stream | 
		currentWriteStream := stream.
		self generateMenu: aMooseModel ].
	(self serviceRoot / 'core-store.module.ts') asFileReference writeStreamDo: [ :stream | 
		currentWriteStream := stream.
		self generateCoreStoreModule: aMooseModel ]
]

{ #category : #visiting }
CSNModelExporterAngularBLIdentity >> writeImportForNavigation [

	^ currentWriteStream
		  << 'import { Router } from ''@angular/router''';
		  crlf
]

{ #category : #visiting }
CSNModelExporterAngularBLIdentity >> writeOpenPhaseMethod [
	currentWriteStream
		crlf;
		<<
			'    public openPhase(phase: string): void {
        this.router.navigate([phase])
    }'
]
