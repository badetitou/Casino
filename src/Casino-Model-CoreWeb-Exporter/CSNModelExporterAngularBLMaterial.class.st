"
We use this class for the export of the code using a possible new shell
"
Class {
	#name : #CSNModelExporterAngularBLMaterial,
	#superclass : #CSNModelExporterAngular,
	#category : #'Casino-Model-CoreWeb-Exporter'
}

{ #category : #actions }
CSNModelExporterAngularBLMaterial class >> export: aBLMooseModel [
	self new
		model: aBLMooseModel;
		exporterAngularConfiguration: CSNExporterAngularMaterialConfiguration new;
		export
]

{ #category : #visiting }
CSNModelExporterAngularBLMaterial >> generateHTMLSourceCodeFor1PageMetierForPage: aCSNPage [

	currentWriteStream << aCSNPage businessPage anyOne getTag
]

{ #category : #visiting }
CSNModelExporterAngularBLMaterial >> generateHTMLSourceCodeForMultiplePageMetierForPage: aCSNPage [

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
	currentWriteStream << '    </<mat-tab-group>>'
]

{ #category : #visiting }
CSNModelExporterAngularBLMaterial >> generateHTMLSourceCodeForNoPageMetierForPage: aCSNPage [

	aCSNPage widgets do: [ :widget | 
		self visit: widget.
		currentWriteStream << String crlf ]
]

{ #category : #visiting }
CSNModelExporterAngularBLMaterial >> generateHTMLSourceCodeForPage: aBLPhase [

	self generateHTMLSourceCodeDependOfPageMetierForPage: aBLPhase
]

{ #category : #visiting }
CSNModelExporterAngularBLMaterial >> generateMenu: aModel [

	currentWriteStream << 'import {MenuItem} from ''@bl/bl-app-layout'';

export let menus: MenuItem[] = [
  {
    key: ''omaje'',
    path: ''/omaje'',
    icon: ''fal fa-home'',
    currentTraduction:undefined,
    withHeadTitle: true,
    subMenus: ['.
	aModel allCSNPage
		do: [ :phase | 
			currentWriteStream
				<< '        { '; crlf.
				currentWriteStream << '            key: '''; << phase name asRealCamelCase; << ''','; crlf.
				currentWriteStream << '            path: ''/omaje/'; << phase name asRealCamelCase; << ''','; crlf.
				currentWriteStream << '            currentTraduction: '''; << phase name asRealCamelCase; << ''','; crlf.
				currentWriteStream << '            icon: ''fal fa-home'','; crlf.
				currentWriteStream << '            subMenus: [ ] '; crlf.
				currentWriteStream << '        }'
				 ]
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
CSNModelExporterAngularBLMaterial >> generateModuleSourceCodeForPage: aCSNPage [
	currentWriteStream
		<<
			'import { NgModule } from ''@angular/core'';
import { TranslateModule } from ''@ngx-translate/core'';
import { CommonModule } from ''@angular/common'';
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
        PHASE_ROUTES,
';
		<< (aCSNPage widgetsDependenciesNameFrom: self);
		<<
			'
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

{ #category : #visiting }
CSNModelExporterAngularBLMaterial >> generateRouteSourceCodeForModel: aModel [
  currentWriteStream
     << 'import { ModuleWithProviders } from ''@angular/core'';
import { Routes, RouterModule, PreloadAllModules } from ''@angular/router'';
import { IndexComponent } from ''./components/index/index.component'';

const routes: Routes = [
    { path: '''', pathMatch: ''full'', redirectTo: ''home'' },
    { path: ''desktop'', component: IndexComponent, children: [';
     << String crlf.
  aModel allCSNPage do: [:phase |  currentWriteStream
           << '        { path: ''';
           << phase name asRealCamelCase;
           << ''', loadChildren: () => import(''./features/';
           << phase getLocalModulePath;
			  << ''').then(m => m.';
			  << phase getModuleClassName;
			  << ')},';
           << String crlf ].
  currentWriteStream << '    ]}
];
export const DEMOS_ROUTES: ModuleWithProviders<RouterModule> = RouterModule.forRoot(routes, { useHash: false });'
]

{ #category : #visiting }
CSNModelExporterAngularBLMaterial >> generateTSSourceCodeForPage: aCSNPage [

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

{ #category : #visiting }
CSNModelExporterAngularBLMaterial >> printServiceDependencies: aCSNService [
	aCSNService dependencies
		ifNotEmpty: [ :dependencies | 
			self << 'import { '; indentPlus.
			(dependencies asOrderedCollection sorted: #name ascending)
				do: [ :dependency | self <<< dependency name ]
				separatedBy: [ self
						<<< ',';
						crlf;
						indent ].
			self <<< ' } from ''../models'';'; indentMinus.
			self
				crlf;
				crlf ]
]

{ #category : #visiting }
CSNModelExporterAngularBLMaterial >> rootPhases [
	^ self root / 'features'
]

{ #category : #visiting }
CSNModelExporterAngularBLMaterial >> visitCSNService: aCSNService [
	self serviceRoot ensureCreateDirectory.
	self serviceRoot / aCSNService getTSName
		writeStreamDo: [ :stream | 
			self currentWriteStream: stream.
			self
				<<
					'import { Injectable } from ''@angular/core'';

import { Observable } from ''rxjs'';
import { first, map } from ''rxjs/operators'';

import { HttpClient, HttpHeaders, HttpParams } from ''@angular/common/http'';
import { ObjectMapper } from ''@outfoxx/jackson-js'';
import { MapToStringJsonConverterService } from ''app/projects/bl-shell/src/public-api'';
';
				crlf;
				crlf.

			self printServiceDependencies: aCSNService.

			self
				<<
					'/**
 * Generated By Casino
 *
 * @author Benoît Verhaeghe
 */
@Injectable()
export class ' << aCSNService uniqueName
				<<
					' {

    private objectMapper: ObjectMapper;

    constructor(private http: HttpClient,
        private mapToStringConverter: MapToStringJsonConverterService) {
        this.objectMapper = new ObjectMapper({},
            { features: { deserialization: { FAIL_ON_UNKNOWN_PROPERTIES: false } }});
    }

'.
			(aCSNService actions sorted: #uniqueName ascending)
				do: [ :action | 
					self indentPlus.
					action accept: self.
					self indentMinus ]
				separatedBy: [ self crlf ].
			self
				<< '}';
				crlf ]
]

{ #category : #visiting }
CSNModelExporterAngularBLMaterial >> visitCSNServiceAPI: aServiceAPI [
	self
		<< '// TODO: Please check this service';
		crlf.
	self << 'public ' <<< aServiceAPI uniqueName <<< '('.
	aServiceAPI printParameterIn: self.

	self <<< '): Observable<'.
	aServiceAPI dataType ifNotNil: [ aServiceAPI dataType writeBusinessTypeOn: self] .
	self <<< '> {'.
	self indentPlus.
	aServiceAPI isGET
		ifTrue: [ aServiceAPI printCreateParamIn: self ]
		ifFalse: [ aServiceAPI printCreateFormDataIn: self ].
	self crlf.
	self << 'return this.http.'.
	aServiceAPI printRestTypeIn: self.
	self <<< '<'.
	aServiceAPI dataType ifNotNil: [ aServiceAPI dataType writeBusinessTypeOn: self] .
	self <<< '>(''/ws/' <<< aServiceAPI serviceOwner targetPoint asKebabCase <<< '/' <<< aServiceAPI name asKebabCase <<< ''''.
	self indentPlus.
	aServiceAPI isPOST
		ifTrue: [ self
				<<< ',';
				crlf;
				<< 'formData' ].
	self
		<<< ', {';
		crlf.
	self << 'withCredentials: true'.
	(aServiceAPI isGET and: [ aServiceAPI source isNotNil and: [ aServiceAPI source parameters isNotEmpty ] ])
		ifTrue: [ self
				<<< ',';
				crlf;
				<< 'params: params' ].
	self
		crlf;
		indentMinus;
		<< '}).pipe(first()'.
	aServiceAPI dataType ifNotNil: [:dateType | dateType innerType isBusinessType
		ifTrue: [ self
				<<< ',';
				crlf;
				indentPlus;
				<< 'map(res => ';
				inBraces: [ self << 'return '.
					aServiceAPI dataType printServiceDeserializeOn: self ];
				<<< ')';
				indentMinus ]].
	self
		crlf;
		<< ');';
		crlf;
		indentMinus;
		<< '}';
		crlf
]

{ #category : #visiting }
CSNModelExporterAngularBLMaterial >> visitMooseModel: aMooseModel [

	super visitMooseModel: aMooseModel.
	(self root / 'menu.ts') asFileReference writeStreamDo: [ :stream | 
		currentWriteStream := stream.
		self generateMenu: aMooseModel ]
]
