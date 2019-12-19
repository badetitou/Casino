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
		'currentPath',
		'currentWriteStream'
	],
	#category : #'Casino-Model-Exporter-Angular'
}

{ #category : #actions }
CSNModelExporterAngular class >> convertIfString: anObject [
	anObject isString
		ifTrue: [ ^ '"' , anObject , '"' ].
	^ anObject 
]

{ #category : #generate }
CSNModelExporterAngular >> businessPageImportList [
	^ '    Component,
    OnDestroy,
    OnInit,
    ElementRef,
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
  currentWriteStream << ((aBLPageMetier widgets reject: [:widget |  widget isPageMetier ]) flatCollect: [:widget |  (self visit: widget) , String crlf ])
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
	currentWriteStream <<
			(aCSNPage sortedPageMetiers
				flatCollect: [ :metier | 
					id := id + 1.
					'
            <bl-phase-business-page-tab id="P' , id asString
						, '" title="' , (self protectString: metier title) , '">	'
						, String crlf , '                ' , metier getTag , String crlf
						, '            </bl-phase-business-page-tab>' , String crlf ]).
	currentWriteStream << '    </bl-phase-business-pages-tab-container>'
]

{ #category : #visiting }
CSNModelExporterAngular >> generateHTMLSourceCodeForNoPageMetierForPage: aCSNPage [
	currentWriteStream << (aCSNPage widgets
		flatCollect: [ :widget | (self visit: widget) , String crlf ])
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
CSNModelExporterAngular >> generateModuleSourceCodeForModel: aModel [
  currentWriteStream
     << 'import { NgModule, Provider } from ''@angular/core'';
import { BrowserModule } from ''@angular/platform-browser'';
import { FormsModule } from ''@angular/forms'';
import { BrowserAnimationsModule } from ''@angular/platform-browser/animations'';
import { ToastrModule } from ''ngx-toastr'';

import { DEMOS_ROUTES } from ''./';
     << aModel name uncapitalized;
     << '.routing'';
import { IndexComponent } from ''./components/index/index.component'';
import { ComponentsModule } from ''../components/components.module'';
import { TranslateModule } from ''@ngx-translate/core'';
import { Phase, PHASES } from ''../components/service/model/phase/phase.model'';
'.
  aModel allCSNService do: [:service |  currentWriteStream
           << 'import { ';
           << service uniqueName;
           << ' } from ''./';
           << service getLocalPath;
           << ''';';
           << String crlf ].
  currentWriteStream << '

export const phases: Phase[] = [
'.
  aModel allCSNPage do: [:blPhase |  currentWriteStream
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
'.
  aModel allCSNService do: [:service |  currentWriteStream
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
     << 'Module { }'
]

{ #category : #generate }
CSNModelExporterAngular >> generateModuleSourceCodeForPage: aCSNPage [
  currentWriteStream
     << 'import { NgModule } from ''@angular/core'';
import { TranslateModule } from ''@ngx-translate/core'';
import { CommonModule } from ''@angular/common'';
import { ComponentsModule } from ''../../../components/components.module'';
import { IndexComponent } from ''./components/index/index.component'';
import { PHASE_ROUTES } from ''./';
     << aCSNPage name;
     << '.route'';';
     << String crlf;
     << aCSNPage widgetsDependenciesImportInstruction;
     << (aCSNPage businessPage flatCollect: [:aBusinessPage |  aBusinessPage getImportStringAndSubBusinessPageImportStringWithLocalPath: '.' ]);
     << '
export const COMPONENTS: any[] = [
    IndexComponent,
';
     << aCSNPage getComponentsPageMetierListName;
     << '
];

@NgModule({
    declarations: [
        COMPONENTS
    ],
    imports: [
        CommonModule,
        PHASE_ROUTES,
';
     << aCSNPage widgetsDependenciesName;
     << '
        ComponentsModule,
        TranslateModule
    ],
    entryComponents: [
        IndexComponent
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
           << '		{ path: ''';
           << phase name;
           << ''', loadChildren: ''./phases/';
           << phase getLocalModulePath;
           << '''},';
           << String crlf ].
  currentWriteStream << ']}
];
export const DEMOS_ROUTES: ModuleWithProviders = RouterModule.forRoot(routes, { useHash: false });'
]

{ #category : #generate }
CSNModelExporterAngular >> generateRouteSourceCodeForPage [
  currentWriteStream << 'import { ModuleWithProviders } from ''@angular/core'';
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
  currentWriteStream
     << '
import {
';
     << self businessPageImportList;
     << '
} from ''@angular/core'';
';
     << (aBLPageMetier collectPhaseCalled ifNotEmpty: [ 'import { DesktopStateService } from ''app/components/service/desktop-state.service'';
import { Phase } from ''app/components/service/model/phase/phase.model'';
import { PhaseService } from ''app/components/service/phase.service'';
' ]);
     << aBLPageMetier widgetsDependencies;
     << '

@Component({
    selector: ''';
     << aBLPageMetier getSelector;
     << ''',
    templateUrl: ''./';
     << aBLPageMetier getHTMLName;
     << '''
})
export class ';
     << aBLPageMetier componentName capitalized;
     << ' implements OnInit, OnDestroy {

';
     << (aBLPageMetier collectPhaseCalled flatCollect: [:phase |  '    public ' , phase name , ': Phase;' , String crlf ]);
     << (aBLPageMetier recursiveWidgets flattened collect: [:widget |  widget idViewChild ]) asOrderedCollection removeDuplicates flatten;
     << '
';
     << (aBLPageMetier recursiveWidgets removeDuplicates flattened flatCollect: #getVariables);
     << '

    constructor(';
     << (aBLPageMetier collectPhaseCalled ifNotEmpty: [ 'protected _desktopStateService: DesktopStateService, private _phaseService: PhaseService, ' ] ifEmpty: [ '' ]);
     << ') {
';
     << (aBLPageMetier collectPhaseCalled flatCollect: [:phase |  '        this.' , phase name , ' = this._phaseService.getPhase(''' , phase name , ''');' , String crlf ]);
     << '
    }

    public ngOnInit(): void {
';
     << (aBLPageMetier recursiveWidgets flattened flatCollect: #getInitializations);
     << '
    }

    public ngOnDestroy(): void {

    }
';
     << (aBLPageMetier collectPhaseCalled ifNotEmpty: [ String crlf , '    public openPhase(phase: Phase): void {
        this._desktopStateService.selectPhase(phase);
    }' ]);
     << '

';
     << '
}
'
  ",
			((self recursiveWidgets flatCollect: #attributes)
				flatCollect: [ :attribute | attribute attributeMethod ])"
]

{ #category : #generate }
CSNModelExporterAngular >> generateTSSourceCodeForModel: aModel [
  currentWriteStream << 'import { Component, OnInit } from ''@angular/core'';
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
  currentWriteStream
     << 'import {
    Component,
    OnDestroy,
    OnInit';
     << (aCSNPage hasMultiplePageMetier ifTrue: [ ', ViewChild' ] ifFalse: [ '' ]);
     << '
} from ''@angular/core'';
import { PhaseComponent } from ''../../../../../components/service/model/phase/phase-component.model'';
import { AbstractPhaseComponent } from ''../../../../../components/components/phase/abstract-phase.component'';
import { DesktopStateService } from ''../../../../../components/service/desktop-state.service'';
';
     << (aCSNPage hasMultiplePageMetier ifTrue: [ 'import { BusinessPageContainerComponent } from ''../../../../../components/components/phase/business-page/page-container/page-container.component'';' , String crlf ] ifFalse: [ '' ]);
     << (aCSNPage businessPage flatCollect: [:metier |  'import { ' , metier componentName , ' } from ''../..' , metier getLocalComponentPath , ''';' , String crlf ]);
     << '


@Component({
    templateUrl: ''./index.component.html''
})
export class IndexComponent extends AbstractPhaseComponent implements PhaseComponent, OnInit, OnDestroy {

';
     << (aCSNPage hasMultiplePageMetier ifTrue: [ '@ViewChild(BusinessPageContainerComponent) public container: BusinessPageContainerComponent;
' , String crlf ] ifFalse: [ '' ]);
     << (aCSNPage hasMultiplePageMetier ifTrue: [ aCSNPage businessPage flatCollect: [:metier |  '@ViewChild(' , metier componentName , ') public ' , metier getAcceptedName , ': ' , metier componentName , ';' , String crlf ] ] ifFalse: [ '' ]);
     << '

    constructor(protected phaseService: DesktopStateService) {
        super(phaseService);
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
CSNModelExporterAngular >> visitCSNAttribute: aBLAttribute [
	^ self protectString: aBLAttribute attributeValue asString
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNBusinessPage: aBLPageMetier [
  | pageMetierRoot |
  pageMetierRoot := self currentPath.
  [ pageMetierRoot ensureCreateDirectory ] on: DirectoryExists do: [  ].
  
  "Write pageMetier.module.ts"currentWriteStream := (pageMetierRoot / aBLPageMetier getHTMLName) asFileReference writeStream.
  self generateHTMLSourceCodeForBusinessPage: aBLPageMetier.
  currentWriteStream
     flush;
     close.
  
  "Write pageMetier.route.ts"currentWriteStream := (pageMetierRoot / aBLPageMetier getTSName) asFileReference writeStream.
  self generateTSSourceCodeForBusinessPage: aBLPageMetier.
  currentWriteStream
     flush;
     close.
  aBLPageMetier metiers do: [:metier |  self class new
           currentPath: pageMetierRoot / 'components' / metier getFolderName;
           visit: metier ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNContainer: aBLUIContainer [
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
CSNModelExporterAngular >> visitCSNLCell: aBLCell [
	aBLCell layoutOwner container = aBLCell widget ifTrue: [ ^ '' ].
	^ self visit: (aBLCell widget ifNil: [ ^ '' ])
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNLGridLayout: aBLUIGridLayout [
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
CSNModelExporterAngular >> visitCSNLLayout: aBLLayout [
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
CSNModelExporterAngular >> visitCSNLeaf: aBLUILeaf [
	^ '<' , (aBLUILeaf getListPropertiesAsStringWith: self) , '>'
		, ((aBLUILeaf attributes select: [ :a | a isKindOf: CSNUILabel ]) flatCollect: [ :attribute | String crlf , ((self visit: attribute) indentBy: 4) , String crlf ])
		, '</' , aBLUILeaf getSelector , '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNPage: aBLPhase [
	| phaseRoot componentsRoot indexRoot |
	phaseRoot := self currentPath.
	phaseRoot ensureCreateDirectory.
	"Write phase.module.ts"
	currentWriteStream := (phaseRoot / aBLPhase getModuleName) asFileReference writeStream. 
	self generateModuleSourceCodeForPage: aBLPhase.
	currentWriteStream flush; close.
	"Write phase.route.ts"
	currentWriteStream := (phaseRoot / aBLPhase getRouteName) asFileReference writeStream. 
	self generateRouteSourceCodeForPage.
	currentWriteStream flush; close.
	"Write components"
	componentsRoot := self currentPath / 'components'.
	componentsRoot ensureCreateDirectory.
	indexRoot := componentsRoot / 'index'.
	indexRoot ensureCreateDirectory.

	currentWriteStream := (indexRoot / aBLPhase getTSName) asFileReference writeStream. 
	self generateTSSourceCodeForPage: aBLPhase.
	currentWriteStream flush; close.
	
	currentWriteStream := (indexRoot / aBLPhase getHTMLName) asFileReference writeStream. 
	self generateHTMLSourceCodeForPage: aBLPhase.
	currentWriteStream flush; close.

	aBLPhase businessPage
		do: [ :metier | 
			self clone
				currentPath: componentsRoot / metier getAcceptedName;
				visit: metier ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIAbsoluteHeight: aBLUIAbsoluteHeight [
	^ self protectString: aBLUIAbsoluteHeight attributeValue, 'px'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIAbsoluteWidth: aBLUIAbsoluteWidth [
	^ self protectString: aBLUIAbsoluteWidth attributeValue , 'px'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUICWClickHandler: aCSNClickHandler [
	^ self visitCSNAction: aCSNClickHandler
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUICWHTML: aBLHTML [
	^ '', (aBLHTML widgets flatCollect: [ :widget | String crlf , (self visit: widget) , String crlf ])
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUICWSplitButton: aBLSplitButton [
	^  '<' , (aBLSplitButton getListPropertiesAsStringWith: self) , '></' , aBLSplitButton getSelector , '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIHeight: aBLUIHeight [
	^ self protectString: aBLUIHeight attributeValue 
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIImage: aBLUIImage [
	^   '<' ,  (aBLUIImage getListPropertiesAsStringWith: self) , ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIInputCheckbox: aBLUIInputCheckbox [
	^ '<' ,  (aBLUIInputCheckbox getListPropertiesAsStringWith: self), ' ></' , aBLUIInputCheckbox getSelector , '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIInputColor: aBLUIInputColor [
	^ '<' ,  (aBLUIInputColor getListPropertiesAsStringWith: self), ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIInputDate: aBLUIInputDate [
	^ '<' ,  (aBLUIInputDate getListPropertiesAsStringWith: self), ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIInputFile: aBLUIInputFile [
	^ '<' , (aBLUIInputFile getListPropertiesAsStringWith: self) , ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIInputMonth: aBLUIInputMonth [
	^ '<'
		,
			(aBLUIInputMonth
				getListPropertiesAsStringWith: self)
		,
			' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIInputNumber: aBLUIInputNumber [
	^ '<' ,  (aBLUIInputNumber getListPropertiesAsStringWith: self), ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIInputPassword: aBLUIInputPassword [
	^ '<' ,  (aBLUIInputPassword getListPropertiesAsStringWith: self) , ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIInputRadio: aCSNUIInputRadio [
	^ '<' ,  (aCSNUIInputRadio getListPropertiesAsStringWith: self), ' ></' , aCSNUIInputRadio getSelector , '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIInputText: aBLUIInputText [
	^  '<input id="float-' , aBLUIInputText mooseID asString , '" type="text" value="' , aBLUIInputText value1
		,
			'" placeholder="', aBLUIInputText text,'" pInputText>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIInputTime: aBLUIInputTime [
	^ '<' , (aBLUIInputTime getListPropertiesAsStringWith: self) , ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUILabel: aBLUILabel [
	^ self protectString: aBLUILabel attributeValue
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIName: aBLUIName [
	^ self protectString: aBLUIName attributeValue 
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIPanel: aBLUIPanel [
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
CSNModelExporterAngular >> visitCSNUIParagraph: aBLUIParagraph [
	^ '<' , (aBLUIParagraph getListPropertiesAsStringWith: self) , '>'
		, (( aBLUIParagraph attributes select: [ :a | a isKindOf: CSNUILabel])
				flatCollect:
					[ :attribute | String crlf , ((self visit: attribute ) indentBy: 4), String crlf ]) 
		, '</' , aBLUIParagraph getSelector , '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIPlaceholder: aBLUIPlaceholder [
	^ self protectString: aBLUIPlaceholder attributeValue
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIRelativeHeight: aBLUIRelativeHeight [
	^ self protectString: aBLUIRelativeHeight attributeValue , '%'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIRelativeWidth: aBLUIRelativeWidth [
	^ self protectString: aBLUIRelativeWidth attributeValue , '%'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUISelect: aBLUISelect [
	^ '<' , (aBLUISelect getListPropertiesAsStringWith: self) , '>', String crlf , '</' , aBLUISelect getSelector , '>' 
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUITitle: aBLUITitle [
	^ self protectString: aBLUITitle attributeValue 
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNUIWidth: aBLUIWidth [
	^ self protectString: aBLUIWidth attributeValue 
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCSNWidget: aBLWidget [
	^ '<' , (aBLWidget getListPropertiesAsStringWith: self) , '>'
		, (('',
			(( aBLWidget widgets)
				flatCollect:
					[ :widget | String crlf , (self visit: widget), String crlf ])) indentBy: 4)
		, '</' , aBLWidget getSelector , '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitMooseModel: aMooseModel [
  | rootPhases rootComponents |
  self root createDirectory.
  
  "Write app.module.ts"currentWriteStream := (self root / aMooseModel getModuleName) asFileReference writeStream.
  self generateModuleSourceCodeForModel: aMooseModel.
  currentWriteStream
     flush;
     close.
  
  "Write app.route.ts"currentWriteStream := (self root / aMooseModel getRouteName) asFileReference writeStream.
  self generateRouteSourceCodeForModel: aMooseModel.
  currentWriteStream
     flush;
     close.
  
  "Write components"rootComponents := self root / 'components' / 'index'.
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
  aMooseModel allCSNPage do: [:aPage |  self clone
           currentPath: self rootPhases / aPage name;
           visit: aPage ] displayingProgress: [:page |  'export page: ' , page codePhase asString ].
  aMooseModel allCSNService do: [:rootElement |  self visit: rootElement ]
]

{ #category : #accessing }
CSNModelExporterAngular >> writeFile: aFileReference withCode: theSourceCode [
	(aFileReference writeStream nextPutAll: theSourceCode) flush
]
