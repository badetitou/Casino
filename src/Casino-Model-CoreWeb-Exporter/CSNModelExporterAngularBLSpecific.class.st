"
I export the UI, the services, and the behavior of applications.

```
CSNModelExporterAngularBLSpecific export: gwtModel.
```

"
Class {
	#name : #CSNModelExporterAngularBLSpecific,
	#superclass : #CSNModelExporterAngular,
	#category : #'Casino-Model-CoreWeb-Exporter-CoreWeb'
}

{ #category : #actions }
CSNModelExporterAngularBLSpecific class >> export: aBLMooseModel [
	self new
		model: aBLMooseModel;
		exporterAngularConfiguration: CSNExporterAngularCoreWeb2Configuration new;
		export
]

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> behaviorImportExporter [
	^ CSNModelImportStringExporter
]

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> behaviorInitializeVariableExporter [
	^ CSNModelInitializeVariableExporter
]

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> behaviorModelExporter [
	^ CSNBehaviorModelExporterCoreWeb
]

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> businessExporter [
	^ CSNBusinessExporter
]

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> generateTSSourceCodeForBusinessPage: aBLPageMetier [

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
					 '    public ' , phase name , ': Phase;' , String crlf ]);
		<< ((aBLPageMetier calledBehavior flatCollect: [ :action | 
					  action behavior flatCollect: [ :behavior | 
							  (behavior allToScope: CSNBDOMElementAcccess) collect: #widget ] ])
				 asSet collect: [ :widget | widget idViewChildFrom: self ])
				asOrderedCollection;
		<< '
'.

	self printTSVariablesForComponent: aBLPageMetier.
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
					 '        this.' , phase name
					 , ' = this._phaseService.getPhase(''' , phase name , ''');'
					 , String crlf ]);
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

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> initialize [

	super initialize.
	serviceExporter := CSNModelServiceExporterAngularCoreWeb new
]

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> visitCSNService: aCSNService [

	self serviceExporter
		rootFolder: self serviceRoot;
		generateService: aCSNService
]

{ #category : #visiting }
CSNModelExporterAngularBLSpecific >> visitMooseModel: aMooseModel [

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
