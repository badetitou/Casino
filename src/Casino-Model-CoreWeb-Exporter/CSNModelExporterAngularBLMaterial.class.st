"
We use this class for the export of the code using a possible new shell
"
Class {
	#name : #CSNModelExporterAngularBLMaterial,
	#superclass : #CSNModelExporterAngular,
	#category : #'Casino-Model-CoreWeb-Exporter-BLMaterial'
}

{ #category : #actions }
CSNModelExporterAngularBLMaterial class >> export: aBLMooseModel [
	self new
		model: aBLMooseModel;
		exporterAngularConfiguration: CSNExporterAngularMaterialConfiguration new;
		export
]

{ #category : #accessing }
CSNModelExporterAngularBLMaterial >> behaviorImportExporter [
	^ CSNModelNullImportStringExporter
]

{ #category : #accessing }
CSNModelExporterAngularBLMaterial >> behaviorInitializeVariableExporter [
	^ CSNModelNullInitializeVariableExporter
]

{ #category : #accessing }
CSNModelExporterAngularBLMaterial >> behaviorModelExporter [
	^ CSNBehaviorModelExporterCoreWeb
]

{ #category : #accessing }
CSNModelExporterAngularBLMaterial >> businessExporter [
	^ CSNBusinessExporter
]

{ #category : #visiting }
CSNModelExporterAngularBLMaterial >> generateCoreStoreModule: aMooseModel [

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
			aMooseModel allCSNService
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
CSNModelExporterAngularBLMaterial >> generateHTMLSourceCodeForBusinessPage: aBLPageMetier [
  aBLPageMetier metiers ifNotEmpty: [ currentWriteStream
           << '<mat-tab-group>';
           << String crlf.
        aBLPageMetier metiers do: [:metier |  currentWriteStream
                 << '     <mat-tab label=';
                 << (self class convertIfString: (self protectString: metier title));
                 << '>';
                 << String crlf;
                 << '        ';
                 << metier getTag;
                 << String crlf;
                 << '    </mat-tab>';
                 << String crlf ].
        currentWriteStream
           << '</mat-tab-group>';
           << String crlf ].
  aBLPageMetier layout
		ifNotNil: [ self visit: aBLPageMetier layout ]
		ifNil: [ 
			aBLPageMetier widgets
				reject: [ :widget | widget isPageMetier ]
				thenDo: [ :widget | 
					self visit: widget.
					currentWriteStream << String crlf ] ]
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
	currentWriteStream << '</mat-tab-group>'
]

{ #category : #visiting }
CSNModelExporterAngularBLMaterial >> generateHTMLSourceCodeForNoPageMetierForPage: aCSNPage [

	aCSNPage widgets do: [ :widget | 
		self visit: widget.
		currentWriteStream << String crlf ]
]

{ #category : #visiting }
CSNModelExporterAngularBLMaterial >> generateTSSourceCodeForBusinessPage: aBLPageMetier [

	| calledActions behaviors |
	self writeBusinessPageImportList.
	aBLPageMetier collectPhaseCalled ifNotEmpty: [ 
		self writeImportForNavigation ].
	currentWriteStream
		<<
			(String crlf join: (((aBLPageMetier widgetsDependenciesFrom: self)
					   , (aBLPageMetier calledBehavior flatCollect: [ :behavior | 
								    self behaviorImportExporter
									    export: behavior
									    withContext: self context
									    andConfiguration: self exporterAngularConfiguration ])
							   flattened) asSet asOrderedCollection sorted: [ :a :d | 
							  a < d ]));
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
		<< aBLPageMetier componentName;
		<< ' implements OnInit, OnDestroy {

';
		<< (aBLPageMetier collectPhaseCalled flatCollect: [ :phase | 
					 '    public ' , phase getAcceptedName , ': Phase;' , String crlf ]);
		<< ((aBLPageMetier calledBehavior flatCollect: [ :action | 
					  action behavior flatCollect: [ :behavior | 
							  (behavior allToScope: CSNBDOMElementAcccess) collect: #widget ] ])
				 asSet collect: [ :widget | widget idViewChildFrom: self ])
				asOrderedCollection;
		<< '
'.
	self inIndented: [ 
		aBLPageMetier recursiveWidgets removeDuplicates flattened do: [ 
			:widget | 
			(self exporterAngularConfiguration angularRepresentationOf: widget)
				exportTypeScriptVariableOf: widget
				usingExporter: self ] ].
	self
		<< '

    constructor(';
		<< (aBLPageMetier collectPhaseCalled ifNotEmpty: [ 
					 ' protected _desktopStateService: DesktopStateService, private _phaseService: PhaseService, ' ]);
		<<
			(', ' join: ((aBLPageMetier calledBehavior collect: [ :behavior | 
							   self behaviorInitializeVariableExporter
								   export: behavior
								   withContext: self context
								   andConfiguration: self exporterAngularConfiguration ])
						  flattened reject: #isEmpty) flattened asOrderedCollection
						 removeDuplicates);
		<< ') {
';
		<< (aBLPageMetier collectPhaseCalled flatCollect: [ :phase | 
					 '        this.' , phase getAcceptedName
					 , ' = this._phaseService.getPhase(''' , phase getAcceptedName
					 , ''');' , String crlf ]);
		<< '
    }

    public ngOnInit(): void {
    }

    public ngOnDestroy(): void {

    }
'.
	aBLPageMetier collectPhaseCalled ifNotEmpty: [ 
		self writeOpenPhaseMethod ].
	currentWriteStream << '

'.
	calledActions := (aBLPageMetier calledBehavior asOrderedCollection 
		                  reject: [ :action | action behavior isEmpty ]) 
		                 sort: [ :action1 :action2 | 
			                 (action1 behavior anyOne uniqueNameInPage:
				                  aBLPageMetier)
			                 <
			                 (action2 behavior anyOne uniqueNameInPage:
				                  aBLPageMetier) ].
	behaviors := calledActions flatCollect: #behavior.
	(behaviors asSet asOrderedCollection sorted: [ :b1 :b2 | 
		 b1 name < b2 name ]) do: [ :behaveMethod | 
		self crlf.
		(self behaviorModelExporter
			 on: self currentWriteStream
			 withIndentLevel: 1)
			exporterAngularConfiguration: self exporterAngularConfiguration;
			currentPage: aBLPageMetier;
			export: behaveMethod.
		self crlf ].
	self
		crlf;
		<<< '}';
		crlf
]

{ #category : #accessing }
CSNModelExporterAngularBLMaterial >> initialize [

	super initialize.
	serviceExporter := CSNModelServiceExporterAngularCoreWeb new
]

{ #category : #visiting }
CSNModelExporterAngularBLMaterial >> visitCSNService: aCSNService [

	self serviceExporter
		rootFolder: self serviceRoot;
		generateService: aCSNService
]

{ #category : #visiting }
CSNModelExporterAngularBLMaterial >> visitMooseModel: aMooseModel [

	super visitMooseModel: aMooseModel.
	currentWriteStream := (self root / 'service-globals.ts')
		                      asFileReference writeStream.
	self serviceExporter
		currentWriteStream: currentWriteStream;
		generateServiceGlobals.
	currentWriteStream
		flush;
		close
]
