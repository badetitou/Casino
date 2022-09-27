Class {
	#name : #CSNModelServiceExporterAngularCoreWeb,
	#superclass : #CSNModelServiceExporter,
	#traits : 'TCSNExporter',
	#classTraits : 'TCSNExporter classTrait',
	#instVars : [
		'rootFolder',
		'isParentService',
		'isChildService',
		'parentService',
		'parentServicePackagesRootName'
	],
	#category : #'Casino-Model-CoreWeb-Exporter-CoreWeb'
}

{ #category : #streaming }
CSNModelServiceExporterAngularCoreWeb >> generateService: aCSNService [
	aCSNService accept: self
]

{ #category : #streaming }
CSNModelServiceExporterAngularCoreWeb >> generateServiceGlobals [

	self <<< 'import { HttpHeaders } from ''@angular/common/http'';
import { JsonParser, JsonStringifier } from ''@outfoxx/jackson-js'';

export const jsonParser = new JsonParser({
    features: {
        deserialization: {
            FAIL_ON_UNKNOWN_PROPERTIES: true,
            FAIL_ON_INVALID_SUBTYPE: true,
            FAIL_ON_MISSING_TYPE_ID: true,
            FAIL_ON_UNRESOLVED_OBJECT_IDS: true,
        },
    },
});

export const jsonStringifier = new JsonStringifier();
'
]

{ #category : #streaming }
CSNModelServiceExporterAngularCoreWeb >> getLocalPathOf: aService [

	^ String streamContents: [ :stream | 
		stream << 'services/'.
		(aService parentServicePackagesUntil:
			 self parentServicePackagesRootName) do: [ :package | 
			stream
				<< package name;
				<< '/' ].

		stream << aService getServiceName ]
]

{ #category : #initialization }
CSNModelServiceExporterAngularCoreWeb >> initialize [
	super initialize.
	parentServicePackagesRootName := 'service'
]

{ #category : #accessing }
CSNModelServiceExporterAngularCoreWeb >> parentServicePackagesRootName [

	^ parentServicePackagesRootName
]

{ #category : #accessing }
CSNModelServiceExporterAngularCoreWeb >> parentServicePackagesRootName: anObject [

	parentServicePackagesRootName := anObject
]

{ #category : #streaming }
CSNModelServiceExporterAngularCoreWeb >> printConstructorFor: aCSNService [

	self << 'constructor('.
	isParentService ifTrue: [ 
		isChildService ifFalse: [ self <<< 'protected ' ].
		self <<< 'serviceName: string, ' ].
	isChildService ifFalse: [ self <<< 'protected ' ].
	self <<< 'http: HttpClient) {'.
	isChildService ifTrue: [ 
		self
			indentPlus;
			crlf;
			<< 'super('.
		isParentService
			ifTrue: [ self <<< 'serviceName' ]
			ifFalse: [ self <<< $" <<< aCSNService targetPoint <<< $" ].
		self
			<<< ', http);';
			crlf;
			indentMinus;
			indent ].
	self <<< $}
]

{ #category : #streaming }
CSNModelServiceExporterAngularCoreWeb >> printCreateParamsFor: aCSNServiceAPI [

	self inBraces: [ 
		aCSNServiceAPI sortedParameters
			do: [ :parameter | 
				self << parameter name <<< ': '.
				parameter dataType
					printServiceSerializeOn: self
					named: parameter acceptedName uncapitalized ]
			separatedBy: [ 
				self <<< $,.
				self crlf ] ]
]

{ #category : #streaming }
CSNModelServiceExporterAngularCoreWeb >> printDeserialize: aBusinessType [

	self
		<<< 'jsonParser.transform(res, ';
		inBraces: [ 
			self << 'mainCreator: () => ['.
			aBusinessType printJsonClassTypeOn: self.
			self <<< ']' ].
	self <<< ');'
]

{ #category : #streaming }
CSNModelServiceExporterAngularCoreWeb >> printDeserializeFor: aBusinessType [

	self <<< 'jsonParser.transform(res, ' inBraces: [ 
		self << 'mainCreator: () => ['.
		aBusinessType printJsonClassTypeOn: self.
		self <<< ']' ].
	self <<< ')'
]

{ #category : #'as yet unclassified' }
CSNModelServiceExporterAngularCoreWeb >> printHttpOptions [
	self indent.
	self inBraces: [ 
		self
			<<
				'headers: new HttpHeaders({ ''Content-Type'': ''application/json'' }),';
			crlf.
		self
			<< 'withCredentials: true,';
			crlf.
		self
			<< 'params: ';
			inBraces: [ self << '"fieldNames[]" : fieldNames' ] ]
]

{ #category : #streaming }
CSNModelServiceExporterAngularCoreWeb >> printImportsFor: aCSNService [

	| hasReturnBusinessType hasParameterBusinessType hasParameterComplexeType |
	hasReturnBusinessType := aCSNService actions anySatisfy: [ :action | 
		                         action dataType innerTypeDependencies flattened
			                         anySatisfy: [ :typeDependency | 
			                         typeDependency isBusinessType ] ].
	hasParameterBusinessType := aCSNService actions anySatisfy: [ :action | 
		                            action parameters anySatisfy: [ 
			                            :parameter | 
			                            parameter dataType
				                            innerTypeDependencies flattened anySatisfy: [ 
				                            :typeDependency | 
				                            typeDependency isBusinessType ] ] ].
	hasParameterComplexeType := aCSNService actions anySatisfy: [ :action | 
		                            action parameters anySatisfy: [ 
			                            :parameter | 
			                            parameter dataType isComplexType ] ].
	self
		<< 'import { Injectable } from ''@angular/core'';';
		crlf.
	self
		<<
			'import { HttpClient, HttpHeaders } from ''@angular/common/http'';';
		crlf;
		crlf;
		<< 'import { Observable } from ''rxjs'';';
		crlf;
		<< 'import { first'.
	hasReturnBusinessType ifTrue: [ self <<< ', map' ].
	self
		<<< ' } from ''rxjs/operators'';';
		crlf;
		crlf;
		<< 'import { '.
	hasReturnBusinessType ifTrue: [ self <<< 'jsonParser,' ].
	(hasParameterBusinessType or: [ hasParameterComplexeType ]) ifTrue: [ 
		self <<< ' jsonStringifier,' ].
	self <<< ' } from '''.
	(aCSNService parentServicePackagesUntil:
		 self parentServicePackagesRootName) do: [ :package | 
		self <<< '../' ].
	self
		<<< '../service-globals'';';
		crlf;
		crlf;
		printServiceDependencies: aCSNService.
	isChildService ifFalse: [ ^ self ].
	self crlf.
	self << 'import { ' <<< parentService name <<< ' } from '''.
	(aCSNService parentServicePackagesUntil:
		 self parentServicePackagesRootName)
		ifEmpty: [ self <<< './' ]
		ifNotEmpty: [ :parentPackages | 
		parentPackages do: [ :package | self <<< '../' ] ].
	(parentService parentServicePackagesUntil:
		 self parentServicePackagesRootName) do: [ :parentServicePackage | 
		self <<< parentServicePackage name <<< '/' ].
	self <<< parentService getServiceName <<< ''';'
]

{ #category : #streaming }
CSNModelServiceExporterAngularCoreWeb >> printServiceAnnotations [

	self << '@Injectable()'
]

{ #category : #streaming }
CSNModelServiceExporterAngularCoreWeb >> printServiceDependencies: aCSNService [

	aCSNService dependencies ifNotEmpty: [ :dependencies | 
		self
			<< 'import ';
			inBraces: [ 
				(dependencies sorted: #name ascending)
					do: [ :dependency | self << dependency name ]
					separatedBy: [ 
						self
							<<< ',';
							crlf ] ].
		self <<< ' from '''.
		(aCSNService parentServicePackagesUntil:
			 self parentServicePackagesRootName) do: [ :package | 
			self <<< '../' ].
		self <<< '../models'';' ]
]

{ #category : #streaming }
CSNModelServiceExporterAngularCoreWeb >> printServiceDocumentation [

	self
		<< '/**';
		crlf;
		<< ' * @author Generated by [Casino](https://github.com/badetitou/Casino)';
		crlf;
		<< ' */'
]

{ #category : #accessing }
CSNModelServiceExporterAngularCoreWeb >> rootFolder [

	^ rootFolder
]

{ #category : #accessing }
CSNModelServiceExporterAngularCoreWeb >> rootFolder: anObject [

	rootFolder := anObject
]

{ #category : #streaming }
CSNModelServiceExporterAngularCoreWeb >> rootServiceName [
	^ 'RemoteService'
]

{ #category : #streaming }
CSNModelServiceExporterAngularCoreWeb >> visitCSNService: aCSNService [
	| directory |
	"Check if aCSNService is a parent service"

	isParentService := aCSNService childServices isNotEmpty.

	"Check if aCSNService is a child service to a parent other than the root"
	"I go two times up .
	GWT impl -> GWT interface -> rootService interface"
	isChildService := aCSNService parentService isNotNil.
	parentService := isChildService ifTrue: [ aCSNService parentService ].
	directory := self rootFolder.
	(aCSNService parentServicePackagesUntil: self parentServicePackagesRootName) do: [:package | 
		directory := directory / package name
		].
	directory ensureCreateDirectory.
	(directory / aCSNService getTSName)
		deleteIfAbsent: nil;
		writeStreamDo: [ :stream | 
			self currentWriteStream: stream.

			self
				printImportsFor: aCSNService;
				crlf;
				crlf;
				printServiceDocumentation;
				crlf.
			"self flag: 'BVER badetitou - Since it cannot be abstract, must be injectable (see next issue)'"
			"isParentService ifFalse: ["
			self
				printServiceAnnotations;
				crlf. "]."
			self << 'export '.
			"self flag: 'BVER badetitou - Cannot be abstract or it cannot be used as a Provider in Angular (and so error)'"
			"isParentService ifTrue: [ self <<< 'abstract ' ]."
			self
				<<< 'class ';
				<<< aCSNService uniqueName.
			isChildService ifTrue: [ 
				self
					<<< ' extends ';
					<<< parentService uniqueName ].
			self
				<<< ' {';
				indentPlus;
				crlf;
				crlf;
				printConstructorFor: aCSNService;
				crlf;
				crlf.

			aCSNService sortedActions
				do: [ :action | action accept: self ]
				separatedBy: [ 
					self
						crlf;
						crlf ].

			self
				indentMinus;
				crlf;
				<< '}';
				crlf ]
]

{ #category : #streaming }
CSNModelServiceExporterAngularCoreWeb >> visitCSNServiceAPI: aServiceAPI [

	self << 'public ' <<< aServiceAPI uniqueName <<< '('.
	aServiceAPI printParameterIn: self.
	aServiceAPI parameters ifNotEmpty: [ self <<< ', ' ].
	self <<< 'fieldNames = ''**''): Observable<'.
	aServiceAPI dataType writeBusinessTypeOn: self.
	self
		<<< '> {';
		inIndented: [ 
			self << 'return this.http.post<'.
			aServiceAPI dataType writeBusinessTypeOn: self.
			self
				<<< '>(';
				inIndented: [ 
					self << '"/rest-csn/'.
					isParentService
						ifTrue: [ self <<< '" + this.serviceName + "' ]
						ifFalse: [ self <<< aServiceAPI serviceOwner targetPoint ].
					self <<< $/ <<< aServiceAPI uniqueName <<< '",'.
					self
						crlf;
						indent;
						printCreateParamsFor: aServiceAPI;
						<<< $,;
						crlf.
					self printHttpOptions ];
				<< ').pipe(first()'.
			(aServiceAPI dataType innerType isBusinessType or: [ 
				 aServiceAPI dataType isSetType ]) ifTrue: [ 
				self
					<<< ',';
					inIndented: [ 
						self << 'map(res => '.
						aServiceAPI dataType printServiceDeserializeOn: self.
						self <<< $) ];
					indent ].
			self <<< ');' ];
		<< $}
]
