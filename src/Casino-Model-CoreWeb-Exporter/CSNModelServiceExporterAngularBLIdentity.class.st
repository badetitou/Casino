Class {
	#name : #CSNModelServiceExporterAngularBLIdentity,
	#superclass : #CSNModelExporterAngular,
	#traits : 'TCSNExporter',
	#classTraits : 'TCSNExporter classTrait',
	#instVars : [
		'rootFolder',
		'serviceAPINameDictionnary'
	],
	#category : #'Casino-Model-CoreWeb-Exporter-BLIdentity'
}

{ #category : #accessing }
CSNModelServiceExporterAngularBLIdentity >> actionsFolder [

	^ self rootFolder / 'actions'
]

{ #category : #accessing }
CSNModelServiceExporterAngularBLIdentity >> effectsFolder [

	^ self rootFolder / 'effects'
]

{ #category : #generating }
CSNModelServiceExporterAngularBLIdentity >> generateAction: aCSNService [

	self actionsFolder ensureCreateDirectory.
	self actionsFolder / (aCSNService uniqueName , '.actions.ts') writeStreamDo: [ :stream | 
		self currentWriteStream: stream.
		self << 'import { createAction, props } from "@ngrx/store"'.
		self crlf.
		self printServiceDependencies: aCSNService.
		self crlf crlf.

		(aCSNService actions sorted: #uniqueName ascending) do: [ :action | self generateActionAPI: action ] separatedBy: [ self crlf ] ]
]

{ #category : #generating }
CSNModelServiceExporterAngularBLIdentity >> generateActionAPI: action [

	(self << '// ')
		<<< (self uniqueNameOfAPI: action) asUpperSnakeCase;
		crlf.
	(self << 'export const ' << (self uniqueNameOfAPI: action) asUpperSnakeCase <<< ' = "' <<< (self uniqueNameOfAPI: action) asUpperSnakeCase)
		<<< '"';
		crlf.
	(self << 'export const ' << (self uniqueNameOfAPI: action) asUpperSnakeCase <<< '_SUCCESS = "' <<< (self uniqueNameOfAPI: action) asUpperSnakeCase)
		<<< '_SUCCESS"';
		crlf.
	(self << 'export const ' << (self uniqueNameOfAPI: action) asUpperSnakeCase <<< '_FAIL = "' <<< (self uniqueNameOfAPI: action) asUpperSnakeCase)
		<<< '_FAIL"';
		crlf;
		crlf.
	self <<< 'export const ' <<< (self uniqueNameOfAPI: action) <<< ' = createAction'.
	self inParenthesis: [ 
		self
			indentPlus;
			crlf.
		(self << (self uniqueNameOfAPI: action) asUpperSnakeCase)
			<<< ',';
			crlf.
		self << 'props<{ '.
		action parameters
			ifNotEmpty: [ self printParameterOf: action ]
			ifEmpty: [ self <<< 'data?: any' ].
		self <<< ' }>()'.
		self
			indentMinus;
			crlf ].

	self crlf.

	self <<< 'export const ' <<< (self uniqueNameOfAPI: action) <<< 'Success = createAction'.
	self inParenthesis: [ 
		self
			indentPlus;
			crlf.
		(self << (self uniqueNameOfAPI: action) asUpperSnakeCase)
			<<< '_SUCCESS,';
			crlf.
		self << 'props<{ data?: any }>()'.
		self
			indentMinus;
			crlf ].

	self crlf.

	self <<< 'export const ' <<< (self uniqueNameOfAPI: action) <<< 'Fail = createAction'.
	self inParenthesis: [ 
		self
			indentPlus;
			crlf.
		(self << (self uniqueNameOfAPI: action) asUpperSnakeCase)
			<<< '_FAIL,';
			crlf.
		self << 'props<{ error: string }>()'.
		self
			indentMinus;
			crlf ].

	self crlf
]

{ #category : #generating }
CSNModelServiceExporterAngularBLIdentity >> generateEffect: aCSNService [

	self effectsFolder ensureCreateDirectory.
	self effectsFolder / (aCSNService uniqueName , '.effects.ts') writeStreamDo: [ :stream | 
		self currentWriteStream: stream.
		self
			<< 'import { Injectable } from "@angular/core";
import { SpinnerActions, ToasterActions,ToasterType } from "@bl/bl-app-layout";
import { GlobalStoreService } from "@bl/shared";
import { Actions, createEffect, ofType } from "@ngrx/effects";
import { of } from "rxjs";
import { catchError, concatMap, map, switchMap } from "rxjs/operators";';
			crlf.
		self << 'import { '.
		(aCSNService actions sorted: [ :action | (self uniqueNameOfAPI: action) ] ascending)
			do: [ :action | self <<< (self uniqueNameOfAPI: action) <<< ', ' <<< (self uniqueNameOfAPI: action) <<< 'Fail, ' <<< (self uniqueNameOfAPI: action) <<< 'Success' ]
			separatedBy: [ self <<< ', ' ].
		self <<< '} from "../actions/' <<< aCSNService uniqueName <<< '.actions";'.
		self crlf.
		self << 'import { ' <<< aCSNService uniqueName <<< ' } from "../services/' <<< aCSNService getServiceName <<< '";'.
		self
			crlf;
			crlf;
			<< '@Injectable()';
			crlf;
			<< 'export class ';
			<<< (aCSNService uniqueName , 'Effects ').
		self inBraces: [ 
			self << 'constructor(private actions$: Actions, private globalStoreService: GlobalStoreService, '.
			self <<< 'private ' <<< aCSNService name uncapitalized <<< ': ' <<< aCSNService name.

			self
				<<< ') { }';
				crlf;
				crlf.
			(aCSNService actions sorted: [ :action | (self uniqueNameOfAPI: action) ] ascending) do: [ :action | self generateServiceEffectAPI: action ] separatedBy: [ 
				self
					crlf ] ] ]
]

{ #category : #generating }
CSNModelServiceExporterAngularBLIdentity >> generateReducer: aCSNService [

	self reducersFolder ensureCreateDirectory.
	self reducersFolder / (aCSNService uniqueName , '.reducer.ts') writeStreamDo: [ :stream | 
		self currentWriteStream: stream.
		self
			<< 'import { Action, createFeatureSelector, createReducer, createSelector, on } from "@ngrx/store";';
			crlf.
		self << 'import { '.
		(aCSNService actions sorted: [ :action | (self uniqueNameOfAPI: action) ] ascending)
			do: [ :action | self <<< (self uniqueNameOfAPI: action) <<< ', ' <<< (self uniqueNameOfAPI: action) <<< 'Fail, ' <<< (self uniqueNameOfAPI: action) <<< 'Success' ]
			separatedBy: [ self <<< ', ' ].
		self <<< '} from "../actions/' <<< aCSNService uniqueName <<< '.actions";'.
		self
			crlf;
			crlf.
		self << 'export const ' <<< aCSNService uniqueName uncapitalized <<< 'StateName = "_' <<< aCSNService uniqueName uncapitalized <<< 'State"'.
		self
			crlf;
			crlf.
		self << 'export const initial' <<< aCSNService uniqueName <<< 'State = '.
		self inBraces: [ 
			self
				<< 'loading: false,';
				crlf.
			self
				<< 'error: undefined,';
				crlf.
			self << 'data: []' ].
		self
			crlf;
			crlf;
			<< 'const _';
			<<< aCSNService uniqueName uncapitalized;
			<<< 'Reducer = createReducer'.
		self inParenthesis: [ 
			self
				indentPlus;
				crlf.
			(self << 'initial' <<< aCSNService uniqueName)
				<<< 'State,';
				crlf.
			(aCSNService actions sorted: [ :action | (self uniqueNameOfAPI: action) ] ascending) do: [ :action | self generateReducerAPI: action ] separatedBy: [ 
				self
					<<< ',';
					crlf ].
			self
				indentMinus;
				crlf ].
		self
			crlf;
			crlf.
		self << 'export function ' <<< aCSNService uniqueName uncapitalized <<< 'Reducer (state: any, action:Action) '.
		self inBraces: [ self << 'return _' <<< aCSNService uniqueName uncapitalized <<< 'Reducer (state,action)' ].
		'}'.
		self
			crlf;
			crlf.

		self << 'export const get' <<< aCSNService uniqueName <<< 'State = createFeatureSelector<any>(' <<< aCSNService uniqueName uncapitalized <<< 'StateName)' ]
]

{ #category : #generating }
CSNModelServiceExporterAngularBLIdentity >> generateReducerAPI: action [

	self << 'on(' <<< (self uniqueNameOfAPI: action) <<< ', (state, {'.
	self printArgumentsOf: action.
	self <<< '}) =>'.
	self inBraces: [ 
		self << 'return '.
		self inBraces: [ 
			self
				<< '...state,';
				crlf.
			action sortedParameters do: [ :parameter | 
				(self << (parameter name = 'type'
						  ifTrue: [ 'type0' ]
						  ifFalse: [ parameter name ]))
					<<< ',';
					crlf ].
			self << 'loading: true' ] ].
	self
		<<< '),';
		crlf.
	self << 'on(' <<< (self uniqueNameOfAPI: action) <<< 'Success, (state, {data}) =>'.
	self inBraces: [ 
		self << 'return '.
		self inBraces: [ 
			self
				<< '...state,';
				crlf.
			self
				<< 'data,';
				crlf.
			self << 'loading: false' ] ].
	self
		<<< '),';
		crlf.
	self << 'on(' <<< (self uniqueNameOfAPI: action) <<< 'Fail, (state, {error}) =>'.
	self inBraces: [ 
		self << 'return '.
		self inBraces: [ 
			self
				<< '...state,';
				crlf.
			self
				<< 'error,';
				crlf.
			self << 'loading: false' ] ].
	self <<< ')'
]

{ #category : #api }
CSNModelServiceExporterAngularBLIdentity >> generateService: aCSNService [
	self generateServiceFile: aCSNService.
	self generateReducer: aCSNService.
	self generateEffect: aCSNService.
	self generateAction: aCSNService.
]

{ #category : #generating }
CSNModelServiceExporterAngularBLIdentity >> generateServiceAPI: aServiceAPI [
		self
		<< '// TODO: Please check this service';
		crlf.
	self << 'public ' <<< (self uniqueNameOfAPI: aServiceAPI) <<< '('.
	self printParameterOf: aServiceAPI.

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

{ #category : #'generating - effect' }
CSNModelServiceExporterAngularBLIdentity >> generateServiceEffectAPI: aServiceAPI [

	self generateServiceEffectDefaultAPI: aServiceAPI.
	self crlf crlf.
	self generateServiceEffectSuccessAPI: aServiceAPI.
	self crlf crlf.
	self generateServiceEffectFailAPI: aServiceAPI.
	self crlf
]

{ #category : #'generating - effect' }
CSNModelServiceExporterAngularBLIdentity >> generateServiceEffectDefaultAPI: aServiceAPI [

	"effect"

	self << (self uniqueNameOfAPI: aServiceAPI) <<< '$ = createEffect'.
	self inParenthesis: [ 
		self
			indentPlus;
			<<< '() =>';
			crlf;
			<< 'this.actions$.pipe'.
		self
			inParenthesis: [ 
				self
					indentPlus;
					crlf;
					<< 'ofType(';
					<<< (self uniqueNameOfAPI: aServiceAPI);
					<<< '),';
					crlf;
					<< 'switchMap'.
				self
					inParenthesis: [ 
						self indentPlus.
						self <<< '({'.
						self printArgumentsOf: aServiceAPI.
						self
							<<< '}) => {';
							indentPlus;
							crlf;
							<< 'this.globalStoreService.emitAction(SpinnerActions.show.type,{hidding:false})';
							crlf;
							<< 'return this.';
							<<< aServiceAPI serviceOwner uniqueName uncapitalized;
							<<< '.';
							<<< (self uniqueNameOfAPI: aServiceAPI);
							<<< '('.
						self printArgumentsOf: aServiceAPI.
						self
							<<< ')';
							<<< '.pipe'.
						self inParenthesis: [ 
							self
								indentPlus;
								crlf.
							self << 'switchMap(async (data: any)=>'.
							self inBraces: [ 
								self
									<< 'return ';
									<<< ((self uniqueNameOfAPI: aServiceAPI) , 'Success');
									<<< '({data});' ].
							self
								<<< '),';
								crlf;
								<< 'catchError((error: string) => of(';
								<<< ((self uniqueNameOfAPI: aServiceAPI) , 'Fail');
								<<< '({error})))'.
							self
								indentMinus;
								crlf ].
						self
							crlf;
							indentMinus;
							<< '}'.
						self
							indentMinus;
							crlf ];
					indentMinus;
					crlf ];
			indentMinus;
			crlf ]
]

{ #category : #'generating - effect' }
CSNModelServiceExporterAngularBLIdentity >> generateServiceEffectFailAPI: aServiceAPI [

	"effect"

	self << (self uniqueNameOfAPI: aServiceAPI) <<< 'Fail$ = createEffect'.
	self inParenthesis: [ 
		self
			indentPlus;
			<<< '() =>';
			crlf;
			<< 'this.actions$.pipe'.
		self inParenthesis: [ 
			self
				indentPlus;
				crlf;
				<< 'ofType(';
				<<< (self uniqueNameOfAPI: aServiceAPI);
				<<< 'Fail';
				<<< '),';
				crlf;
				<< 'map'.
			self
				inParenthesis: [ 
					self indentPlus.
					self
						<<< '({error}) => {';
						indentPlus;
						crlf;
						<< 'this.globalStoreService.emitAction(ToasterActions.showToaster.type, {toasterType: ToasterType.error, message: "Erreur : " + error})';
						crlf;
						<< 'this.globalStoreService.emitAction(SpinnerActions.hide.type, {})'.
					self
						crlf;
						indentMinus;
						<< '}'.
					self
						indentMinus;
						crlf ];
				indentMinus;
				crlf ].
		self <<< ',{dispatch:false}'.
		self
			indentMinus;
			crlf ]
]

{ #category : #'generating - effect' }
CSNModelServiceExporterAngularBLIdentity >> generateServiceEffectSuccessAPI: aServiceAPI [

	"effect"

	self << (self uniqueNameOfAPI: aServiceAPI) <<< 'Success' <<< '$ = createEffect'.
	self inParenthesis: [ 
		self
			indentPlus;
			<<< '() =>';
			crlf;
			<< 'this.actions$.pipe'.
		self inParenthesis: [ 
			self
				indentPlus;
				crlf;
				<< 'ofType(';
				<<< ((self uniqueNameOfAPI: aServiceAPI) , 'Success');
				<<< '),';
				crlf;
				<< 'map'.
			self
				inParenthesis: [ 
					self indentPlus.
					self
						<<< '() => {';
						indentPlus;
						crlf.
					self
						<< 'this.globalStoreService.emitAction(ToasterActions.showToaster.type, {toasterType: ToasterType.success, message: "Success"})';
						crlf;
						<< 'this.globalStoreService.emitAction(SpinnerActions.hide.type, {})'.
					self
						crlf;
						indentMinus;
						<< '}'.
					self
						indentMinus;
						crlf ];
				indentMinus;
				crlf ].
		self
			<<< ',{dispatch:false}';
			indentMinus;
			crlf ]
]

{ #category : #generating }
CSNModelServiceExporterAngularBLIdentity >> generateServiceFile: aCSNService [

	self serviceFolder ensureCreateDirectory.
	self serviceFolder / aCSNService getTSName writeStreamDo: [ :stream | 
		self currentWriteStream: stream.
		self
			<< 'import { Injectable } from ''@angular/core'';

import { Observable } from ''rxjs'';
import { first, map } from ''rxjs/operators'';

import { HttpClient, HttpHeaders, HttpParams } from ''@angular/common/http'';
import { ObjectMapper } from ''@outfoxx/jackson-js'';
import { MapToStringJsonConverterService } from ''src/app/main/shared/services/map-to-string-json-converter.service'';
';
			crlf;
			crlf.

		self printServiceDependencies: aCSNService.

		self << '/**
 * Generated By Casino
 *
 * @author Benoît Verhaeghe
 */
@Injectable()
export class ' << aCSNService uniqueName << ' {

    private objectMapper: ObjectMapper;

    constructor(private http: HttpClient,
        private mapToStringConverter: MapToStringJsonConverterService) {
        this.objectMapper = new ObjectMapper({},
            { features: { deserialization: { FAIL_ON_UNKNOWN_PROPERTIES: false } }});
    }

'.
		(aCSNService actions sorted: [ :action | (self uniqueNameOfAPI: action) ] ascending)
			do: [ :action | 
				self indentPlus.
				self generateServiceAPI: action.
				self indentMinus ]
			separatedBy: [ self crlf ].
		self
			<< '}';
			crlf ]
]

{ #category : #generating }
CSNModelServiceExporterAngularBLIdentity >> initialize [
	super initialize.
	serviceAPINameDictionnary := Dictionary new
]

{ #category : #generating }
CSNModelServiceExporterAngularBLIdentity >> printArgumentsOf: action [

	action sortedParameters do: [ :parameter | self <<< (parameter name = 'type' ifTrue: [ 'type0' ] ifFalse: [ parameter name ]) ] separatedBy: [ self <<< ', ' ]
]

{ #category : #generating }
CSNModelServiceExporterAngularBLIdentity >> printParameterOf: action [
	action sortedParameters
		do: [ :parameter | 
			self <<< (parameter name = 'type' ifTrue: [ 'type0' ] ifFalse: [ parameter name ]) <<< ': '.
			parameter dataType ifNotNil: [ :dataType | dataType writeBusinessTypeOn: self ] ifNil: [ self << 'any' ] ]
		separatedBy: [ self <<< ', ' ]
]

{ #category : #generating }
CSNModelServiceExporterAngularBLIdentity >> printServiceDependencies: aCSNService [
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

{ #category : #accessing }
CSNModelServiceExporterAngularBLIdentity >> reducersFolder [

	^ self rootFolder / 'reducers'
]

{ #category : #accessing }
CSNModelServiceExporterAngularBLIdentity >> rootFolder [

	^ rootFolder
]

{ #category : #accessing }
CSNModelServiceExporterAngularBLIdentity >> rootFolder: anObject [

	rootFolder := anObject
]

{ #category : #accessing }
CSNModelServiceExporterAngularBLIdentity >> serviceFolder [

	^ self rootFolder / 'services'
]

{ #category : #accessing }
CSNModelServiceExporterAngularBLIdentity >> uniqueNameOfAPI: aServiceAPI [

	^ serviceAPINameDictionnary at: aServiceAPI ifAbsentPut: [ 
		| index potentialName |
		index := 0.
		potentialName := aServiceAPI name.
		[ (serviceAPINameDictionnary includes: potentialName) or: [ self uniqueNameOfAPIReservedName includes: potentialName ] ] whileTrue: [ 
			potentialName := (potentialName removeSuffix: index asString) , index asString.
			index := index + 1 ].
		potentialName ]
]

{ #category : #accessing }
CSNModelServiceExporterAngularBLIdentity >> uniqueNameOfAPIReservedName [

	^ { 'delete' }
]
