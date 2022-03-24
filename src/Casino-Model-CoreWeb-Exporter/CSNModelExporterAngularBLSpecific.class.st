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
					 '        this.' , phase name
					 , ' = this._phaseService.getPhase(''' , phase name , ''');'
					 , String crlf ]);
		<< '
    }

    public ngOnInit(): void {
';
		<< (aBLPageMetier recursiveWidgets flattened flatCollect:
					 #getInitializations);
		<< '
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
CSNModelExporterAngularBLSpecific >> printServiceDependencies: aCSNService [
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

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> visitCSNService: aCSNService [
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
 *
 * @author Generated By Casino
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

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> visitCSNServiceAPI: aServiceAPI [
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

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> visitMooseModel: aMooseModel [
	super visitMooseModel: aMooseModel.
]
